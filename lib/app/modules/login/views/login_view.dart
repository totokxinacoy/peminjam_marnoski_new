import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Image(
                      image: AssetImage('assets/marnoski.png'),
                      width: 300.0,
                      height: 300.0,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.0), // tambahkan margin atas form di sini
                          TextFormField(
                            controller: controller.usernameController,
                            decoration: InputDecoration(
                              labelText: "Username",
                              labelStyle: TextStyle(color: Colors.white),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                            ),
                            style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value!.length < 2) {
                                return "Username tidak boleh kosong";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10.0), // tambahkan margin di antara form field
                          TextFormField(
                            controller: controller.passwordController,
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(color: Colors.white),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                            ),
                            style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value!.length < 2) {
                                return "Password tidak boleh kosong";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(() => controller.loading.value
                                  ? CircularProgressIndicator()
                                  : InkWell(
                                onTap: () {
                                  controller.login();
                                },
                                child: Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "LOGIN",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () => Get.toNamed(Routes.REGISTER),
                                    child: Text(
                                      "Sign Up?",
                                      style: TextStyle(
                                        color: Colors.white,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF100000),
        child: Container(
          height: 50,
          child: Center(
            child: GestureDetector(
              onTap: () {
              },
              child: Text(
                'Copyright ©Tanto 2024',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
