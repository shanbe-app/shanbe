import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class MagicalFloatingActionButton extends StatelessWidget {
  final VoidCallback onPress;

  const MagicalFloatingActionButton({Key? key, required this.onPress})
      : super(key: key);

  Widget renderFloatingActionButton() {
    return PlatformWidget(
      material: (context, _) => FloatingActionButton(
        onPressed: onPress,
        backgroundColor: Constants.PRIMARY_COLOR,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      cupertino: (context, _) => PlatformIconButton(
        onPressed: onPress,
        padding: const EdgeInsets.all(0),
        icon: Container(
          width: 56,
          height: 56,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: Constants.PRIMARY_COLOR,
              boxShadow: [
                BoxShadow(
                  color: isDark(context) ? Colors.grey.shade900 : Colors.grey,
                  offset: const Offset(0.0, 1),
                  spreadRadius: 2,
                  blurRadius: 4.0,
                ),
              ]),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            // size: Constants.ICON_LARGE_SIZE,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Draggable(
        data: 0,
        child: renderFloatingActionButton(),
        feedback: renderFloatingActionButton(),
        childWhenDragging: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: dividerColor(context)),
        ));
  }
}
