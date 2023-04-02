import 'package:flutter/material.dart';
import 'package:learn_java_program/screens/sourceCodes_screen.dart';

class PatternList extends StatefulWidget {
  //const NumberPattern({super.key});
  String patName;
  PatternList(this.patName);

  @override
  State<PatternList> createState() => _PatternListState();
}

class _PatternListState extends State<PatternList> {
  final List<String> items = [
    'Pattern 1',
    'Pattern 2',
    'Pattern 3',
    'Pattern 4',
    'Pattern 5',
    'Pattern 6',
    'Pattern 7',
    'Pattern 8',
    'Pattern 9',
    'Pattern 10',
    'Pattern 11',
    'Pattern 12',
    'Pattern 13',
    'Pattern 14',
    'Pattern 15',
    'Pattern 16',
    'Pattern 17',
    'Pattern 18',
    'Pattern 19',
    'Pattern 20',
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          widget.patName,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.green[700],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index], style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SourceCodes()));
              // Do something when item is tapped
            },
          );
        },
      ),
    );
  }
}
