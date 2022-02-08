import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationService {
  // 1
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  GetStorage box = GetStorage('Login_Firebase');

  // 2
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // 3
  Future<UserCredential?> signIn(
      {required String email, required String password}) async {
    try {
      var repo = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return repo;
    } on FirebaseAuthException catch (e) {
      // ignore: dead_code
      Get.back();
      switch (e.code) {
        case "ERROR_USER_NOT_FOUND":
          Get.defaultDialog(
              title: "ERROR", content: const Text("Usuário não encontrado."));
          break;
        case "ERROR_WRONG_PASSWORD":
          Get.defaultDialog(
              title: "ERROR",
              content: const Text("Senha não confere com o cadastrado."));
          break;
        case "ERROR_USER_DISABLED":
          Get.defaultDialog(
              title: "ERROR",
              content: const Text("Este usuário foi desativado."));
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          Get.defaultDialog(
              title: "ERROR",
              content: const Text(
                  "Muitos solicitações. Tente novamente mais tarde."));
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          Get.defaultDialog(
              title: "ERROR",
              content: const Text(
                  "Este login com e-mail e senha não foi permitida."));
          break;
        default:
          Get.defaultDialog(title: "ERROR", content: Text("$e"));
      }
      return null;
    }
  }

  // 4
  Future<String?> signUp(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      Get.back();
      // ignore: dead_code
      switch (e.code) {
        case "ERROR_OPERATION_NOT_ALLOWED":
          Get.defaultDialog(
              title: "ERROR",
              content: const Text("Contas anônimas não estão habilitadas"));
          break;
        case "ERROR_WEAK_PASSWORD":
          Get.defaultDialog(
              title: "ERROR", content: const Text("Sua senha é muito fraca"));
          break;
        case "ERROR_INVALID_EMAIL":
          Get.defaultDialog(
              title: "ERROR", content: const Text("Seu email é inválido"));
          break;
        case "ERROR_EMAIL_ALREADY_IN_USE":
          Get.defaultDialog(
              title: "ERROR",
              content: const Text("O e-mail já está em uso em outra conta"));
          break;
        case "ERROR_INVALID_CREDENTIAL":
          Get.defaultDialog(
              title: "ERROR", content: const Text("Seu email é inválido"));
          break;
        default:
          Get.defaultDialog(
              title: "ERROR",
              content: const Text("Ocorreu um erro indefinido."));
      }
      return null;
    }
  }

  // 5
  Future<String?> signOut() async {
    box.write("auth", null);
    try {
      await _firebaseAuth.signOut();
      return "Signed out";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

// 6
  User? getUser() {
    try {
      return _firebaseAuth.currentUser;
    } on FirebaseAuthException {
      return null;
    }
  }
}
