import 'package:flutter/material.dart';
import '../database/database.dart';
import '../globals.dart';

//Add entry page
class DataEntry extends StatefulWidget {
  const DataEntry({super.key});

  @override
  State<DataEntry> createState() => _DataEntryState();
}

class _DataEntryState extends State<DataEntry> {
  final _formKey = GlobalKey<FormState>();
  bool yearlySubscription = false;
  DateTime? dateOfSubscrition;
  bool? allowYearlyDate;
  dynamic dateController = TextEditingController();
  Future<dynamic> addToDb(title, description, amount, transactionType,
      transactionDate, subscriptionDate, subscriptionFrequency) {
    print("BEFORE ENTRY $subscriptionDate");
    return db.into(db.expenses).insert(ExpensesCompanion.insert(
        title: title,
        amount: amount,
        description: description,
        transactionType: transactionType,
        timestamp: transactionDate,
        subscriptionDate: subscriptionDate,
        subscriptionFrequency: subscriptionFrequency));
  }

  @override
  Widget build(BuildContext context) {
    String? title,
        description,
        typeOfTransaction,
        subscriptionFrequency = "yearly";
    dynamic? amt;
    return Scaffold(
        appBar: AppBar(
          title: Text("Enter Expense"),
        ),
        body: Center(
            child: Form(
                key: _formKey,
                child: Card(
                    child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        onSaved: (newValue) => title = newValue!,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Title',
                        ),
                        textAlign: TextAlign.left,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          if (value.length > 200) {
                            return "Max 200 characters";
                          }
                        },
                      ),
                      TextFormField(
                        onSaved: (newValue) => description = newValue!,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Description',
                        ),
                        textAlign: TextAlign.left,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          if (value.length > 200) {
                            return "Max 200 characters";
                          }
                        },
                      ),
                      TextFormField(
                        onSaved: (newValue) =>
                            amt = num.parse(newValue!).toDouble(),
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Amount',
                        ),
                        textAlign: TextAlign.left,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Only Numbers allowed';
                          }
                        },
                      ),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Type of transaction',
                        ),
                        onSaved: (newValue) => typeOfTransaction = newValue!,
                        items: [
                          DropdownMenuItem(
                              child: Text("Transaction"), value: 'transaction'),
                          DropdownMenuItem(
                              child: Text("Subscription"),
                              value: 'subscription'),
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            if (value == "subscription") {
                              yearlySubscription = true;
                            } else {
                              yearlySubscription = false;
                            }
                          });
                          print(
                              "value changed value:$value and yearsubsc : $yearlySubscription");
                        },
                      ),
                      Visibility(
                          visible: yearlySubscription,
                          child: DropdownButtonFormField(
                            onSaved: (newValue) =>
                                subscriptionFrequency = newValue!,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Duration',
                            ),
                            items: [
                              DropdownMenuItem(
                                  child: Text("Monthly"), value: 'monthly'),
                              DropdownMenuItem(
                                  child: Text("Yearly"), value: 'yearly'),
                            ],
                            onChanged: ((String? value) {
                              // if (value == "yearly") {
                              //   allowYearlyDate = true;
                              // } else {
                              //   allowYearlyDate = false;
                              // }
                            }),
                          )),
                      Visibility(
                        visible: yearlySubscription,
                        child: TextFormField(
                          controller: dateController,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Subscription Date',
                          ),
                          onTap: () => showDatePicker(
                            builder: ((context, child) => child =
                                DatePickerDialog(
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000, 1, 1),
                                    lastDate: DateTime(2999, 12, 31))),
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000, 1, 1),
                            lastDate: DateTime(2999, 12, 31),
                            context: context,
                          ).then((value) {
                            setState(() {
                              dateController.text = value?.toIso8601String();
                              dateOfSubscrition = value;
                            });
                          }),
                        ),
                      ),
                      Center(
                          child: ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            // print(_formKey.currentState!.);
                            _formKey.currentState!.save();
                            print([
                              title,
                              description,
                              typeOfTransaction,
                              amt,
                              dateOfSubscrition!.year,
                            ]);

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                            addToDb(
                                    title,
                                    description,
                                    amt,
                                    typeOfTransaction,
                                    DateTime.now(),
                                    dateOfSubscrition as DateTime,
                                    subscriptionFrequency)
                                .then((value) {
                              changeEvent.broadcast();
                              Navigator.pop(context);
                            });
                          }
                        },
                        child: const Text('Submit'),
                      )),
                      // Add TextFormFields and ElevatedButton here.
                    ],
                  ),
                )))));
  }
}
