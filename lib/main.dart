import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dwi Bayu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Untuk membuat tampilan aplikasi beradaptasi dengan baik pada berbagai perangkat
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';

  // https://www.google.co.id/books/edition/Batman_and_Philosophy/hf5f3r38P1cC

  // Fungsi getData() untuk mengambil data dari API Google Books
  Future<Response> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/hf5f3r38P1cC';
    Uri uri = Uri.https(authority, path);
    return http.get(uri);
  }

  // Fungsi returnOneAsync() untuk mengembalikan nilai 1 setelah 3 detik
  Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  // Fungsi returnTwoAsync() untuk mengembalikan nilai 2 setelah 3 detik
  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  // Fungsi returnThreeAsync() untuk mengembalikan nilai 3 setelah 3 detik
  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }

  // Fungsi count() untuk menjumlahkan nilai yang dikembalikan oleh fungsi returnOneAsync(), returnTwoAsync(), dan returnThreeAsync()
  Future count() async {
    int total = 0;
    total += await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();
    setState(() {
      result = total.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Back from the Future')),
      body: Center(
        child: Column(
          children: [
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // setState(() {
                //   getData().then((value) {
                //     // Mengambil data dari API Google Books
                //     result = value.body
                //         .toString()
                //         .substring(0, 450); // Menampilkan 450 karakter pertama
                //     setState(() {});
                //   }).catchError((_) {
                //     result = 'An error occurred';
                //     setState(() {});
                //   });
                // });
                count();
              },
              child: const Text('Go'),
            ),
            Spacer(),
            Text(result),
            Spacer(),
            CircularProgressIndicator(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
