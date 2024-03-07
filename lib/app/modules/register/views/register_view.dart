import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/modules/register/controllers/register_controller.dart';



class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181820),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, // Align to the top
              children: [
                // Logo (Assuming you have an 'assets/logo.png' image)
                Image.asset(
                  'assets/marnoski.png',
                  width: 300,
                  height: 300,
                ),
                SizedBox(height: 5.0),// Reduce the space between logo and text fields
                TextFormField(
                  controller: controller.namaController,
                  decoration: InputDecoration(
                    hintText: "Masukan Nama",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "Nama tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.0), // Reduce the space between text fields
                TextFormField(
                  controller: controller.usernameController,
                  decoration: InputDecoration(
                    hintText: "Masukan UserName",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "UserName tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.0), // Reduce the space between text fields
                TextFormField(
                  controller: controller.telpController,
                  decoration: InputDecoration(
                    hintText: "Masukan Telepon",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "Telepon tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.0), // Reduce the space between text fields
                TextFormField(
                  controller: controller.alamatController,
                  decoration: InputDecoration(
                    hintText: "Masukan Alamat",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "Alamat tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.0), // Reduce the space between text fields
                TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(
                    hintText: "Masukan Password",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "Password tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0), // Maintain space between text field and button
                Obx(() => controller.loading.value
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: () {
                    controller.addAkun();
                  },
                  child: Text("Registrasi"),
                )),
                Spacer(), // Use Spacer to fill available space and push widgets to the top
              ],
            ),
          ),
        ),
      ),
    );
  }
}