class DNode<T> {
  T? nodeValue;
  DNode<T>? prev;
  DNode<T>? next;

  // default constructor
  DNode.empty() {
    nodeValue = null;
    next = this;
    prev = this;
  }

  // constructor with initial value
  DNode(T item) {
    nodeValue = item;
    next = this;
    prev = this;
  }
}
