import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_firebase/app/controller/login_controller.dart';
import 'package:login_firebase/app/routes/app_routes.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final LoginController _loginController = Get.find<LoginController>();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double _widght = size.width;
    double _height = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Formulario(_height),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Formulario(double _height) {
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          SizedBox(
            height: _height * 0.1,
          ),
          Hero(
              tag: 'Hero',
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 40,
                child: Image.asset("imagens/fogo.png"),
              )),
          SizedBox(
            height: _height * 0.05,
          ),
          TextFormField(
            controller: _loginController.emailTextController,
            validator: (Value) {
              if (Value!.isEmpty) {
                return "Campo Obrigatorio";
              } else if (!GetUtils.isEmail(Value)) {
                return "Favor digitar um E-mail válido";
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            //initialValue: "emailteste@gmail.com",
            decoration: InputDecoration(
              icon: const Icon(Icons.supervised_user_circle_rounded),
              hintText: "E-mail",
              contentPadding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black45,
                ),
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),
          SizedBox(
            height: _height * 0.01,
          ),
          TextFormField(
            controller: _loginController.passwordTextController,
            validator: (Value) {
              if (Value!.isEmpty) {
                return "Campo obrigatório";
              } else if (Value.length < 6) {
                return "Mínimo 6 caracteres!";
              }
              return null;
            },
            autofocus: false,
            obscureText: true,
            //initialValue: "Sua senha",
            decoration: InputDecoration(
              icon: const Icon(Icons.password_sharp),
              hintText: "Senha",
              contentPadding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black45,
                ),
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),
          SizedBox(
            height: _height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _loginController.login();
                }
                //
              },
              child: const Text(
                "Acessar",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  // padding: const EdgeInsets.all(12),
                  onPrimary: Colors.deepOrange),
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                //height: _height * 0.1,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Esqueceu a senha?",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.REGISTER);
                  },
                  child: const Text(
                    "Cadastra-se",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: _height * 0.01,
          ),
        ],
      ),
    );
  }
}
