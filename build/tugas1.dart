import 'dart:io';

// Fungsi rekursif untuk menghitung koefisien binomial (nCr)
int pascal(int n, int k) {
  if (k == 0 || k == n) {
    return 1; // Elemen pertama dan terakhir di setiap baris selalu 1
  } else {
    return pascal(n - 1, k - 1) + pascal(n - 1, k); // Rumus Pascal's Triangle
  }
}

// Fungsi untuk mencetak segitiga Pascal
void printPascalTriangle(int numRows) {
  for (int i = 0; i < numRows; i++) {
    // Menampilkan spasi untuk membuat bentuk segitiga
    stdout.write(' ' * (numRows - i));

    // Menampilkan nilai di setiap baris
    for (int j = 0; j <= i; j++) {
      stdout.write('${pascal(i, j)} ');
    }
    print(''); // Pindah ke baris berikutnya
  }
}

void main() {
  stdout.write('Masukkan jumlah baris segitiga Pascal: ');
  int numRows = int.parse(stdin.readLineSync()!);
  printPascalTriangle(numRows);
}
