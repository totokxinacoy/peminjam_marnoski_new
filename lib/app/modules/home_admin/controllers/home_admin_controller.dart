import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/model/response_login.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/constant/endpoint.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/provider/api_provider.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/provider/storage_provider.dart';
// import '../../../data/provider/storage_provider.dart';



class HomeAdminController extends GetxController with StateMixin<List<DataLogin>>  {
  //TODO: Implement HomeController

  final count = 0.obs;
  Rx<String?> username = "".obs;

  @override
  void onInit() {
    super.onInit();
    user();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  user() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get(Endpoint.login,
          queryParameters: {"id": StorageProvider.read(StorageKey.idUser),
            "role": "PETUGAS"});
      if (response.statusCode == 200) {
        final ResponseLogin responseLogin = ResponseLogin.fromJson(response.data);
        if (responseLogin.data == null) {
          change(null, status: RxStatus.empty());
        } else {
          username.value = responseLogin.data?.username;
          change(responseLogin.data as List<DataLogin>?, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          log(("dio ${e.response?.data['message']}"));
          change(null, status: RxStatus.error("dio ${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error("cek " + (e.message ?? "")));
      }
    } catch (e) {
      change(null, status: RxStatus.error("catch " + e.toString()));
    }
  }
}