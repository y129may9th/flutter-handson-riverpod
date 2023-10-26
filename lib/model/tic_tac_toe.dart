import 'package:flutter_handson_reverpod/model/players.dart';

class TicTacToe {
  final List<List<String>> board;
  final Players players;
  final String currentPlayers;

  TicTacToe({
    required this.board,
    required this.players,
    required this.currentPlayers,
  });

  /// factory コンストラクタ: インスタンスを生成するメソッド
  factory TicTacToe.start({
    playerX = 'X',
    playerO = 'O',
  }) {
    final players = Players(
      playerX: playerX,
      playerO: playerO,
    );

    return TicTacToe(
      board: [
        ['', '', ''],
        ['', '', ''],
        ['', '', ''],
      ],
      players: players,
      currentPlayers: players.playerX,
    );
  }

  /// マス目にマークをつける
  TicTacToe placeMark(int row, int col) {
    if (board[row][col].isEmpty) {
      /// 新しい盤面を作成
      final newBoard = List.of(board);
      newBoard[row][col] = currentPlayers == players.playerX ? 'X' : 'O';
      final nextPlayer =
          currentPlayers == players.playerX ? players.playerO : players.playerX;

      return TicTacToe(
        board: newBoard,
        players: players,
        currentPlayers: nextPlayer,
      );
    }

    /// インスタンスを返す
    return this;
  }

  String getWinner() {
    for (int i = 0; i < 3; i++) {
      // row = i における横の判定
      if (board[i][0] == board[i][1] &&
          board[i][1] == board[i][2] &&
          board[i][0].isNotEmpty) {
        return board[i][0] == 'X' ? players.playerX : players.playerO;
      }
      // col = i における縦の判定
      if (board[0][i] == board[1][i] &&
          board[1][i] == board[2][i] &&
          board[0][i].isNotEmpty) {
        return board[0][i] == 'X' ? players.playerX : players.playerO;
      }
    }
    // 左上から右下への斜めの判定
    if (board[0][0] == board[1][1] &&
        board[1][1] == board[2][2] &&
        board[0][0].isNotEmpty) {
      return board[0][0] == 'X' ? players.playerX : players.playerO;
    }
    // 右上から左下への斜めの判定
    if (board[0][2] == board[1][1] &&
        board[1][1] == board[2][0] &&
        board[0][2].isNotEmpty) {
      return board[0][2] == 'X' ? players.playerX : players.playerO;
    }
    return '';
  }

  bool isDraw() {
    return getWinner().isEmpty &&
        board.every((row) => row.every((cell) => cell.isNotEmpty));
  }

  TicTacToe resetBoard() {
    return TicTacToe.start(playerX: players.playerX, playerO: players.playerO);
  }
}
