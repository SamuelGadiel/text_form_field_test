import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Text Form Field Example"), centerTitle: true),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              maxLines: 1,
              cursorColor: Colors.black54,
              onChanged: (value) {
                debugPrint('onChanged');
              },
              onFieldSubmitted: (value) {
                print('onFieldSubmitted : $value');
              },
              onEditingComplete: () {
                print('onEditingComplete');
              },
              onSaved: (value) {
                print('onSaved : $value');
              },
              autocorrect: true,
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.grey[700]),
              decoration: InputDecoration(
                errorMaxLines: 3,
                counterText: '',
                errorStyle: TextStyle(color: Theme.of(context).errorColor),
                focusColor: Colors.grey[700],
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                labelText: 'Exemple',
                labelStyle: TextStyle(color: Colors.grey[700]),
                hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.black54),
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey[300]!), borderRadius: BorderRadius.zero),
                filled: true,
                fillColor: const Color(0xFFF1F1F1),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).errorColor),
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
