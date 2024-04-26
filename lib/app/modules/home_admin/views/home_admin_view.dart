import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/provider/storage_provider.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/modules/book/views/book_view.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/routes/app_pages.dart';
// import '../../../data/provider/storage_provider.dart';
import '../controllers/home_admin_controller.dart';

class HomeAdminView extends GetView<HomeAdminController> {
  const HomeAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Rekomendasi',
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Livvic'),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 200.0,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        enlargeCenterPage: true,
                      ),
                      items: [
                        Container(
                          margin: EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            child: Image.network(
                              'assets/bintang.jpg',
                              fit: BoxFit.cover,
                              width: 1000.0,
                              height: 200.0,
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            child: Image.network(
                              'assets/bulan.jpg',
                              fit: BoxFit.cover,
                              width: 1000.0,
                              height: 200.0,
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            child: Image.network(
                              'assets/matahari.jpg',
                              fit: BoxFit.cover,
                              width: 1000.0,
                              height: 200.0,
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                // ...
              ],
            ),
            Positioned(
              top: 10,
              right: 10,
              child: CircleAvatar(
                backgroundImage: AssetImage('sir.jpg'),
                radius: 25,
              ),
            ),
            Positioned(
              bottom: 220,
              left: 10,
              right: 10,
              child: Container(
                height: 320, // set the height of the container
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, count) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 180,
                          height: 320,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0),
                            color: Colors.grey,
                          ),
                        ),
                      );
                    }
                ),
              ),
            ),
            Positioned(
              bottom: 530,
              left: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Riwayat Baca',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Livvic'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Center(
                child: Image(
                  image: AssetImage('assets/marnoski.png'), // replace with your logo image path
                  height: 200,
                  width: 200,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black, // Background color
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.blue),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.history, color: Colors.grey),
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                            // Action when home button is pressed
                          },
                        ),
                        Text(
                          'History',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.bookmark, color: Colors.grey),
                          onPressed: () {
                            Navigator.pushNamed(context, '/book');
                            // Action when bookmark button is pressed
                          },
                        ),
                        Text(
                          'Peminjaman',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.home, color: Colors.grey),
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                            // Action when add button is pressed
                          },
                        ),
                        Text(
                          'Home',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.search, color: Colors.grey),
                          onPressed: () {
                            // Action when search button is pressed
                          },
                        ),
                        Text(
                          'Search',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.exit_to_app, color: Colors.grey),
                          onPressed: () {
                            logoutUser();
                            // Action when profile button is pressed
                          },
                        ),
                        Text(
                          'Logout',
                          style: TextStyle(color: Colors.grey),
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
    );
  }
}
void logoutUser() {
  // Show an alert dialog to confirm logout
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
            // Clear user's session data and navigate to the login page
            StorageProvider.clearAll();
            Get.offNamed(Routes.LOGIN);
          },
          child: Text('Logout'),
        ),
      ],
    ),
  );
}