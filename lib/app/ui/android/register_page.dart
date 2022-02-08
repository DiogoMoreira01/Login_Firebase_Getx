import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_firebase/app/controller/login_controller.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final LoginController _loginController = Get.find<LoginController>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double _widght = size.width;
    double _height = size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Cadastro"),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FormCadastro(_height),
            ],
          ),
        ),
      ),
    );
  }

  Form FormCadastro(double _height) {
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
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
            height: _height * 0.1,
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
              contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                return "Campo Obrigatorio";
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
              contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black45,
                ),
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),
          SizedBox(
            height: _height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _loginController.register();
                }
                //
              },
              child: const Text(
                "Cadastrar",
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
          SizedBox(
            //height: _height * 0.1,
            child: TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text(
                "Voltar para login",
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
