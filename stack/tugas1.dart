import 'dart:io';

class KonversiBilangan {
  int desimal;

  KonversiBilangan(this.desimal);

  String keBiner() {
    return desimal.toRadixString(2);
  }

  String keOktal() {
    return desimal.toRadixString(8);
  }

  String keHeksadesimal() {
    return desimal.toRadixString(16).toUpperCase();
  }
}

void main() {
  stdout.write('Masukkan nilai desimal = ');
  int desimal = int.parse(stdin.readLineSync()!);

  KonversiBilangan konversi = KonversiBilangan(desimal);

  print('Hasil nilai biner = ${konversi.keBiner()}');
  print('Hasil nilai oktal = ${konversi.keOktal()}');
  print('Hasil nilai heksadesimal = ${konversi.keHeksadesimal()}');
}
