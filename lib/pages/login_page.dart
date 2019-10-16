import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String _email, _password;

  Widget _showTitle() => Text(
        'Login',
        style: Theme.of(context).textTheme.headline,
      );

  Widget _showEmailInput() => Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: TextFormField(
          onSaved: (val) => _email = val,
          validator: (val) =>
              !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                      .hasMatch(val)
                  ? 'Email not valid'
                  : null,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Email',
            hintText: 'Enter your email address',
            icon: Icon(
              Icons.email,
              color: Colors.grey,
            ),
          ),
        ),
      );

  Widget _showPasswordInput() => Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: TextFormField(
          onSaved: (val) => _password = val,
          validator: (val) => val.length < 6 ? 'Password too short' : null,
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
            hintText: 'Enter a password, min length 6 ',
            icon: Icon(
              Icons.lock,
              color: Colors.grey,
            ),
          ),
        ),
      );

  Widget _showFormActions() => Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Login',
                  style: Theme.of(context).textTheme.body1.copyWith(
                        color: Colors.black,
                      )),
              onPressed: _submit,
              color: Theme.of(context).accentColor,
              elevation: 8.0,
            ),
            FlatButton(
              child: Text('User? Login'),
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed('/register'),
            )
          ],
        ),
      );

  void _submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      print('email: $_email, password: $_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _showTitle(),
                  _showEmailInput(),
                  _showPasswordInput(),
                  _showFormActions(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
