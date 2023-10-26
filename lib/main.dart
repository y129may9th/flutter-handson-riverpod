import 'package:flutter/material.dart';
import 'package:flutter_handson_reverpod/model/tic_tac_toe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FlutterKaigi 2023 - TicTacToe'),
        ),
        body: const Board(),
      ),
    );
  }
}

class Board extends StatefulWidget {
  const Board({super.key});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  /// ゲーム進行状態の初期値
  TicTacToe ticTacToe = TicTacToe.start(playerX: 'Dash', playerO: 'Sparky');

  @override
  Widget build(BuildContext context) {
    /// コンテンツを列方向(縦並び)に配置する Column を Padding でラップ（ここから）
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //横方向のマス個数（３個）
            ),
            itemCount: 9, //縦横のマス個数（３×３）
            itemBuilder: (context, index) {
              return const SizedBox.expand(); //マス目に空欄を確保するだけのダミー
            },
          ),
        ],
      ),
    );
  }
}
