void sequentialSearchAll(List<int> arr, int x) {
  List<int> indeksDitemukan =
      []; // List untuk menyimpan indeks elemen yang ditemukan.

  // Iterasi melalui setiap elemen dalam array.
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] == x) {
      // Jika elemen pada indeks i sama dengan elemen yang dicari.
      indeksDitemukan.add(i); // Tambahkan indeks ke list indeksDitemukan.
    }
  }

  // Periksa apakah elemen ditemukan atau tidak.
  if (indeksDitemukan.isNotEmpty) {
    // Jika list indeksDitemukan tidak kosong, cetak semua indeks elemen yang ditemukan.
    print("Elemen ditemukan pada indeks: ${indeksDitemukan.join(', ')}");
  } else {
    // Jika list indeksDitemukan kosong, berarti elemen tidak ditemukan.
    print("Elemen tidak ditemukan dalam array.");
  }
}

void main() {
  // Contoh array yang akan digunakan untuk pencarian.
  List<int> arr = [3, 10, 4, 10, 10, 2, 10];
  int x = 10; // Elemen yang akan dicari.

  print("data array: $arr");
  print("elemen yang dicari: $x");
  // Panggil fungsi sequentialSearchAll untuk mencari semua kemunculan elemen.
  sequentialSearchAll(arr, x);
}
