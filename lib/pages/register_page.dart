import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  String _username, _email, _password;

  Widget _showTitle() => Text(
        'Register',
        style: Theme.of(context).textTheme.headline,
      );

  Widget _showUserNameInput() => Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: TextFormField(
          onSaved: (val) => _username = val,
          validator: (val) => val.length < 6 ? 'Username too short' : null,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Username',
            hintText: 'Enter username, min length 6',
            icon: Icon(
              Icons.face,
              color: Colors.grey,
            ),
          ),
        ),
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
          obscureText: _obscurePassword,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () => setState(() => _obscurePassword = !_obscurePassword),
              child: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off),
            ),
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
              child: Text('Submit',
                  style: Theme.of(context).textTheme.body1.copyWith(
                        color: Colors.black,
                      )),
              onPressed: _submit,
              color: Theme.of(context).primaryColor,
              elevation: 8.0,
            ),
            FlatButton(
              child: Text('Existing User? Login'),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/login'),
            )
          ],
        ),
      );

  void _submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      print('username: $_username, email: $_email, password: $_password');
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
                  _showUserNameInput(),
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
