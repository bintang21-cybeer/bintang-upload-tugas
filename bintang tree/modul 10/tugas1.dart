class Simpul<T extends Comparable> {
  T nilai;
  Simpul<T>? kiri;
  Simpul<T>? kanan;

  Simpul(this.nilai);
}

class PohonPencarianBiner<T extends Comparable> {
  Simpul<T>? _akar;

  /// ===== FUNGSI UTAMA =====

  /// Menambahkan nilai ke dalam pohon
  void tambah(T nilaiBaru) => _akar = _tambahRekursif(_akar, nilaiBaru);

  /// Mengecek apakah nilai tertentu ada di pohon
  bool mengandung(T nilai) => _cariRekursif(_akar, nilai);

  /// Mengambil nilai terkecil dari pohon
  T? terkecil() {
    if (_akar == null) return null;
    Simpul<T> saatIni = _akar!;
    while (saatIni.kiri != null) {
      saatIni = saatIni.kiri!;
    }
    return saatIni.nilai;
  }

  /// Mengambil nilai terbesar dari pohon
  T? terbesar() {
    if (_akar == null) return null;
    Simpul<T> saatIni = _akar!;
    while (saatIni.kanan != null) {
      saatIni = saatIni.kanan!;
    }
    return saatIni.nilai;
  }

  /// Menampilkan isi pohon dalam urutan naik
  List<T> keList() {
    final hasil = <T>[];
    _inOrder(_akar, hasil);
    return hasil;
  }

  /// ====== FUNGSI BANTUAN ======

  Simpul<T>? _tambahRekursif(Simpul<T>? simpul, T nilai) {
    if (simpul == null) return Simpul<T>(nilai);

    if (nilai.compareTo(simpul.nilai) < 0) {
      simpul.kiri = _tambahRekursif(simpul.kiri, nilai);
    } else if (nilai.compareTo(simpul.nilai) > 0) {
      simpul.kanan = _tambahRekursif(simpul.kanan, nilai);
    }

    return simpul;
  }

  bool _cariRekursif(Simpul<T>? simpul, T nilai) {
    if (simpul == null) return false;

    if (nilai.compareTo(simpul.nilai) < 0) {
      return _cariRekursif(simpul.kiri, nilai);
    } else if (nilai.compareTo(simpul.nilai) > 0) {
      return _cariRekursif(simpul.kanan, nilai);
    } else {
      return true;
    }
  }

  void _inOrder(Simpul<T>? simpul, List<T> hasil) {
    if (simpul == null) return;
    _inOrder(simpul.kiri, hasil);
    hasil.add(simpul.nilai);
    _inOrder(simpul.kanan, hasil);
  }
}

/// ===== CONTOH PENGGUNAAN =====
void main() {
  final pohon = PohonPencarianBiner<int>();

  // Menambahkan nilai ke pohon
  for (var nilai in [50, 30, 70, 20, 40, 60, 80]) {
    pohon.tambah(nilai);
  }

  // Menampilkan isi pohon secara terurut
  print('Isi pohon (urutan naik): ${pohon.keList()}');

  // Menampilkan nilai terkecil
  print('Nilai terkecil: ${pohon.terkecil()}');

  // Menampilkan nilai terbesar
  print('Nilai terbesar: ${pohon.terbesar()}');

  // Mengecek keberadaan nilai tertentu
  print('Apakah 40 ada di pohon? ${pohon.mengandung(40)}');
  print('Apakah 90 ada di pohon? ${pohon.mengandung(90)}');
}
