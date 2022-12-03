import 'package:client/components/atoms/premium_crown.dart';
import 'package:client/utils/constants.dart';
import 'package:client/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserAvatar extends StatelessWidget {
  final String? avatar;
  final bool? isPremium;
  final double size;
  final double radius;
  final String? name;
  final List<Color>? gradientColors;

  UserAvatar(
      {Key? key,
      required this.avatar,
      this.isPremium,
      this.size = Constants.ICON_X_LARGE_SIZE,
      this.radius = 45,
      this.name})
      : gradientColors = name == null
            ? null
            : Constants
                .AVATAR_GRADIENT_COLORS[_getTextNumberBetweenOneToEight(name)],
        super(key: key);

  static int _getTextNumberBetweenOneToEight(String text) {
    num output = 0;
    for (var i = 0; i < text.length; i++) {
      output += text[i].codeUnitAt(0);
    }
    return ((output % 8)).floor();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size,
        height: size,
        child: CircleAvatar(
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              strNotEmpty(avatar)
                  ? ClipRRect(
                      child: Image.network(
                        avatar!,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: double.maxFinite,
                                height: double.maxFinite,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(radius),
                                  gradient: const LinearGradient(
                                      colors: [
                                        Color.fromRGBO(234, 233, 231, 1),
                                        Color.fromRGBO(212, 212, 211, 1),
                                      ],
                                      begin: FractionalOffset(0.0, 0.0),
                                      end: FractionalOffset(0.0, 1.0),
                                      stops: [0.0, .8],
                                      tileMode: TileMode.clamp),
                                ),
                              ),
                              SvgPicture.asset(
                                'assets/images/warning.svg',
                                width: 24,
                                height: 24,
                                color: const Color.fromRGBO(133, 124, 106, 1),
                              )
                            ],
                          );
                        },
                      ),
                      borderRadius: BorderRadius.circular(radius),
                    )
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(radius),
                            gradient: LinearGradient(
                                colors: name != null
                                    ? [
                                        gradientColors![0],
                                        gradientColors![1],
                                      ]
                                    : [
                                        const Color.fromRGBO(234, 233, 231, 1),
                                        const Color.fromRGBO(212, 212, 211, 1),
                                      ],
                                begin: const FractionalOffset(0.0, 0.0),
                                end: const FractionalOffset(0.0, 1.0),
                                stops: const [0.0, .8],
                                tileMode: TileMode.clamp),
                          ),
                        ),
                        name != null
                            ? Text(
                                name!.characters.first.toUpperCase(),
                                style: TextStyle(
                                    color: gradientColors![2],
                                    fontSize: Constants.S2_FONT_SIZE),
                              )
                            : SvgPicture.asset(
                                'assets/images/nouser.svg',
                                width: 14,
                                color: const Color.fromRGBO(133, 124, 106, 1),
                              )
                      ],
                    ),
              if (isPremium != null && isPremium!)
                const Positioned(
                  child: PremiumCrown(
                    alignment: Alignment.topRight,
                    crownSize: 32,
                  ),
                  right: -2,
                  top: -2,
                )
            ],
          ),
        ));
  }
}
