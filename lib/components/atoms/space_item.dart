import 'package:client/models/Space.dart';
import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SpaceItem extends StatelessWidget {
  final Space space;

  const SpaceItem({Key? key, required this.space}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformTextButton(child: Row(
        children: [
          Text(space.name, style: TextStyle(fontSize: Constants.S1_FONT_SIZE,color: textColor(
              context)),)
        ]
    ),)
  }
}
