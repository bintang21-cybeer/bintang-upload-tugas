import 'dart:io';

void generateCombinations(
    String current, int length, int maxLength, List<String> chars) {
  if (length == maxLength) {
    stdout.write('$current '); // Cetak kombinasi saat panjangnya mencapai batas
    return;
  }

  for (String char in chars) {
    generateCombinations(current + char, length + 1, maxLength, chars);
  }
}

void main() {
  stdout.write('Masukkan jumlah karakter (N): ');
  int n = int.parse(stdin.readLineSync()!);

  List<String> chars = [
    'a',
    'b',
    'c'
  ]; // Karakter yang digunakan dalam kombinasi

  print('\nKombinasi yang dihasilkan:');
  generateCombinations('', 0, n, chars);

  print('\nBUILD SUCCESSFUL'); // Simulasi output akhir
}
