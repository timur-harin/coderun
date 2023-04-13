import 'dart:io';
import 'dart:math';

void main() {
  var n = int.parse(stdin.readLineSync() ?? '');
  var saver = stdin.readLineSync()!.split(' ');
  List<int> list = List.generate(n, (_) => int.parse(saver[_]));
  list.sort();
  List<int> d = List.filled(n, 0);
  d[1] = list[1] - list[0];
  if (n > 2) {
    d[2] = list[2] - list[0];
    for (int i = 3; i < n; i++) {
      d[i] = min(d[i - 1], d[i - 2]) + list[i] - list[i - 1];
    }
  }
  print(d[n - 1]);
}
