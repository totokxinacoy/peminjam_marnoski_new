import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_book.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';
import '../controllers/book_admin_controller.dart';

class BookAdminView extends GetView<BookAdminController> {
  const BookAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String? username = StorageProvider.read(StorageKey.idUser);
    return Scaffold(
        backgroundColor: Color(0xFF111100),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFFFED3237), // specify the background color here
          onPressed: () => Get.toNamed(Routes.ADD_BOOK),
          child: Icon(Icons.add, color: Colors.white), // specify the icon color here
        ),
        body: controller.obx((state) => Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              color: Color(0xFF100000),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // this will align the children to the far left and right of the container
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Image.asset('assets/logononame.png'),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: InkWell(
                      onTap: showLogoutDialog,
                      child: Text(
                        '$username',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Hammersmith',
                            fontSize: 24),
                      ),
                    ),
                  ),
                ],
              ),
            ),
             Container(
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFF58634), Color(0xFFFED3237)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 20,
                      child: Text(
                        'LIST BUKU \n'
                            'PERPUSTAKAAN',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Hammersmith',
                            fontSize: 24),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 20,
                      child: Text(
                        '\nTAMBAH BUKU',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Hammersmith',
                            fontSize: 24),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: GridView.count(
                            crossAxisCount: 2, // number of columns in the grid
                            mainAxisSpacing: 25, // jarak vertikal antara Card
                            crossAxisSpacing: 25,
                            childAspectRatio: 0.75,// jarak horizontal antara Card
                            children: state!.map((dataBook) => GestureDetector(
                              onTap: () => Get.toNamed(Routes.PEMINJAMAN, parameters: {
                                'id' : (dataBook.id ?? 0).toString(),
                              }),
                              child: Card(
                                elevation: 5, // Tambahkan efek bayangan untuk Card
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10), // Tambahkan border radius sebesar 10 pixel
                                ),
                                child: SizedBox(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0), // Tambahkan jarak sebesar 8.0 pixel di semua sisi
                                        child: Image.network(
                                          "${Endpoint.image}${dataBook.gambar}",
                                          height: 200, // Ukuran gambar dalam Card
                                        ),
                                      ),
                                      Expanded(
                                        child: LayoutBuilder(
                                          builder: (BuildContext context, BoxConstraints constraints) {
                                            final double textWidth = constraints.maxWidth;
                                            double textSize = 16;

                                            if (textWidth > 30 && dataBook.judul!.length > 20) {
                                              textSize = 10;
                                            }


                                            return Center(
                                              child: Text(
                                                "${dataBook.judul}".toUpperCase(),
                                                style: TextStyle(
                                                  color: Color(0xFF100000),
                                                  fontFamily: 'Hammersmith',
                                                  fontSize: textSize,
                                                ),
                                                textAlign: TextAlign.center,
                                                maxLines: 10,
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: false,
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            Container(
              height: MediaQuery.of(context).size.height* 0.1, // 30% of the screen height
              color: Color(0xFF100000),
              child: Center(
                child: Text(
                  'Copyright ©Jo\'R 2024',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Hammersmith',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ), onLoading: Center(child: CupertinoActivityIndicator())
        )
    );
  }
}
void showLogoutDialog() {
  Get.dialog(
    AlertDialog(
      title: Text('Logout'),
      content: Text('Are you sure you want to logout?'),
      actions: [
        TextButton(
          onPressed: () {
            // Close the dialog without logging out
            Get.back();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // Logout the user and navigate to the login page
            // You can use the `StorageProvider` to clear the user's session data
            // and then navigate to the login page using `Get.offNamed()`

            // Example:
            StorageProvider.clearAll();
            Get.offNamed(Routes.LOGIN);
          },
          child: Text('Logout'),
        ),
      ],
    ),
  );
}
