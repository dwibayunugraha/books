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