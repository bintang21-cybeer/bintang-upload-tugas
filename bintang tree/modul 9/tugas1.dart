class TNode<T> {
  T nodeValue;
  TNode? left, right;

  TNode(this.nodeValue)
      : left = null,
        right = null;
}

class BinaryTree<T> {
  TNode? root;

  BinaryTree() {
    root = null;
  }

// cetak dengan visual tree
  void printVisual(TNode? node, [String prefix = "", bool isLeft = true]) {
    node ??= root;
    if (node == null) {
      return;
    }
    if (node.right != null) {
      printVisual(node.right, "$prefix${isLeft ? "|   " : "    "}", false);
    }
    print("$prefix${isLeft ? "└── " : "┌── "}${node.nodeValue}");
    if (node.left != null) {
      printVisual(node.left, "$prefix${isLeft ? "   " : "|   "}", true);
    }
  }

  void visualFromRoot() {
    printVisual(root);
  }
}

void main() {
  BinaryTree t = BinaryTree();
  t.root = TNode('A'); // Inisialisasi root terlebih dahulu

  t.root!.left = TNode('B');
  t.root!.right = TNode('C');
  t.root!.left!.left = TNode('D');
  t.root!.left!.right = TNode('E');
  t.root!.right!.right = TNode('F');
  t.root!.left!.right!.left = TNode('G');
  t.root!.right!.right!.left = TNode('H');
  t.root!.right!.right!.right = TNode('J');

  print('Cetak dengan visual Tree');
  t.visualFromRoot();
}
