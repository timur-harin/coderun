import 'dart:io';
import 'dart:math';

void main() {
  var firstLine = (stdin.readLineSync() ?? '').split(' ');
  var n = int.parse(firstLine[0]);
  var m = int.parse(firstLine[1]);
  List<List<int>> map = [];
  for (var i = 0; i<n; i++){
    map.add((stdin.readLineSync() ?? '').split(' ').map((e) => int.parse(e)).toList());
  }
  List<List<int>> finalMap = List.generate(n, (_) => List.filled(m, 0));

  finalMap[0][0]=map[0][0];

  for (int i = 1 ; i<n ; i++){
    finalMap[i][0]=finalMap[i-1][0]+map[i][0];
  }

  for (int i = 1; i<m; i++){
    finalMap[0][i]=finalMap[0][i-1]+map[0][i];
  }

  for (int x = 1; x<n; x++){
    for (int y =1; y<m; y++){
      finalMap[x][y]=min(finalMap[x-1][y],finalMap[x][y-1])+map[x][y];
    }
  }

  print(finalMap[n-1][m-1]); 
}