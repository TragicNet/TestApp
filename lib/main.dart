import 'package:flutter/material.dart';
import 'package:test_app/ListDemo.dart';

import 'ExpandedContainers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  // runApp(const MyApp());
  // runApp(const RCDivider());
  // runApp(const ExpandedContainers());
  // runApp(const Gestures());
  runApp(ListDemo());
}

// Stream<String> getName() {
//   return Stream.periodic(
//     const Duration(seconds: 1),
//     (value) {
//       return 'Foo';
//     },
//   );
// }

Future<int> futureMultiply(int a) {
  return Future.delayed(const Duration(seconds: 3), () => a * 2);
}

class Pair<A, B> {
  final A val1;
  final B val2;

  Pair(this.val1, this.val2);
}

void test() async {
  // final res = await futureMultiply(10);
  // await for (final res in getName()) {
  //   print(res);
  // }
  final pair = Pair('foo', 'bar');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    test();
    // DatabaseReference ref = FirebaseDatabase.instance.ref("testing");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Firebase'),
          ),
          // Normal
          body: Column(children: <Widget>[
            const Text(
              'Hello World',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const Text("Bye"),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () => print("Button Clicked!"),
              child: const Text('TextButton'),
            ),
            const Icon(Icons.add, size: 34),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("VegElement"),
                Text("Non-vegElement"),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("VegElement"),
                Text("Non-vegElement"),
              ],
            ),
            GestureDetector(
              onTap: () => print("Tap"),
              onDoubleTap: () => print("Double Tap"),
              child: Image.asset('assets/images/wallpaper.jpg'),
            ),
            Car(title: "Hello"),
          ])

          // Timestamp List
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     // DatabaseReference ref = FirebaseDatabase.instance.ref("testing");
          //     final String? id = ref.push().key;
          //     ref.child(id!).set({
          //       'timestamp': DateTime.now().toString(),
          //     });
          //     // print("name: " + ref.name)
          //   },
          //   child: const Icon(Icons.add),
          // ),
          // body: StreamBuilder(
          //   stream: ref.onValue,
          //   builder: (context, snapshot) {
          //     List<String> messageList = [];
          //     // if (!snapshot.hasData) {
          //     //   return const SizedBox.shrink();
          //     // }
          //     if (snapshot.hasData && snapshot.data != null && (snapshot.data!).snapshot.value !=
          //         null) {
          //       final messageMap = Map<dynamic, dynamic>.from((snapshot.data!).snapshot.value
          //       as Map<dynamic, dynamic>);
          //       messageMap.forEach((key, value) {
          //         final current = Map<dynamic, dynamic>.from(value);
          //         messageList.add(current['timestamp'] as String);
          //       });
          //       return ListView.builder(
          //         itemCount: messageList.length,
          //         itemBuilder: (context, index) {
          //           return ListTile(
          //             title: Text(messageList[index].toString()),
          //           );
          //         },
          //       );
          //     } else {
          //       return const Center(
          //         child: Text(
          //           'Say Hi...',
          //           style: TextStyle(
          //               color: Colors.white,
          //               fontSize: 21,
          //               fontWeight: FontWeight.w400),
          //         ),
          //       );
          //     }
          //   },
          // ),
          ),
    );
  }
}

class Car extends StatefulWidget {
  late final String title;

  Car({super.key, required this.title});

  @override
  State<Car> createState() => _CarState();
}

class _CarState extends State<Car> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          widget.title = widget.title == 'World' ? 'Hello' : 'World';
        });
      },
      child: Container(
        color: Colors.red,
        height: 100,
        width: 100,
        child: Center(
          child: Text(
            widget.title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
