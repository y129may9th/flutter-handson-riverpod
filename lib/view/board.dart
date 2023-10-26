import 'package:flutter/material.dart';

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BoardState();
  }
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    // 画面いっぱいに描画領域だけを確保しています。
    return const SizedBox.expand();
  }
}
