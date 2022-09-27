import 'package:client/components/atoms/premium_crown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jdenticon_dart/jdenticon_dart.dart';

class ProfileAvatar extends StatelessWidget {
  final String email;
  final String? picture;
  final bool isPremium;
  final double crownSize;

  const ProfileAvatar(
      {Key? key,
      required this.email,
      required this.isPremium,
      required this.picture,
      this.crownSize = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: 64,
      height: 64,
      padding: const EdgeInsets.all(4),
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topLeft,
        children: [
          Positioned.fill(
              child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: picture != null
                ? Image.network(
                    picture!,
                    fit: BoxFit.contain,
                    width: 64,
                    height: 64,
                  )
                : SvgPicture.string(
                    Jdenticon.toSvg(email, size: 64),
                    fit: BoxFit.fill,
                    width: 64,
                    height: 64,
                    allowDrawingOutsideViewBox: true,
                  ),
          )),
          Visibility(
            visible: isPremium,
            child: PremiumCrown(
              alignment: Alignment.topRight,
              crownSize: crownSize,
            ),
          )
        ],
      ),
    );
  }
}
