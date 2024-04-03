import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/modules/register/controllers/register_controller.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/routes/app_pages.dart';



class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF100000),
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
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              labelText: "Username",
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Livvic',
                                  fontSize: 20),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
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
                            controller: controller.namaController,
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              labelText: "Nama Lengkap",
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Livvic',
                                  fontSize: 20),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value!.length < 2) {
                                return "Password tidak boleh kosong";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            controller: controller.passwordController,
                            cursorColor: Colors.white,
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Livvic',
                                  fontSize: 20),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value!.length < 2) {
                                return "Password tidak boleh kosong";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            controller: controller.telpController,
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              labelText: "Telepon",
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Livvic',
                                  fontSize: 20),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value!.length < 2) {
                                return "Password tidak boleh kosong";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            controller: controller.alamatController,
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              labelText: "Alamat",
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Livvic',
                                  fontSize: 20),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
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
                                  ? CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                                  : InkWell(
                                onTap: () {
                                  controller.addAkun();
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
                                      "SIGN UP",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Livvic',
                                        fontSize: 25, fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Sudah punya akun?",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Livvic'
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => Get.toNamed(Routes.LOGIN),
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Color(0xFF0066FF),
                                        fontFamily: 'Livvic',
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
                  fontFamily: 'Livvic',
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