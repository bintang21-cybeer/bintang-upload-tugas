class Node<T> {
  T? nodeValue; // untuk menyimpan data
  Node<T>? next; // menunjuk ke node berikutnya

  // Default constructor (tanpa nilai awal)
  Node() {
    nodeValue = null;
    next = null;
  }

  // Constructor dengan nilai awal
  Node.withValue(T item) {
    nodeValue = item;
    next = null;
  }
}
