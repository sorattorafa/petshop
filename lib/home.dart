import 'package:flutter/material.dart';
import 'package:petshop/view/widgets/formitem.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final _formKey = GlobalKey<FormState>();
  String email = '';
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController senhaController = TextEditingController(text: '');

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
            FormItem(
              formFieldName: 'email',
              controller: emailController,
              suffix: Visibility(
                visible: true,
                child: IconButton(
                  icon: const Icon(Icons.cancel),
                  color: Colors.purple.shade500,
                  onPressed: () {
                    setState(() {
                      emailController = TextEditingController(text: '');
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 12),
            FormItem(
              formFieldName: 'password',
              controller: senhaController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      //TODO: DO SOMETHING
                    }
                  }, //login,
                  child: Text('Login'),
                ),
                SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () async {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    currentFocus.unfocus();
                    if (_formKey.currentState!.validate()) {
                      //TODO: DO SOMETHING
                    }
                  },
                  child: Text('Sign up'),
                ),
              ],
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
