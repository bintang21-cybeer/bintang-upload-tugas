int sequentialSearch(List<int> arr, int x) {
  int perbandingan = 0; // Variabel untuk menghitung jumlah perbandingan.

  for (int i = 0; i < arr.length; i++) {
    perbandingan++; // Menambahkan setiap kali melakukan perbandingan.
    if (arr[i] == x) {
      // Jika elemen ditemukan.
      print("Jumlah perbandingan: $perbandingan");
      return i; // Kembalikan indeks elemen yang ditemukan.
    }
  }

  print("Jumlah perbandingan: $perbandingan");
  return -1; // Jika elemen tidak ditemukan, kembalikan -1.
}

// Binary Search dengan jumlah perbandingan
int binarySearch(List<int> arr, int x) {
  int l = 0; // Indeks awal.
  int r = arr.length - 1; // Indeks akhir.
  int perbandingan = 0; // Variabel untuk menghitung jumlah perbandingan.

  while (l <= r) {
    int mid = (l + r) ~/ 2; // Hitung indeks tengah.
    perbandingan++; // Menambahkan setiap kali melakukan perbandingan.

    if (arr[mid] == x) {
      // Jika elemen ditemukan di tengah.
      print("Jumlah perbandingan: $perbandingan");
      return mid; // Kembalikan indeks elemen yang ditemukan.
    } else if (arr[mid] < x) {
      // Jika elemen target lebih besar dari elemen tengah.
      l = mid + 1; // Pindahkan batas bawah ke kanan.
    } else {
      // Jika elemen target lebih kecil dari elemen tengah.
      r = mid - 1; // Pindahkan batas atas ke kiri.
    }
  }

  print("Jumlah perbandingan: $perbandingan");
  // Jika elemen tidak ditemukan, kembalikan -1.
  return -1;
}

void main() {
  // Contoh array yang akan digunakan untuk pencarian.
  List<int> arr = [2, 3, 4, 10, 40];
  int x = 10; // Elemen yang akan dicari.

  print("--- Sequential Search ---");
  // Panggil fungsi sequentialSearch dan tampilkan hasilnya.
  int hasilSeq = sequentialSearch(arr, x);
  print(hasilSeq != -1 ? "Ditemukan pada indeks $hasilSeq" : "Tidak ditemukan");

  print("\n--- Binary Search ---");
  // Panggil fungsi binarySearch dan tampilkan hasilnya.
  int hasilBin = binarySearch(arr, x);
  print(hasilBin != -1 ? "Ditemukan pada indeks $hasilBin" : "Tidak ditemukan");
}
