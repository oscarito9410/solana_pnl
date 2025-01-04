import 'package:flutter/material.dart';
import 'package:metaballs/metaballs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green), useMaterial3: true, fontFamily: 'Pixelify'),
        darkTheme: ThemeData(useMaterial3: true, brightness: Brightness.dark, fontFamily: 'Pixelify'),
        themeMode: ThemeMode.dark,
        home: const DemoPage());
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

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  String _inputCode = "";

  void _updateInputCode(String newCode) {
    setState(() {
      _inputCode = newCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Metaballs(
      color: const Color.fromARGB(255, 66, 133, 244),
      effect: MetaballsEffect.follow(
        growthFactor: 1,
        smoothing: 1,
        radius: 0.5,
      ),
      gradient: LinearGradient(colors: [
        const Color.fromARGB(255, 60, 255, 210),
        const Color.fromARGB(255, 8, 245, 156),
      ], begin: Alignment.bottomRight, end: Alignment.topLeft),
      metaballs: 40,
      animationDuration: const Duration(milliseconds: 200),
      speedMultiplier: 1,
      bounceStiffness: 3,
      minBallRadius: 15,
      maxBallRadius: 40,
      glowRadius: 0.7,
      glowIntensity: 0.6,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  "2024 through the PF trenches",
                style: TextStyle(
                  fontSize: 30
                ),
              ),
              const SizedBox(height: 20),
              InputField(onChanged: _updateInputCode),
              const SizedBox(height: 20),
              ActionButton(inputCode: _inputCode),
            ],
          ),
        ),
      ),
    ));
  }
}

class InputField extends StatelessWidget {
  final Function(String) onChanged;

  const InputField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) => TextField(
      decoration: InputDecoration(
        filled: true,
        hintText: 'Enter Your Wallet Address',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: onChanged,
    );
}

class ActionButton extends StatelessWidget {
  final String inputCode;

  const ActionButton({super.key, required this.inputCode});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (inputCode.isNotEmpty) {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              content: Text("Code entered: $inputCode"),
            ),
          );
        }
      },
      child: const Text('REVIEW', style: TextStyle(
        fontFamily: 'Pixelify'
      ),),
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
        onPrimary: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20), // Increase padding for a larger touch area
        textStyle: TextStyle(fontSize: 18), // Larger text size
        minimumSize: Size(200, 60), // Minimum size of the button
      ),
    );
  }
}


class GifDisplay extends StatelessWidget {
  const GifDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(''
        'https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExem5nZ3hxd3dsNzA3cHZ6c3FseWZ1azd3ZGpnYXhkNHR4Y3F1M2psOCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/67ThRZlYBvibtdF9JH/giphy.webp',
      // Replace with your actual GIF URL
      height: 250, // You can adjust the size as needed
      fit: BoxFit.cover, // This ensures the entire GIF is visible within the bounds
    );
  }
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
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
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
