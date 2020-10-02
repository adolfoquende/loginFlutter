import 'package:FlutterChallenge/Ecommerce/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _username, _email, _password;

  void _login() {
    print('Fazendo login!!');

    if (_formKey.currentState.validate()) {
      print('Dados validos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            //Cria um formulario com necessidade de validacao tipo no PHP
            child: Form(
              //adiciona-se a chave controladora
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Register',
                    style: Theme.of(context).textTheme.headline,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      //Valida o nome do utilizador com base um teste condicional
                      validator: (val) =>
                          val.length < 6 ? 'Username too short' : null,

                      //Atribui o valor do campo inserido a variavel quando for a salvar o formulario
                      onSaved: (val) => _username = val,

                      decoration: InputDecoration(
                          //para criar bordas em forma de caixa
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                          hintText: 'Enter username, min length 6',
                          icon: Icon(
                            Icons.face,
                            color: Colors.red,
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      //Verifica o tamanho da palavra passe com base um teste condicional
                      validator: (val) =>
                          val.length < 6 ? 'Username too short' : null,
                      onSaved: (val) => _password = val,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter Password',
                          icon: Icon(
                            Icons.vpn_key,
                            color: Colors.grey,
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: <Widget>[
                        RaisedButton(
                          onPressed: _login,
                          child: Text('LOGIN'),
                          elevation: 28.0,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          color: Theme.of(context).primaryColor,
                        ),
                        FlatButton(
                          child: Text('Create a count'),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage())),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
