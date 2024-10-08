import 'package:plcart_cli/src/tui/itidget.dart';
import 'package:plcart_cli/src/tui/shadow_console.dart';
import 'package:termlib/termlib.dart';

class Frame implements ITidget {
  static const _board = ['─', '│', '┌', '┐', '└', '┘'];
  static final _boardColor =
      _board.map((i) => Style(i)..fg(Color.brightGreen)).toList();

  int width;
  int height;
  int left;
  int top;

  @override
  bool focuse = false;

  Frame(this.width, this.height, this.left, this.top);

  int contentLeft([int add = 0]) => left + 2 + add;
  int contentWidth([int add = 0]) => width - 3 + add;
  int contentTop([int add = 0]) => top + 1 + add;
  int contentHeight([int add = 0]) => height - 2 + add;

  @override
  void render(ShadowConsole lib) {
    List<Object> board = _getBoard(lib);

    for (var i = 0; i < width; i++) {
      lib.writeAt(top, left + 1 + i, board[0]);
      lib.writeAt(top + height, left + 1 + i, board[0]);
    }

    for (var i = 0; i < height - 1; i++) {
      lib.writeAt(top + 1 + i, left, board[1]);
      lib.writeAt(top + 1 + i, left + width, board[1]);
    }

    lib.writeAt(top, left, board[2]);
    lib.writeAt(top, left + width, board[3]);
    lib.writeAt(top + height, left + width, board[5]);
    lib.writeAt(top + height, left, board[4]);
  }

  List<Object> _getBoard(ShadowConsole lib) => switch (focuse) {
        true => _boardColor,
        false => _board,
      };
}
