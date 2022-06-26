import 'dart:math';

import 'package:client/shanbe_icons.dart';
import 'package:flutter/material.dart';

class PremiumCrown extends StatelessWidget {
  final AlignmentGeometry alignment;
  final double crownSize;
  final double? rotate;

  const PremiumCrown(
      {required this.alignment, this.crownSize = 40, this.rotate});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: alignment == Alignment.topLeft ? -16 : null,
        right: alignment == Alignment.topRight ? -16 : null,
        top: -16,
        child: Transform.rotate(
          angle: rotate ?? (alignment == Alignment.topLeft ? -.25 : .25) * pi,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: crownSize / 2.5,
                height: crownSize / 2.5,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
              ),
              Icon(
                Shanbe.sliders,
                color: Colors.yellow.shade700,
                size: crownSize,
              )
            ],
          ),
        ));
  }
}
