import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'dart:developer' as devtools show log;

import 'models/Transaction.dart';

class ListDemo extends StatefulWidget {
  const ListDemo({super.key});

  @override
  State<ListDemo> createState() => _ListDemoState();
}

class _ListDemoState extends State<ListDemo> {
  late final TextEditingController _titleController;
  late final TextEditingController _amountController;

  List<Transaction> transactions = [
    Transaction(
      id: '1',
      title: 'abc',
      amount: 1000,
      dateTime: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'pqr',
      amount: 2000,
      dateTime: DateTime.now(),
    ),
    Transaction(
      id: '3',
      title: 'xyz',
      amount: 3000,
      dateTime: DateTime.now(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _amountController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Card(
                margin: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _titleController,
                        decoration: const InputDecoration(hintText: 'Title'),
                      ),
                      TextFormField(
                        controller: _amountController,
                        decoration: const InputDecoration(hintText: 'Amount'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final title = _titleController.text;
                          final amount = double.parse(_amountController.text);
                          final id = (transactions.length + 1).toString();
                          final dateTime = DateTime.now();
                          transactions.add(Transaction(
                            id: id,
                            title: title,
                            amount: amount,
                            dateTime: dateTime,
                          ));
                          setState(() => true);
                        },
                        child: const Text("Submit"),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(transactions[index].id),
                      title: Text(
                        transactions[index].title.toString(),
                      ),
                      subtitle: Text(DateFormat.yMMMd()
                          .format(transactions[index].dateTime)),
                      trailing: Text(transactions[index].amount.toString()),
                      onTap: () {
                        devtools.log(transactions[index].toString());
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
