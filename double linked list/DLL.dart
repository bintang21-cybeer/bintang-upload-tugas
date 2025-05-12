import 'dart:io';

// Node class
class DNode<T> {
  T? nodeValue;
  DNode<T>? prev;
  DNode<T>? next;

  DNode(this.nodeValue) {
    next = null;
    prev = null;
  }
}

// Double Linked List class
class DoubleLinkedList<T> {
  DNode<T>? head;
  DNode<T>? tail;

  bool isEmpty() {
    return head == null;
  }

  void append(T data) {
    DNode<T> newNode = DNode<T>(data);
    if (isEmpty()) {
      head = newNode;
      tail = newNode;
    } else {
      print("Data sudah ada pada Linked List!");
    }
  }

  void insertBeforeHead(T data) {
    DNode<T> newNode = DNode<T>(data);
    if (isEmpty()) {
      append(data);
    } else {
      newNode.next = head;
      head!.prev = newNode;
      head = newNode;
    }
  }

  void insertTailNode(T data) {
    DNode<T> newNode = DNode<T>(data);
    if (isEmpty()) {
      append(data);
    } else {
      DNode<T>? temp = head;
      while (temp!.next != null) {
        temp = temp.next;
      }
      temp.next = newNode;
      newNode.prev = temp;
      tail = newNode;
    }
  }

  void insertCustom(DNode<T> temp, T data) {
    if (isEmpty() || temp == null) {
      print("Node tidak ditemukan.");
      return;
    }
    DNode<T> newNode = DNode<T>(data);
    newNode.next = temp.next;
    newNode.prev = temp;
    if (temp.next != null) {
      temp.next!.prev = newNode;
    }
    temp.next = newNode;
    if (temp == tail) {
      tail = newNode;
    }
  }

  void deleteFront() {
    if (!isEmpty()) {
      if (head!.next != null) {
        DNode<T>? deleteNode = head;
        head = head!.next;
        head!.prev = null;
        deleteNode!.next = null;
      } else {
        head = null;
        tail = null;
      }
    }
  }

  void deleteEnd() {
    if (!isEmpty()) {
      if (head!.next != null) {
        DNode<T>? temp = head;
        while (temp!.next!.next != null) {
          temp = temp.next;
        }
        temp.next!.prev = null;
        temp.next = null;
        tail = temp;
      } else {
        head = null;
        tail = null;
      }
    }
  }

  void printList() {
    DNode<T>? temp = head;
    DNode<T>? last;

    print("Traversal in Forward Direction:");
    while (temp != null) {
      stdout.write("${temp.nodeValue} ");
      last = temp;
      temp = temp.next;
    }
    print("");

    print("Traversal in Reverse Direction:");
    while (last != null) {
      stdout.write("${last.nodeValue} ");
      last = last.prev;
    }
    print("\n");
  }
}

// MAIN FUNCTION
void main() {
  var list = DoubleLinkedList<int>();

  print("Menambahkan data awal:");
  list.append(10); // hanya akan ditambahkan jika list kosong
  list.printList();

  print("Menambahkan data di depan:");
  list.insertBeforeHead(5);
  list.insertBeforeHead(3);
  list.printList();

  print("Menambahkan data di akhir:");
  list.insertTailNode(20);
  list.insertTailNode(25);
  list.printList();

  print("Menyisipkan data setelah node ke-2 (yaitu nilai 5):");
  DNode<int>? node = list.head?.next; // node dengan nilai 5
  if (node != null) {
    list.insertCustom(node, 7);
  }
  list.printList();

  print("Menghapus node dari depan:");
  list.deleteFront();
  list.printList();

  print("Menghapus node dari akhir:");
  list.deleteEnd();
  list.printList();
}
