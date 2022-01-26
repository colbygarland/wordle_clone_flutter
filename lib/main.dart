import 'package:flutter/material.dart';
import 'package:wordle_clone/widgets/letter_row.dart';

const LETTER_COUNT = 5;
const WORD_LIST = ['hello', 'knoll', 'clone'];
const TODAYS_WORD = 'knoll';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wordle Clone',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<bool> _rowDisabled = [false, true, true, true, true];
  int _currentIndex = 0;

  updateRow(String word) {
    word = word.toLowerCase();
    if (!WORD_LIST.contains(word)) {
      _alert('Word not in list');
      return;
    }
    if (word == TODAYS_WORD) {
      _alert('Impressive!');
      setState(() {
        _rowDisabled[_currentIndex] = true;
      });
    } else {
      _alert('nope not it. try again');
      setState(() {
        // Disable the current one
        _rowDisabled[_currentIndex] = true;
        _currentIndex++;
        // Enable the next one
        _rowDisabled[_currentIndex] = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wordle Clone'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(children: [
          for (int i = 0; i < LETTER_COUNT; i++)
            Center(
              //color: Colors.red,
              child: LetterRow(_rowDisabled[i], updateRow),
            )
        ]),
      ),
    );
  }

  _alert(String message) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message),
        );
      },
    );
  }
}
