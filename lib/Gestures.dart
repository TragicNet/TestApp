import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Gestures extends StatelessWidget {
  const Gestures({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multiple Gestures Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Multiple Gestures Demo'),
        ),
        body: RawGestureDetector(
          gestures: {
            AllowMultipleGestureRecognizer:
                GestureRecognizerFactoryWithHandlers<
                    AllowMultipleGestureRecognizer>(
              () => AllowMultipleGestureRecognizer(),
              (AllowMultipleGestureRecognizer instance) {
                instance.onTap =
                    () => print('It is the parent container gesture');
              },
            )
          },
          behavior: HitTestBehavior.opaque,
          //Parent Container
          child: Container(
            color: Colors.green,
            child: Center(
              //Now, wraps the second container in RawGestureDetector
              child: RawGestureDetector(
                gestures: {
                  AllowMultipleGestureRecognizer:
                      GestureRecognizerFactoryWithHandlers<
                          AllowMultipleGestureRecognizer>(
                    () => AllowMultipleGestureRecognizer(), //constructor
                    (AllowMultipleGestureRecognizer instance) {
                      //initializer
                      instance.onTap =
                          () => print('It is the nested container');
                    },
                  )
                },
                //Creates the nested container within the first.
                child: Container(
                  color: Colors.deepOrange,
                  width: 250.0,
                  height: 350.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AllowMultipleGestureRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}
