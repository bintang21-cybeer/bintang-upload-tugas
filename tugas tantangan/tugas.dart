import 'dart:collection';
import 'dart:io';

class Node<T> {
  T nodeValue;
  Node<T>? left, right;
  Node(this.nodeValue);
}

class BinaryTree<T> {
  Node<T>? root;
// Konstruktor
  BinaryTree();
// ==============================
// 1. Insert Level Order - Queue
// ==============================
  void insertLevelOrderQueue(T value) {
    Node<T> newNode = Node(value);
    if (root == null) {
      root = newNode;
      return;
    }
    Queue<Node<T>> queue = Queue();
    queue.add(root!);
    while (queue.isNotEmpty) {
      Node<T> current = queue.removeFirst();
      if (current.left == null) {
        current.left = newNode;
        return;
      } else {
        queue.add(current.left!);
      }
      if (current.right == null) {
        current.right = newNode;
        return;
      } else {
        queue.add(current.right!);
      }
    }
  }

// =================================
// 2. Insert Level Order - Rekursif
// =================================
  void insertLevelOrderRecursive(T value) {
    root = _insertRecursive(root, value);
  }

  Node<T> _insertRecursive(Node<T>? node, T value) {
    if (node == null) return Node(value);
    Queue<Node<T>> queue = Queue();
    queue.add(node);
    while (queue.isNotEmpty) {
      Node<T> current = queue.removeFirst();
      if (current.left == null) {
        current.left = Node(value);
        break;
      } else {
        queue.add(current.left!);
      }
      if (current.right == null) {
        current.right = Node(value);
        break;
      } else {
        queue.add(current.right!);
      }
    }
    return node;
  }

// =================================
// 3. Insert Berdasarkan Target
// =================================
  bool insertByTarget(T targetValue, T newValue) {
    if (root == null) return false;
    Queue<Node<T>> queue = Queue();
    queue.add(root!);
    while (queue.isNotEmpty) {
      Node<T> current = queue.removeFirst();
      if (current.nodeValue == targetValue) {
        if (current.left == null) {
          current.left = Node(newValue);
          return true;
        } else if (current.right == null) {
          current.right = Node(newValue);
          return true;
        } else {
          return false; // Penuh
        }
      }
      if (current.left != null) queue.add(current.left!);
      if (current.right != null) queue.add(current.right!);
    }
    return false;
  }

// =============================
// 4. Traversal Rekursif Opsional
// =============================
  void printInOrder(Node<T>? node) {
    if (node != null) {
      printInOrder(node.left);
      stdout.write("${node.nodeValue} ");
      printInOrder(node.right);
    }
  }

// ================================
// 5. Traversal Non-Rekursif (Stack)
// ================================
  void inOrderNonRecursive() {
    List<Node<T>> stack = [];
    Node<T>? current = root;
    while (current != null || stack.isNotEmpty) {
      while (current != null) {
        stack.add(current);
        current = current.left;
      }
      current = stack.removeLast();
      stdout.write("${current.nodeValue} ");
      current = current.right;
    }
    print('');
  }

  void preOrderNonRecursive() {
    if (root == null) return;
    List<Node<T>> stack = [root!];
    while (stack.isNotEmpty) {
      Node<T> current = stack.removeLast();
      stdout.write("${current.nodeValue} ");
      if (current.right != null) stack.add(current.right!);
      if (current.left != null) stack.add(current.left!);
    }
    print('');
  }

  void postOrderNonRecursive() {
    if (root == null) return;
    List<Node<T>> stack1 = [root!];
    List<Node<T>> stack2 = [];
    while (stack1.isNotEmpty) {
      Node<T> current = stack1.removeLast();
      stack2.add(current);
      if (current.left != null) stack1.add(current.left!);
      if (current.right != null) stack1.add(current.right!);
    }
    while (stack2.isNotEmpty) {
      stdout.write("${stack2.removeLast().nodeValue} ");
    }
    print('');
  }

// ======================
// 6. Level Order Traversal
// ======================
  void printLevelOrder() {
    if (root == null) return;
    Queue<Node<T>> queue = Queue();
    queue.add(root!);
    while (queue.isNotEmpty) {
      Node<T> current = queue.removeFirst();
      stdout.write("${current.nodeValue} ");
      if (current.left != null) queue.add(current.left!);
      if (current.right != null) queue.add(current.right!);
    }
    print('');
  }
}

void main() {
  final tree = BinaryTree<int>();
// Insert dengan queue (non-rekursif)
  tree.insertLevelOrderQueue(1);
  tree.insertLevelOrderQueue(2);
  tree.insertLevelOrderQueue(3);
  tree.insertLevelOrderQueue(4);
  tree.insertLevelOrderQueue(5);
// Insert dengan rekursif
  tree.insertLevelOrderRecursive(6);
  tree.insertLevelOrderRecursive(7);
// Insert berdasarkan target
  print("Insert node '8' di bawah node 2:");
  bool added = tree.insertByTarget(2, 8);
  print("Berhasil ditambahkan? $added\n");
// Traversals
  print("Level Order:");
  tree.printLevelOrder();
  print("InOrder (rekursif):");
  tree.printInOrder(tree.root);
  print("\n");
  print("InOrder Non-Rekursif:");
  tree.inOrderNonRecursive();
  print("PreOrder Non-Rekursif:");
  tree.preOrderNonRecursive();
  print("PostOrder Non-Rekursif:");
  tree.postOrderNonRecursive();
}
