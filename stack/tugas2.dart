import 'dart:io';

class Kalimat {
  String teks;

  Kalimat(this.teks);

  String balik() {
    return teks.split('').reversed.join('');
  }

  bool adalahPalindrom() {
    String bersih = teks.replaceAll(' ', '').toLowerCase();
    String terbalik = bersih.split('').reversed.join('');
    return bersih == terbalik;
  }
}

void main() {
  stdout.write('Masukkan kalimat: ');
  String input = stdin.readLineSync()!;

  Kalimat kalimat = Kalimat(input);

  print('Hasil = ${kalimat.balik()}');

  if (kalimat.adalahPalindrom()) {
    print('Palindrom');
  } else {
    print('Bukan palindrom');
  }
}
