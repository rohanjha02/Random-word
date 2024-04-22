import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Namer App',
      home: ChangeNotifierProvider(
        create: (context) => MyAppState(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  late WordPair _current = WordPair.random();
  
  WordPair get current => _current;

  void generateNewWordPair() {
    _current = WordPair.random();
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Namer App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'A random stupid idea:',
            ),
            Text(
              appState.current.asPascalCase,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                appState.generateNewWordPair();
              },
              child: Text('Next'),
            ),
            SizedBox(height: 20),
            Text(
              'Developed by Alwyn Antony Ben 4BSc DS',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
