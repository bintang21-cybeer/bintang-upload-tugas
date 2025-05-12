import 'class-SLL.dart';

void main() {
  var list = SingleLinkedList<int>();

  list.append(10);
  list.append(20);
  list.insertFront(5);
  list.printList();

  print("Hapus dari depan:");
  list.deleteFront();
  list.printList();

  print("Hapus dari belakang:");
  list.deleteEnd();
  list.printList();
}
