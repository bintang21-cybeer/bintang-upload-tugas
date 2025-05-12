import 'class-node.dart';

class SingleLinkedList<T> {
  Node<T>? head;

  bool isEmpty() {
    return head == null;
  }

  void append(T data) {
    Node<T> newNode = Node.withValue(data);
    if (isEmpty()) {
      head = newNode;
    } else {
      Node<T>? temp = head;
      while (temp!.next != null) {
        temp = temp.next;
      }
      temp.next = newNode;
    }
  }

  void insertFront(T data) {
    Node<T> newNode = Node.withValue(data);
    newNode.next = head;
    head = newNode;
  }

  void deleteFront() {
    if (!isEmpty()) {
      head = head!.next;
    }
  }

  void deleteEnd() {
    if (isEmpty()) return;

    if (head!.next == null) {
      head = null;
      return;
    }

    Node<T>? temp = head;
    while (temp!.next!.next != null) {
      temp = temp.next;
    }
    temp.next = null;
  }

  void printList() {
    Node<T>? temp = head;
    print("Isi Linked List:");
    while (temp != null) {
      print(temp.nodeValue);
      temp = temp.next;
    }
  }
}
