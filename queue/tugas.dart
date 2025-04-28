class Queue {
  int front = 0, rear = 0, size = 0;
  int kapasitas;
  late List<int> array;

  Queue(this.kapasitas) {
    front = size = 0;
    rear = kapasitas - 1;
    array = List<int>.filled(kapasitas, 0);
  }

  bool isFull() {
    return (size == kapasitas);
  }

  bool isEmpty() {
    return (size == 0);
  }

  void enqueue(int item) {
    if (isFull()) {
      print('Queue sudah penuh. tidak dapat mengisi antrian $item');
      return;
    }
    rear = (rear + 1) % kapasitas;
    array[rear] = item;
    size++;
    print('$item enqueue to queue');
  }

  int dequeue() {
    if (isEmpty()) {
      print('Queue is kosong. Tidak dapat menghapus elemen dari queue');
      return -1;
    }
    int item = array[front];
    front = (front + 1) % kapasitas;
    size--;
    return item;
  }

  int frontElement() {
    if (isEmpty()) {
      print('Queue is kosong. tidak ada elemen depan.');
      return -1;
    }
    return array[front];
  }

  int rearElement() {
    if (isEmpty()) {
      print('Queue is kosong. Tidak ada elemen belakang.');
      return -1;
    }
    return array[rear];
  }
}

void main() {
  Queue q = Queue(5); // untuk kapasitas queue 5
  q.enqueue(10);
  q.enqueue(20);
  q.enqueue(30);
  q.enqueue(40);
  q.enqueue(50);

  print('\n');
  print('Elemen terdepan  ${q.frontElement()}');
  print('Elemen paling belakang ${q.rearElement()}');

  print('${q.dequeue()} dikeluarkan dari queue\n');

  q.enqueue(60); // test enqueue setelah dequeue
  print('Front item after enqueue is ${q.frontElement()}');
  print('Rear item after enqueue is ${q.rearElement()}');
}
