import 'package:eventsubscriber/eventsubscriber.dart';
import 'package:flutter/material.dart';
import '../globals.dart';

// import '../globals.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    void onPressed() {
      // db
      //     .into(db.expenses)
      //     .insert(ExpensesCompanion.insert(
      //         title: "Phone",
      //         description: "bought new phone",
      //         transactionType: "transaction",
      //         amount: 12.22,
      //         timestamp: DateTime.now()))
      //     .then((value) => {});
      Navigator.pushNamed(context, "/dataEntry");
    }

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(),
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CurrentMonthExpenditure(), ExpectExpenditure()],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                        onPressed: onPressed, child: const Icon(Icons.add)),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(
                      child: SizedBox(
                    height: 50,
                    child: AppBar(
                        backgroundColor: Colors.white,
                        shadowColor: Colors.transparent,
                        primary: false,
                        bottom: const TabBar(labelColor: Colors.black, tabs: [
                          Tab(
                            text: "Transactions",
                          ),
                          Tab(
                            text: "Subscriptions",
                          )
                        ])),
                  )),
                ]),
                Row(
                  children: const [
                    Expanded(
                        child: SizedBox(
                            height: 500,
                            child: TabBarView(
                              children: [
                                SizedBox(height: 300, child: ListExpenses()),
                                SizedBox(
                                    height: 300, child: ListUpcomingExpenses())
                              ],
                            )))
                  ],
                )
              ])),
        ));
  }
}

class ListExpenses extends StatefulWidget {
  const ListExpenses({super.key});

  @override
  State<ListExpenses> createState() => _ListExpensesState();
}

class _ListExpensesState extends State<ListExpenses> {
  List transactions = [];

  @override
  void initState() {
    // TODO: implement initState
    getExpenses();
    super.initState();
  }

  Future getExpenses() async {
    final data = await db.getExpenses();
    setState(() {
      transactions = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    const biggerFont = TextStyle(fontSize: 18);

    return EventSubscriber(
        event: changeEvent,
        builder: (context, snapshot) {
          return ListView.separated(
              itemCount: transactions.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return Divider();
              },
              padding: const EdgeInsets.all(16.0),
              itemBuilder: ((context, i) {
                // if (i.isOdd) {
                //   return const Divider();
                // } else {
                final entry = transactions[i].toJson();
                return Card(
                    child: ListTile(
                        isThreeLine: true,
                        title: Text(
                          entry['title'],
                          style: biggerFont,
                        ),
                        subtitle: Align(
                          child: Text(
                            entry['amount'].toString(),
                            style: biggerFont,
                          ),
                          alignment: Alignment.topRight,
                        )));
                // }
              }));
        });
  }
}

class ListUpcomingExpenses extends StatefulWidget {
  const ListUpcomingExpenses({super.key});

  @override
  State<ListUpcomingExpenses> createState() => _ListUpcomingExpensesState();
}

class _ListUpcomingExpensesState extends State<ListUpcomingExpenses> {
  List upcomingTransactions = [];

  Future getUpcomingExpenses() async {
    final data = await db.getUpcomingExpenses();
    setState(() {
      upcomingTransactions = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getUpcomingExpenses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const biggerFont = TextStyle(fontSize: 18);

    return RefreshIndicator(
        onRefresh: getUpcomingExpenses,
        child: ListView.separated(
            itemCount: upcomingTransactions.length,
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return Divider();
            },
            padding: const EdgeInsets.all(16.0),
            itemBuilder: ((context, i) {
              // if (i.isOdd) {
              //   return const Divider();
              // } else {
              final entry = upcomingTransactions[i].toJson();
              return Card(
                  child: ListTile(
                      isThreeLine: true,
                      title: Text(
                        entry['title'],
                        style: biggerFont,
                      ),
                      subtitle: Align(
                        child: Text(
                          entry['amount'].toString(),
                          style: biggerFont,
                        ),
                        alignment: Alignment.topRight,
                      )));
              // }
            })));
  }
}

class CurrentMonthExpenditure extends StatefulWidget {
  const CurrentMonthExpenditure({super.key});

  @override
  State<CurrentMonthExpenditure> createState() =>
      _CurrentMonthExpenditureState();
}

class _CurrentMonthExpenditureState extends State<CurrentMonthExpenditure> {
  double currentExpenditureTotal = 0.0;
  Future<double?> currentExpenditure(DateTime date) {
    return db.currentExpenditure(date);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: DefaultTextStyle(
            style: Theme.of(context).textTheme.bodyLarge!,
            child: EventSubscriber(
                event: changeEvent,
                builder: (context, snapshot) {
                  return FutureBuilder(
                    future: currentExpenditure(DateTime.now()),
                    builder: ((context, snapshot) {
                      List<Widget> children = [];
                      if (snapshot.hasData) {
                        children = <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(25),
                            child: Column(children: [
                              Row(children: [
                                Text(
                                    '\$${num.parse(snapshot.data!.toStringAsFixed(2))}')
                              ]),
                              Row(children: [Text('Spent Till now')])
                            ]),
                          ),
                        ];
                      } else {
                        switch (snapshot.connectionState) {
                          case ConnectionState.active:
                            children = <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text('Connecting'),
                              ),
                            ];
                            break;
                          case ConnectionState.done:
                            children = <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text('Connection DOne,${snapshot.data}'),
                              ),
                            ];
                            break;
                          case ConnectionState.waiting:
                            children = const <Widget>[
                              SizedBox(
                                width: 60,
                                height: 60,
                                child: CircularProgressIndicator(),
                              )
                            ];
                            break;
                        }
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: children,
                      );
                    }),
                  );
                })));
  }
}

class ExpectExpenditure extends StatefulWidget {
  const ExpectExpenditure({super.key});

  @override
  State<ExpectExpenditure> createState() => _ExpectExpenditureState();
}

class _ExpectExpenditureState extends State<ExpectExpenditure> {
  Future expectedExpenditure(DateTime date) {
    final t = db.subscriptionCharges(date);
    return t;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: DefaultTextStyle(
            style: Theme.of(context).textTheme.bodyLarge!,
            child: EventSubscriber(
                event: changeEvent,
                builder: (context, snapshot) {
                  return FutureBuilder(
                    future: expectedExpenditure(DateTime.now()),
                    builder: ((context, snapshot) {
                      List<Widget> children = [];
                      if (snapshot.hasData) {
                        children = <Widget>[
                          Padding(
                              padding: const EdgeInsets.all(25),
                              child: Column(children: [
                                Row(children: [
                                  Text(
                                      '\$${num.parse(snapshot.data!.toStringAsFixed(2))}'),
                                ]),
                                Row(
                                  children: [Text("Next Month")],
                                )
                              ])),
                        ];
                      } else {
                        switch (snapshot.connectionState) {
                          case ConnectionState.active:
                            children = <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text('Connecting'),
                              ),
                            ];
                            break;
                          case ConnectionState.done:
                            children = <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text('Connection DOne'),
                              ),
                            ];
                            break;
                          case ConnectionState.waiting:
                            children = const <Widget>[
                              SizedBox(
                                width: 60,
                                height: 60,
                                child: CircularProgressIndicator(),
                              )
                            ];
                            break;
                        }
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: children,
                      );
                    }),
                  );
                })));
  }
}
