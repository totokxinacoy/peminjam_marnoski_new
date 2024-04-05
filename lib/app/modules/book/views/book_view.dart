import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/model/response_book.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/routes/app_pages.dart';
import '../../../data/provider/storage_provider.dart';
import '../controllers/book_controller.dart';
import '../../../data/constant/endpoint.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String? username = StorageProvider.read(StorageKey.idUser);
    return Scaffold(
        backgroundColor: Colors.black,
        body: controller.obx((state) => Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // this will align the children to the far left and right of the container
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Image.asset('assets/marnoski.png'),
                  ),
                ],
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 20,
                      child: Text(
                        'PINJAM BUKU \n'
                            'PERPUSTAKAAN',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Livvic',
                            fontSize: 24),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 20,
                      child: Text(
                        '\nBUKU TERBARU',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Livvic',
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
                              onTap: () => Get.toNamed(Routes.ADD_PEMINJAMAN, parameters: {
                                'id' : (dataBook.id ?? 0).toString(),
                                'judul' : dataBook.judul ?? '-',
                                'gambar' : (dataBook.gambar ?? 0).toString()
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
                  'Copyright ©Tant 2024',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Livvic',
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