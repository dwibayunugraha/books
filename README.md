# Tugas Pemrograman Asynchronous di Flutter


## Deskripsi Proyek

Proyek Flutter yang mendemonstrasikan operasi asynchronous dan integrasi API.

## Laporan Praktikum

### Soal no 1
Menambahkan nama panggilan pada title app sebagai identitas hasil pekerjaan.

```dart
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Dwi Bayu',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: const FuturePage(),
  );
}
```

### Soal no 2

Implementasi pencarian buku menggunakan Google Books API.
[Lihat Contoh Buku Batman](https://www.google.co.id/books/edition/Batman_and_Philosophy/hf5f3r38P1cC)

![Hasil Pencarian Buku](/images/captureno2.png)

### Soal no 3

```dart
setState(() {
  getData().then((value) {
    result = value.body
        .toString()
        .substring(0, 450);
    setState(() {});
  }).catchError((_) {
    result = 'An error occurred';
    setState(() {});
  });
});
```

#### Penjelasan:

- **Implementasi Substring**: Mengambil 450 karakter pertama dari respons
- **Catch Error**: Menangani kegagalan API dengan baik
- **Set State**: Memperbarui UI secara tepat

#### Demo

![Capture no 3](/images/captureno3.gif)

### Soal no 4

#### Langkah 1
```dart
Future<int> returnOneAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 1;
}

Future<int> returnTwoAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 2;
}

Future<int> returnThreeAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 3;
}
```

#### Langkah 2
```dart
Future count() async {
  int total = 0;
  total += await returnOneAsync();
  total += await returnTwoAsync();
  total += await returnThreeAsync();
  setState(() {
    result = total.toString();
  });
}
```

#### Penjelasan:
- **Fungsi returnOneAsync()**: untuk mengembalikan nilai 1 setelah 3 detik
- **Fungsi returnTwoAsync()**: untuk mengembalikan nilai 2 setelah 3 detik
- **Fungsi returnThreeAsync()**: untuk mengembalikan nilai 3 setelah 3 detik
- **Future count() async**: Fungsi count() untuk menjumlahkan nilai yang dikembalikan oleh fungsi returnOneAsync(), returnTwoAsync(), dan returnThreeAsync(). Menggunakan setState() untuk memperbarui UI dengan hasil total
Hasil akhir dikonversi ke string dan disimpan dalam variabel result

![Capture no 4](/images/captureno4.gif)
### Soal No 5

#### Langkah 2
```dart
late Completer completer;

Future getNumber() {
  completer = Completer<int>();
  calculate();
  return completer.future;
}

Future calculate() async {
  await Future.delayed(const Duration(seconds : 5));
  completer.complete(42);
}
```

#### Penjelasan:
- **late Completer**: Menggunakan keyword late karena akan diinisialisasi nanti. Completer adalah class untuk mengelola Future secara manual
- **Fungsi getNumber()**: Membuat Completer baru yang akan menghasilkan nilai integer. Memanggil fungsi calculate() secara async. Mengembalikan Future yang akan selesai ketika Completer complete
- **Fungsi calculate()**: Fungsi async dengan delay 5 detik
Setelah delay, menyelesaikan Completer dengan nilai 42

#### Demo
![Capture no 5](/images/captureno5.gif)