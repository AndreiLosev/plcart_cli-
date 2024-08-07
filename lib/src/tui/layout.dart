import 'dart:io';

import 'package:plcart_cli/src/tui/data_column.dart';
import 'package:plcart_cli/src/tui/frame.dart';

class Layout {
  
  static void applay(DataColumn events, DataColumn tasks, Frame main, Frame conosle) {
    final width = stdout.terminalColumns;
    final hieght = stdout.terminalLines;

    final w = [events.innerDataWidth, tasks.innerDataWidth].reduce((e, a) => e > a ? e : a);
    final h1 = tasks.innerDataHeight;
    final h2 = events.innerDataHeight;
    final taskHieght = (h1 * hieght / (h1 + h2)).round(); - 2;
    final eventHieght = hieght - taskHieght - 3;

    tasks.top = 1;
    tasks.letf = width - w - 2;
    tasks.width = w;
    tasks.height = taskHieght;

    events.top = hieght - eventHieght - 1;
    events.letf = width - w - 2;
    events.width = w;
    events.height = eventHieght;

    main.top = 1;
    main.letf = 1;
    main.width = width - tasks.width - 5;
    main.height = hieght - 12;

    conosle.letf = 1;
    conosle.top = main.height + 2;
    conosle.width =  width - tasks.width - 5;
    conosle.height = 9;
  }
}
