void insertionSortAscending<T extends Comparable<T>>(List<T> arr) {
  for (int i = 1; i < arr.length; i++) {
    T key = arr[i]; // Ambil elemen yang akan disisipkan
    int j = i - 1;

    // Geser elemen yang lebih besar dari key ke kanan (ascending)
    while (j >= 0 && arr[j].compareTo(key) > 0) {
      arr[j + 1] = arr[j];
      j--;
    }

    // Sisipkan key pada posisi yang tepat
    arr[j + 1] = key;
  }
}

void insertionSortDescending<T extends Comparable<T>>(List<T> arr) {
  for (int i = 1; i < arr.length; i++) {
    T key = arr[i]; // Ambil elemen yang akan disisipkan
    int j = i - 1;

    // Geser elemen yang lebih kecil dari key ke kanan (descending)
    while (j >= 0 && arr[j].compareTo(key) < 0) {
      arr[j + 1] = arr[j];
      j--;
    }

    // Sisipkan key pada posisi yang tepat
    arr[j + 1] = key;
  }
}

void display<T>(List<T> data) {
  for (T obj in data) {
    print('$obj ');
  }
  print('');
}

void main() {
  List<num> data = List<num>.generate(5, (index) => (index + 1) * 2);
  data.shuffle(); // Acak data sebelum disortir
  print('Data Sebelum Pengurutan:');
  display(data);

  // Pengurutan Ascending
  DateTime start = DateTime.now();
  insertionSortAscending<num>(data);
  Duration elapsedTime = DateTime.now().difference(start);
  print('Data Setelah Pengurutan Ascending:');
  display(data);
  print('Waktu (Ascending): $elapsedTime');

  // Mengacak data lagi untuk percobaan Descending
  data.shuffle();
  print('Data Sebelum Pengurutan Descending:');
  display(data);

  // Pengurutan Descending
  start = DateTime.now();
  insertionSortDescending<num>(data);
  elapsedTime = DateTime.now().difference(start);
  print('Data Setelah Pengurutan Descending:');
  display(data);
  print('Waktu (Descending): $elapsedTime');
}
