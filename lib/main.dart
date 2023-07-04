import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

// Stream<String> getName() {
//   return Stream.periodic(const Duration(seconds: 1), (value) { return 'Foo'; });
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    test();
    DatabaseReference ref = FirebaseDatabase.instance.ref("testing");
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text("VegElement"),
                Text("Non-vegElement"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text("VegElement"),
                Text("Non-vegElement"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Image.asset('assets/images/wallpaper.jpg'),
            ),
            const Car(title: "Hello")
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
  final String title;

  const Car({super.key, required this.title});

  @override
  State<Car> createState() => _CarState();
}

class _CarState extends State<Car> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 100,
      width: 100,
      child: Center(
        child: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
