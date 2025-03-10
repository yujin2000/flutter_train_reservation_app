import 'package:flutter/material.dart';
import 'package:flutter_train_app/seat/widgets/depart_arrival_station.dart';
import 'package:flutter_train_app/seat/widgets/seat_bottom.dart';
import 'package:flutter_train_app/seat/widgets/seat_box.dart';
import 'package:flutter_train_app/seat/widgets/selected_lable.dart';

class SeatPage extends StatefulWidget {
  String depart;
  String arrive;
  SeatPage(this.depart, this.arrive);

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  Set<String> selectedSeats = <String>{};
  String? selectedRow;
  String? selectedCol;

  void onSelected(String row, String col) {
    setState(() {
      selectedRow = row;
      selectedCol = col;
      String rowCol = '$row-$col';
      if (selectedSeats.contains(rowCol)) {
        selectedSeats.remove(rowCol);
      } else {
        selectedSeats.add(rowCol);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('좌석 ===> ${selectedSeats.toString()}');
    // 테마 모드 확인
    bool isLightMode = Theme.of(context).brightness == Brightness.light;

    // light 모드일 때 seatBox 는 Colors.grey[300] 아니면 Colors.grey[700]
    Color? seatBoxColor = isLightMode ? Colors.grey[300] : Colors.grey[700];

    return Scaffold(
      appBar: AppBar(
        title: Text('좌석 선택'),
      ),
      body: Column(
        children: [
          DepartArrivalStation(widget.depart, widget.arrive),
          SizedBox(height: 20),
          SelectedLable(seatBoxColor),
          SizedBox(height: 20),
          SeatBox(selectedSeats, onSelected, seatBoxColor),
          SeatBottom(selectedSeats),
        ],
      ),
    );
  }
}
