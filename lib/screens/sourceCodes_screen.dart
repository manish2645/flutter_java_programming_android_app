import "package:flutter/material.dart";
import 'package:flutter/services.dart' show rootBundle;
import 'package:code_editor/code_editor.dart';

class SourceCodes extends StatefulWidget {
  const SourceCodes({super.key});

  @override
  State<SourceCodes> createState() => _SourceCodesState();
}

class _SourceCodesState extends State<SourceCodes> {
  String data = '';
  fetchFileData() async {
    String responseText;
    responseText = await rootBundle.loadString('assets/data/file.txt');
    setState(() {
      data = responseText;
    });
  }

  @override
  void initState() {
    fetchFileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> contentOfPage1 = [data];

    // The files displayed in the navigation bar of the editor.
    // You are not limited.
    // By default, [name] = "file.${language ?? 'txt'}", [language] = "text" and [code] = "",
    List<FileEditor> files = [
      FileEditor(
        name: "Duplicate_Checker.java",
        language: "java",
        code: contentOfPage1.join("\n"), // [code] needs a string
      ),
    ];

    // The model used by the CodeEditor widget, you need it in order to control it.
    // But, since 1.0.0, the model is not required inside the CodeEditor Widget.
    EditorModel model = EditorModel(
      files: files, // the files created above
      // you can customize the editor as you want
      styleOptions: EditorModelStyleOptions(),
    );

    // A custom TextEditingController.
    final myController = TextEditingController(text: 'hello!');

    return Scaffold(
      appBar: AppBar(
        title: Text("Source Codes"),
        backgroundColor: Colors.green[700],
      ),
      body: new Container(
          child: Container(
            child: CodeEditor(
              model: model, // the model created above, not required since 1.0.0
              edit: false, // can edit the files? by default true
              onSubmit: (String? language, String? value) => print("yo"),
              disableNavigationbar:
                  false, // hide the navigation bar ? by default false
              textEditingController:
                  myController, // Provide an optional, custom TextEditingController.
            ),
          ),
        ),
    );
  }
}
