import 'package:client/utils/date.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodayIcon extends StatelessWidget {
  const TodayIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Icon(Icons.calendar_today_rounded),
        Center(child: Text(dd(DateTime.now())),)
      ],
    )
  }
}
