import 'package:client/components/premium_crown.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpgradeButton extends StatelessWidget {
  final AppLocalizations t;

  UpgradeButton(this.t);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            height: 40,
            child: Stack(
              alignment: Alignment.topLeft,
              clipBehavior: Clip.none,
              children: [
                Positioned.fill(
                    child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/premium',
                    );
                  },
                  style: ElevatedButton.styleFrom(elevation: 4),
                  child: Text(
                    t.upgradeToPremium,
                    style: TextStyle(
                        fontWeight: Constants.BOLD_FONT_WEIGHT,
                        fontSize: Constants.S2_FONT_SIZE),
                  ),
                )),
                PremiumCrown(
                  alignment: Alignment.topLeft,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
