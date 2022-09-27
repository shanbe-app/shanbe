import 'package:client/utils/date.dart';
import 'package:flutter/material.dart';

class TodayIcon extends StatelessWidget {
  const TodayIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Icon(Icons.calendar_today_rounded),
        Text(
          dd('shamsi', DateTime.now()),
          style: const TextStyle(color: Colors.black),
        )
      ],
    );
  }
}
