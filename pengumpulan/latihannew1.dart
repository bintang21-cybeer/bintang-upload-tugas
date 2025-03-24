import 'dart:math';
import 'dart:io';

// Fungsi untuk menghasilkan array acak
List<int> generateRandomArray(int size) {
  Random random = Random();
  return List.generate(size, (_) => random.nextInt(100000));
}

// Implementasi berbagai algoritma sorting
void insertionSort(List<int> arr) {
  for (int i = 1; i < arr.length; i++) {
    int key = arr[i];
    int j = i - 1;
    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = key;
  }
}

void selectionSort(List<int> arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    int minIndex = i;
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[j] < arr[minIndex]) {
        minIndex = j;
      }
    }
    int temp = arr[minIndex];
    arr[minIndex] = arr[i];
    arr[i] = temp;
  }
}

void bubbleSort(List<int> arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    for (int j = 0; j < arr.length - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
}

void shellSort(List<int> arr) {
  int n = arr.length;
  for (int gap = n ~/ 2; gap > 0; gap ~/= 2) {
    for (int i = gap; i < n; i++) {
      int temp = arr[i];
      int j;
      for (j = i; j >= gap && arr[j - gap] > temp; j -= gap) {
        arr[j] = arr[j - gap];
      }
      arr[j] = temp;
    }
  }
}

void quickSort(List<int> arr, int low, int high) {
  if (low < high) {
    int pi = partition(arr, low, high);
    quickSort(arr, low, pi - 1);
    quickSort(arr, pi + 1, high);
  }
}

int partition(List<int> arr, int low, int high) {
  int pivot = arr[high];
  int i = low - 1;
  for (int j = low; j < high; j++) {
    if (arr[j] < pivot) {
      i++;
      int temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
    }
  }
  int temp = arr[i + 1];
  arr[i + 1] = arr[high];
  arr[high] = temp;
  return i + 1;
}

void mergeSort(List<int> arr, int left, int right) {
  if (left < right) {
    int mid = left + (right - left) ~/ 2;
    mergeSort(arr, left, mid);
    mergeSort(arr, mid + 1, right);
    merge(arr, left, mid, right);
  }
}

void merge(List<int> arr, int left, int mid, int right) {
  int n1 = mid - left + 1;
  int n2 = right - mid;
  List<int> L = List.filled(n1, 0);
  List<int> R = List.filled(n2, 0);

  for (int i = 0; i < n1; i++) L[i] = arr[left + i];
  for (int j = 0; j < n2; j++) R[j] = arr[mid + 1 + j];

  int i = 0, j = 0, k = left;
  while (i < n1 && j < n2) {
    if (L[i] <= R[j]) {
      arr[k] = L[i];
      i++;
    } else {
      arr[k] = R[j];
      j++;
    }
    k++;
  }
  while (i < n1) {
    arr[k] = L[i];
    i++;
    k++;
  }
  while (j < n2) {
    arr[k] = R[j];
    j++;
    k++;
  }
}

// Fungsi untuk mengukur waktu eksekusi sorting
void measureSortingTime(int dataSize) {
  List<int> data = generateRandomArray(dataSize);

  List<int> copy1 = List.from(data);
  List<int> copy2 = List.from(data);
  List<int> copy3 = List.from(data);
  List<int> copy4 = List.from(data);
  List<int> copy5 = List.from(data);
  List<int> copy6 = List.from(data);

  Stopwatch stopwatch = Stopwatch();

  stopwatch.start();
  insertionSort(copy1);
  stopwatch.stop();
  var insertionTime = stopwatch.elapsedMilliseconds;
  stopwatch.reset();

  stopwatch.start();
  selectionSort(copy2);
  stopwatch.stop();
  var selectionTime = stopwatch.elapsedMilliseconds;
  stopwatch.reset();

  stopwatch.start();
  bubbleSort(copy3);
  stopwatch.stop();
  var bubbleTime = stopwatch.elapsedMilliseconds;
  stopwatch.reset();

  stopwatch.start();
  shellSort(copy4);
  stopwatch.stop();
  var shellTime = stopwatch.elapsedMilliseconds;
  stopwatch.reset();

  stopwatch.start();
  quickSort(copy5, 0, copy5.length - 1);
  stopwatch.stop();
  var quickTime = stopwatch.elapsedMilliseconds;
  stopwatch.reset();

  stopwatch.start();
  mergeSort(copy6, 0, copy6.length - 1);
  stopwatch.stop();
  var mergeTime = stopwatch.elapsedMilliseconds;
  stopwatch.reset();

  print(
      "$dataSize\t$insertionTime\t$selectionTime\t$bubbleTime\t$shellTime\t$quickTime\t$mergeTime");
}

// Main function untuk menjalankan pengujian
void main() {
  List<int> dataSizes = [
    50000,
    100000,
    150000,
    200000,
    250000,
    300000,
    350000,
    400000,
    450000,
    500000
  ];

  print("Jumlah Data\tInsertion\tSelection\tBubble\tShell\tQuick\tMerge");
  for (var size in dataSizes) {
    measureSortingTime(size);
  }
}
