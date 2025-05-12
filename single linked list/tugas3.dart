// Node class
class Node<T> {
  T? nodeValue;
  Node<T>? next;

  // Default constructor (tanpa parameter)
  Node.empty() {
    nodeValue = null;
    next = null;
  }

  // Constructor dengan data awal
  Node(T item) {
    nodeValue = item;
    next = null;
  }
}

// SingleLinkedList class
class SingleLinkedList<T> {
  Node<T>? head;

  // Menambahkan data di akhir
  void append(T data) {
    Node<T> newNode = Node<T>(data);

    if (head == null) {
      head = newNode;
    } else {
      Node<T>? temp = head;
      while (temp!.next != null) {
        temp = temp.next;
      }
      temp.next = newNode;
    }
  }

  // Menampilkan isi list
  void printList() {
    Node<T>? temp = head;
    while (temp != null) {
      print(temp.nodeValue);
      temp = temp.next;
    }
  }

  // Mencari node berdasarkan nilai
  Node<T>? findNode(T data) {
    Node<T>? current = head;

    while (current != null) {
      if (current.nodeValue == data) {
        return current;
      }
      current = current.next;
    }

    return null;
  }
}

// Main function
void main() {
  SingleLinkedList<int> list = SingleLinkedList<int>();

  list.append(10);
  list.append(20);
  list.append(30);
  list.append(40);

  print("Isi Linked List:");
  list.printList();

  int searchValue = 20;
  Node<int>? result = list.findNode(searchValue);

  if (result != null) {
    print("Node ditemukan dengan nilai: ${result.nodeValue}");
  } else {
    print("Node dengan nilai $searchValue tidak ditemukan.");
  }
}
