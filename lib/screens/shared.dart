import 'package:flutter/rendering.dart';

void main() {
  var xz = ["5","sa"];
    List<num> e = xz.map((i)=> num.parse(i)).toList();
    debugPrint(e.toString());
}
