import 'dart:io';
import 'dart:math';

// Fungsi untuk mengukur waktu eksekusi
void measureTime(void Function(List<int>, bool) sortFunction, List<int> data,
    String algorithm, bool ascending) {
  final stopwatch = Stopwatch()..start();
  sortFunction(data, ascending);
  stopwatch.stop();
  print('$algorithm took ${stopwatch.elapsedMilliseconds} ms');
}

// Insertion Sort
void insertionSort(List<int> arr, bool ascending) {
  for (int i = 1; i < arr.length; i++) {
    int key = arr[i];
    int j = i - 1;
    while (j >= 0 && ((ascending ? arr[j] > key : arr[j] < key))) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = key;
  }
}

// Selection Sort
void selectionSort(List<int> arr, bool ascending) {
  for (int i = 0; i < arr.length - 1; i++) {
    int minIndex = i;
    for (int j = i + 1; j < arr.length; j++) {
      if (ascending ? arr[j] < arr[minIndex] : arr[j] > arr[minIndex]) {
        minIndex = j;
      }
    }
    int temp = arr[i];
    arr[i] = arr[minIndex];
    arr[minIndex] = temp;
  }
}

// Bubble Sort
void bubbleSort(List<int> arr, bool ascending) {
  bool swapped;
  do {
    swapped = false;
    for (int i = 0; i < arr.length - 1; i++) {
      if (ascending ? arr[i] > arr[i + 1] : arr[i] < arr[i + 1]) {
        int temp = arr[i];
        arr[i] = arr[i + 1];
        arr[i + 1] = temp;
        swapped = true;
      }
    }
  } while (swapped);
}

// Shell Sort
void shellSort(List<int> arr, bool ascending) {
  int n = arr.length;
  int gap = n ~/ 2;
  while (gap > 0) {
    for (int i = gap; i < n; i++) {
      int temp = arr[i];
      int j = i;
      while (
          j >= gap && (ascending ? arr[j - gap] > temp : arr[j - gap] < temp)) {
        arr[j] = arr[j - gap];
        j -= gap;
      }
      arr[j] = temp;
    }
    gap ~/= 2;
  }
}

// Quick Sort
void quickSort(List<int> arr, int low, int high, bool ascending) {
  if (low < high) {
    int pivotIndex = partition(arr, low, high, ascending);
    quickSort(arr, low, pivotIndex - 1, ascending);
    quickSort(arr, pivotIndex + 1, high, ascending);
  }
}

int partition(List<int> arr, int low, int high, bool ascending) {
  int pivot = arr[high];
  int i = low - 1;
  for (int j = low; j < high; j++) {
    if (ascending ? arr[j] <= pivot : arr[j] >= pivot) {
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

// Merge Sort
void mergeSort(List<int> arr, int left, int right, bool ascending) {
  if (left < right) {
    int mid = (left + right) ~/ 2;
    mergeSort(arr, left, mid, ascending);
    mergeSort(arr, mid + 1, right, ascending);
    merge(arr, left, mid, right, ascending);
  }
}

void merge(List<int> arr, int left, int mid, int right, bool ascending) {
  int n1 = mid - left + 1;
  int n2 = right - mid;
  List<int> leftArray = List.filled(n1, 0);
  List<int> rightArray = List.filled(n2, 0);

  for (int i = 0; i < n1; i++) leftArray[i] = arr[left + i];
  for (int j = 0; j < n2; j++) rightArray[j] = arr[mid + 1 + j];

  int i = 0, j = 0, k = left;
  while (i < n1 && j < n2) {
    if (ascending
        ? leftArray[i] <= rightArray[j]
        : leftArray[i] >= rightArray[j]) {
      arr[k] = leftArray[i];
      i++;
    } else {
      arr[k] = rightArray[j];
      j++;
    }
    k++;
  }

  while (i < n1) {
    arr[k] = leftArray[i];
    i++;
    k++;
  }

  while (j < n2) {
    arr[k] = rightArray[j];
    j++;
    k++;
  }
}

// Menu untuk memilih algoritma dan urutan
void main() {
  print("ALGORITMA SORTING");
  print("1. Insertion");
  print("2. Selection");
  print("3. Bubble");
  print("4. Shell");
  print("5. Quick");
  print("6. Merge");
  stdout.write("Pilihan: ");
  int algoChoice = int.parse(stdin.readLineSync()!);

  print("\n1. Ascending");
  print("2. Descending");
  stdout.write("Pilihan: ");
  int orderChoice = int.parse(stdin.readLineSync()!);

  bool ascending = (orderChoice == 1);

  // Generate data acak
  List<int> data = List.generate(100, (index) => Random().nextInt(1000));

  // Pilih algoritma berdasarkan input
  switch (algoChoice) {
    case 1:
      measureTime(insertionSort, List.from(data), "Insertion Sort", ascending);
      break;
    case 2:
      measureTime(selectionSort, List.from(data), "Selection Sort", ascending);
      break;
    case 3:
      measureTime(bubbleSort, List.from(data), "Bubble Sort", ascending);
      break;
    case 4:
      measureTime(shellSort, List.from(data), "Shell Sort", ascending);
      break;
    case 5:
      measureTime(
          (arr, ascending) => quickSort(arr, 0, arr.length - 1, ascending),
          List.from(data),
          "Quick Sort",
          ascending);
      break;
    case 6:
      measureTime(
          (arr, ascending) => mergeSort(arr, 0, arr.length - 1, ascending),
          List.from(data),
          "Merge Sort",
          ascending);
      break;
    default:
      print("Pilihan tidak valid.");
  }
}
