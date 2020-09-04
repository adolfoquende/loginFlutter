import 'package:FlutterChallenge/Challenges/Login/models/LoginDB.dart';
import 'package:FlutterChallenge/Challenges/Login/models/UserModel.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController utilizadorController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  User user = User('', '');
  LoginDB loginDB = LoginDB();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 20, left: 40, right: 40),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                width: 200,
                height: 100,
                child: Image(
                  image: AssetImage('assets/logo2.png'),
                  width: 100,
                  height: 70,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: utilizadorController,
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: "Nome de utilizador",
                    labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 12)),
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: senhaController,
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 20)),
                style: TextStyle(fontSize: 20),
              ),
              Container(
                height: 40,
                alignment: Alignment.centerRight,
                child: FlatButton(
                  child: Text(
                    "Recuperar Senha",
                    textAlign: TextAlign.right,
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                //Botao Login
                height: 60,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.3, 1],
                        colors: [Color(0xFFF58524), Color(0xFFF92B7F)]),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: SizedBox.expand(
                  child: FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                        Container(
                          child: SizedBox(
                            child: Image.asset("assets/logo.png"),
                            width: 28,
                            height: 28,
                          ),
                        )
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        login(utilizadorController.text, senhaController.text);
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                //Botao Login Cadastro
                height: 60,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Color(0xFF3C5a99),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: SizedBox.expand(
                  child: FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Login com Facebook",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                        Container(
                          child: SizedBox(
                            child: Image.asset("assets/logo.png"),
                            width: 28,
                            height: 28,
                          ),
                        )
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        print(loginDB.insertUser(
                            utilizadorController.text, senhaController.text));
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 40,
                child: FlatButton(
                  child: Text(
                    "Regitar-se",
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  void login(String username, String password) async {
    user = await loginDB.getUser(username, password);
    print(username + ' ' + password);
    print(user);
    if (user != null) {
      /* AlertDialog alertDialog = AlertDialog(
        title: Text("Login"),
        content: Text('Login Sucessesful!!'),
      );

      showDialog(context: context, builder: (_) => alertDialog);*/

      print('Login Com sucesso');
    } else {
      /* AlertDialog alertDialog = AlertDialog(
        title: Text("Login"),
        content: Text('Login erro'),
      );

      showDialog(context: context, builder: (_) => alertDialog);*/

      print("Login sem sucesso!");
    }
  }
}
