import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'database.g.dart';

class Expenses extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(max: 200)();
  TextColumn get description => text().withLength(max: 1000)();
  TextColumn get transactionType => text().withLength(min: 1, max: 100)();
  TextColumn get subscriptionFrequency => text().withLength(min: 0, max: 10)();
  RealColumn get amount => real()();
  DateTimeColumn get timestamp => dateTime()();
  DateTimeColumn get subscriptionDate => dateTime()();
}

@DriftDatabase(tables: [Expenses])
class ExpensesDatabase extends _$ExpensesDatabase {
  // we tell the database where to store the data with this constructor
  ExpensesDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;

  Future<List<Expense>> getExpenses() {
    final date = DateTime.now();
    return (select(expenses)
          ..where((tbl) {
            final wherelist = <Expression<bool>>[
              tbl.transactionType.equals("transaction"),
              expenses.timestamp.isBetweenValues(
                  DateTime(date.year, date.month, 1),
                  DateTime(date.year, date.month + 1, 0))
            ];
            return wherelist.reduce((clause, condition) => clause & condition);
          }))
        .get();
  }

  Future<List<Expense>> getUpcomingExpenses() {
    final dateToday = DateTime.now();
    return (select(expenses)
          ..where((tbl) {
            final wherelist = <Expression<bool>>[
              tbl.transactionType.equals("subscription") &
                  ((tbl.subscriptionFrequency.equals("monthly") |
                      (tbl.subscriptionFrequency.equals("yearly") &
                          tbl.subscriptionDate.isBetweenValues(
                              DateTime(dateToday.year, dateToday.month, 1),
                              DateTime(
                                  dateToday.year, dateToday.month + 1, 0)))))
            ];
            return wherelist.reduce((clause, condition) => clause & condition);
          }))
        .get();
  }

  Future<double?> currentExpenditure(DateTime date) {
    final amountSum = expenses.amount.sum();
    final query = (selectOnly(expenses)
      ..where(expenses.transactionType.equals('transaction') &
          expenses.timestamp.isBetweenValues(DateTime(date.year, date.month, 1),
              DateTime(date.year, date.month + 1, 0)))
      ..addColumns([amountSum]));
    return query.map((row) => row.read(amountSum)).getSingle();
  }

  Future<double> subscriptionCharges(DateTime date) {
    return customSelect("""SELECT SUM(amount) as "amount"  from 
      (
        SELECT amount from expenses where (transaction_type = 'subscription') and (subscription_frequency = 'monthly') 
        UNION ALL
        SELECT amount from expenses where (transaction_type = 'subscription') and (subscription_frequency = 'yearly') and strftime('%m',datetime(subscription_date,'unixepoch')) = strftime('%m',DATE(DATE(),'+1 month'))
      )""").map((p0) {
      return p0.read<double>("amount");
    }).getSingle();
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
