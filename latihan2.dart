// Kelas Mahasiswa yang mengimplementasikan Comparable
class Mahasiswa implements Comparable<Mahasiswa> {
  String nrp;
  String nama;

  Mahasiswa(this.nrp, this.nama);

  // Implementasi fungsi compareTo untuk membandingkan NRP
  @override
  int compareTo(Mahasiswa other) {
    return nrp.compareTo(other.nrp); // Mengurutkan berdasarkan NRP
  }

  // Representasi objek Mahasiswa dalam bentuk string
  @override
  String toString() {
    return 'NRP: $nrp, Nama: $nama';
  }
}

// Fungsi utama untuk menguji class Mahasiswa
void main() {
  // Membuat daftar mahasiswa dengan NRP acak
  List<Mahasiswa> mahasiswaList = [
    Mahasiswa("2042", "Budi"),
    Mahasiswa("2041", "Andi"),
    Mahasiswa("2044", "Udin"),
    Mahasiswa("2043", "Candra"),
  ];

  print("Sebelum Pengurutan:");
  print(mahasiswaList);

  // Mengurutkan daftar mahasiswa berdasarkan NRP (Ascending)
  mahasiswaList.sort(); // Menggunakan compareTo() secara otomatis

  print("\nSetelah Pengurutan:");
  print(mahasiswaList);
}
