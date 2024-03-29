import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child : TextFormField(
                controller: controller.usernameController,
                decoration: InputDecoration(hintText: "Masukkan Username",icon: Icon(Icons.person),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                validator: (value){
                  if (value!.isEmpty){ // untuk minim username
                    return "username tidak boleh kosong";
                  }
                  return null;
                },
              ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child : TextFormField(
                controller: controller.passwordController,
                decoration: InputDecoration(hintText: "Masukkan Password",icon: Icon(Icons.lock),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                validator: (value){
                  if (value!.isEmpty){ // untuk minimamal password
                    return "Password tidak boleh kosong";
                  }
                  return null;
                },
              ),
              ),
              Obx(() => controller.loading.value?
              CircularProgressIndicator():
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child:  ElevatedButton(onPressed: (){
                  controller.login();
                }, child: Text("Login")),
              ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ElevatedButton(onPressed: ()=> Get.toNamed(Routes.REGISTER),
                    child: Text("Register")),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
