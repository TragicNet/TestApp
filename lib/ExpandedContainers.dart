import 'package:flutter/material.dart';

class ExpandedContainers extends StatelessWidget {
  const ExpandedContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Test",
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 8,
              child: TextBox(
                color: Colors.red,
                value: '8',
              ),
            ),
            Expanded(
              flex: 5,
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: TextBox(
                      color: Colors.blueAccent,
                      value: '5',
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: TextBox(
                                        color: Colors.green,
                                        value: '1',
                                      ),
                                    ),
                                    Expanded(
                                      child: TextBox(
                                        color: Colors.blue,
                                        value: '1',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: TextBox(
                                  color: Colors.brown,
                                  value: '2',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: TextBox(
                            color: Colors.purple,
                            value: '3',
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextBox extends StatefulWidget {
  final String value;
  final Color color;

  const TextBox({super.key, required this.value, required this.color});

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      alignment: Alignment.center,
      child: Text(
        widget.value,
        style: const TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
