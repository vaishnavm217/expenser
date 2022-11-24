// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Expense extends DataClass implements Insertable<Expense> {
  final int id;
  final String title;
  final String description;
  final String transactionType;
  final String subscriptionFrequency;
  final double amount;
  final DateTime timestamp;
  final DateTime subscriptionDate;
  const Expense(
      {required this.id,
      required this.title,
      required this.description,
      required this.transactionType,
      required this.subscriptionFrequency,
      required this.amount,
      required this.timestamp,
      required this.subscriptionDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['transaction_type'] = Variable<String>(transactionType);
    map['subscription_frequency'] = Variable<String>(subscriptionFrequency);
    map['amount'] = Variable<double>(amount);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['subscription_date'] = Variable<DateTime>(subscriptionDate);
    return map;
  }

  ExpensesCompanion toCompanion(bool nullToAbsent) {
    return ExpensesCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      transactionType: Value(transactionType),
      subscriptionFrequency: Value(subscriptionFrequency),
      amount: Value(amount),
      timestamp: Value(timestamp),
      subscriptionDate: Value(subscriptionDate),
    );
  }

  factory Expense.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Expense(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      transactionType: serializer.fromJson<String>(json['transactionType']),
      subscriptionFrequency:
          serializer.fromJson<String>(json['subscriptionFrequency']),
      amount: serializer.fromJson<double>(json['amount']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      subscriptionDate: serializer.fromJson<DateTime>(json['subscriptionDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'transactionType': serializer.toJson<String>(transactionType),
      'subscriptionFrequency': serializer.toJson<String>(subscriptionFrequency),
      'amount': serializer.toJson<double>(amount),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'subscriptionDate': serializer.toJson<DateTime>(subscriptionDate),
    };
  }

  Expense copyWith(
          {int? id,
          String? title,
          String? description,
          String? transactionType,
          String? subscriptionFrequency,
          double? amount,
          DateTime? timestamp,
          DateTime? subscriptionDate}) =>
      Expense(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        transactionType: transactionType ?? this.transactionType,
        subscriptionFrequency:
            subscriptionFrequency ?? this.subscriptionFrequency,
        amount: amount ?? this.amount,
        timestamp: timestamp ?? this.timestamp,
        subscriptionDate: subscriptionDate ?? this.subscriptionDate,
      );
  @override
  String toString() {
    return (StringBuffer('Expense(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('transactionType: $transactionType, ')
          ..write('subscriptionFrequency: $subscriptionFrequency, ')
          ..write('amount: $amount, ')
          ..write('timestamp: $timestamp, ')
          ..write('subscriptionDate: $subscriptionDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, transactionType,
      subscriptionFrequency, amount, timestamp, subscriptionDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Expense &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.transactionType == this.transactionType &&
          other.subscriptionFrequency == this.subscriptionFrequency &&
          other.amount == this.amount &&
          other.timestamp == this.timestamp &&
          other.subscriptionDate == this.subscriptionDate);
}

class ExpensesCompanion extends UpdateCompanion<Expense> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> transactionType;
  final Value<String> subscriptionFrequency;
  final Value<double> amount;
  final Value<DateTime> timestamp;
  final Value<DateTime> subscriptionDate;
  const ExpensesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.transactionType = const Value.absent(),
    this.subscriptionFrequency = const Value.absent(),
    this.amount = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.subscriptionDate = const Value.absent(),
  });
  ExpensesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required String transactionType,
    required String subscriptionFrequency,
    required double amount,
    required DateTime timestamp,
    required DateTime subscriptionDate,
  })  : title = Value(title),
        description = Value(description),
        transactionType = Value(transactionType),
        subscriptionFrequency = Value(subscriptionFrequency),
        amount = Value(amount),
        timestamp = Value(timestamp),
        subscriptionDate = Value(subscriptionDate);
  static Insertable<Expense> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? transactionType,
    Expression<String>? subscriptionFrequency,
    Expression<double>? amount,
    Expression<DateTime>? timestamp,
    Expression<DateTime>? subscriptionDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (transactionType != null) 'transaction_type': transactionType,
      if (subscriptionFrequency != null)
        'subscription_frequency': subscriptionFrequency,
      if (amount != null) 'amount': amount,
      if (timestamp != null) 'timestamp': timestamp,
      if (subscriptionDate != null) 'subscription_date': subscriptionDate,
    });
  }

  ExpensesCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? description,
      Value<String>? transactionType,
      Value<String>? subscriptionFrequency,
      Value<double>? amount,
      Value<DateTime>? timestamp,
      Value<DateTime>? subscriptionDate}) {
    return ExpensesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      transactionType: transactionType ?? this.transactionType,
      subscriptionFrequency:
          subscriptionFrequency ?? this.subscriptionFrequency,
      amount: amount ?? this.amount,
      timestamp: timestamp ?? this.timestamp,
      subscriptionDate: subscriptionDate ?? this.subscriptionDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (transactionType.present) {
      map['transaction_type'] = Variable<String>(transactionType.value);
    }
    if (subscriptionFrequency.present) {
      map['subscription_frequency'] =
          Variable<String>(subscriptionFrequency.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (subscriptionDate.present) {
      map['subscription_date'] = Variable<DateTime>(subscriptionDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpensesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('transactionType: $transactionType, ')
          ..write('subscriptionFrequency: $subscriptionFrequency, ')
          ..write('amount: $amount, ')
          ..write('timestamp: $timestamp, ')
          ..write('subscriptionDate: $subscriptionDate')
          ..write(')'))
        .toString();
  }
}

class $ExpensesTable extends Expenses with TableInfo<$ExpensesTable, Expense> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpensesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 1000),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  final VerificationMeta _transactionTypeMeta =
      const VerificationMeta('transactionType');
  @override
  late final GeneratedColumn<String> transactionType = GeneratedColumn<String>(
      'transaction_type', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  final VerificationMeta _subscriptionFrequencyMeta =
      const VerificationMeta('subscriptionFrequency');
  @override
  late final GeneratedColumn<String> subscriptionFrequency =
      GeneratedColumn<String>('subscription_frequency', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 10),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  final VerificationMeta _timestampMeta = const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  final VerificationMeta _subscriptionDateMeta =
      const VerificationMeta('subscriptionDate');
  @override
  late final GeneratedColumn<DateTime> subscriptionDate =
      GeneratedColumn<DateTime>('subscription_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        transactionType,
        subscriptionFrequency,
        amount,
        timestamp,
        subscriptionDate
      ];
  @override
  String get aliasedName => _alias ?? 'expenses';
  @override
  String get actualTableName => 'expenses';
  @override
  VerificationContext validateIntegrity(Insertable<Expense> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('transaction_type')) {
      context.handle(
          _transactionTypeMeta,
          transactionType.isAcceptableOrUnknown(
              data['transaction_type']!, _transactionTypeMeta));
    } else if (isInserting) {
      context.missing(_transactionTypeMeta);
    }
    if (data.containsKey('subscription_frequency')) {
      context.handle(
          _subscriptionFrequencyMeta,
          subscriptionFrequency.isAcceptableOrUnknown(
              data['subscription_frequency']!, _subscriptionFrequencyMeta));
    } else if (isInserting) {
      context.missing(_subscriptionFrequencyMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('subscription_date')) {
      context.handle(
          _subscriptionDateMeta,
          subscriptionDate.isAcceptableOrUnknown(
              data['subscription_date']!, _subscriptionDateMeta));
    } else if (isInserting) {
      context.missing(_subscriptionDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Expense map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Expense(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      transactionType: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}transaction_type'])!,
      subscriptionFrequency: attachedDatabase.options.types.read(
          DriftSqlType.string,
          data['${effectivePrefix}subscription_frequency'])!,
      amount: attachedDatabase.options.types
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      timestamp: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      subscriptionDate: attachedDatabase.options.types.read(
          DriftSqlType.dateTime, data['${effectivePrefix}subscription_date'])!,
    );
  }

  @override
  $ExpensesTable createAlias(String alias) {
    return $ExpensesTable(attachedDatabase, alias);
  }
}

abstract class _$ExpensesDatabase extends GeneratedDatabase {
  _$ExpensesDatabase(QueryExecutor e) : super(e);
  late final $ExpensesTable expenses = $ExpensesTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [expenses];
}
