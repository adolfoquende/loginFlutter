import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //Variavel que controla as chaves de um widget Form
  final _formKey = GlobalKey<FormState>();
  String _username, _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
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
                      //Verifica se nao tem o simbolo '@' e retorna a mensagem
                      validator: (val) =>
                          !val.contains('@') ? 'This email is not valid' : null,

                      onSaved: (val) => _email = val,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Enter a valid email',
                          icon: Icon(
                            Icons.email,
                            color: Colors.grey,
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
                          onPressed: _submit,
                          child: Text('Submit'),
                          elevation: 28.0,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          color: Theme.of(context).primaryColor,
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

  void _submit() {
    final form = _formKey.currentState;

    //Verifica se o estado actual esta sendo validado
    if (_formKey.currentState.validate()) {
      //form.save();
      print('correct data!!!!');
      print('Name: $_username\nEmail: $_email\nPassword: $_password');
    } else {
      print('Erro in your data!!!!');
    }
  }
}
