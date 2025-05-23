import 'dart:async';

import 'package:books/geolocation.dart';
import 'package:books/navigation_dialog.dart';
import 'package:books/navigation_first.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

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
      home: const NavigationDialogScreen(),
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

  late Completer
  completer; // membuat objek  future yang akan dikembalikan nanti late
  // untuk mengembalikan nilai 42 setelah 5 detik
  Future getNumber() {
    completer = Completer<int>();
    calculate();
    return completer.future;
  }

  // untuk menghitung nilai 42
  // Future calculate() async {
  //   await Future.delayed(const Duration(seconds: 5));
  //   completer.complete(42);
  // }

  // untuk menghitung nilai 42 dan menangkap error jika terjadi
  calculate() async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      completer.complete(42);
    } catch (_) {
      completer.completeError({});
    }
  }

  // FutureGroup
  // FutureGroup adalah kelas yang memungkinkan kita untuk mengelola beberapa future sekaligus.
  void returnFG() {
    // FutureGroup<int> futureGroup = FutureGroup<int>();
    // futureGroup.add(returnOneAsync());
    // futureGroup.add(returnTwoAsync());
    // futureGroup.add(returnThreeAsync());
    // futureGroup.close();
    //futureGroup.future.then((List<int> value) {
    //   int total = 0;
    //   for (var element in value) {
    //     total += element;
    //   }
    //   setState(() {
    //     result = total.toString();
    //   });
    // });

    final futures = Future.wait<int>([
      returnOneAsync(),
      returnTwoAsync(),
      returnThreeAsync(),
    ]);
    futures.then((List<int> value) {
      int total = 0;
      for (var element in value) {
        total += element;
      }
      setState(() {
        result = total.toString();
      });
    });
  }

  Future returnError() async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception('Something terrible happened !');
  }

  // untuk menangkap error yang terjadi
  Future handleError() async {
    try {
      await returnError();
    } catch (error) {
      setState(() {
        result = error.toString();
      });
    } finally {
      print('Complete');
    }
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
                handleError();
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
