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
// Studi Kasus 3
  t.root = TNode('+');
  t.root!.left = TNode('*');
  t.root!.right = TNode('/');
  t.root!.left!.left = TNode('a');
  t.root!.left!.right = TNode('b');
  t.root!.right!.left = TNode('-');
  t.root!.right!.right = TNode('e');
  t.root!.right!.left!.left = TNode('c');
  t.root!.right!.left!.right = TNode('d');

  print('Cetak dengan visual Tree');
  t.visualFromRoot();
}
