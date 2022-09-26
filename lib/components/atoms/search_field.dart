import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SearchField extends StatelessWidget {
  final AppLocalizations t;
  final String placeholder;

  const SearchField({Key? key, required this.t, required this.placeholder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      cupertino: (_, __) => CupertinoSearchTextField(
        placeholder: placeholder,
        style: TextStyle(
            color: textColor(context),
            fontWeight: Constants.MEDIUM_FONT_WEIGHT,
            fontSize: Constants.S1_FONT_SIZE),
        onTap: () {},
        autocorrect: false,
      ),
      material: (_, __) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: inputBackgroundColor(context)),
        child: TextField(
          expands: false,
          minLines: null,
          maxLines: null,
          style: TextStyle(
              color: textColor(context),
              fontWeight: Constants.MEDIUM_FONT_WEIGHT,
              fontSize: Constants.S1_FONT_SIZE),
          decoration: InputDecoration(
            isDense: true,
            isCollapsed: true,
            prefixIcon: Icon(
              Icons.search,
              color: appbarBackIconColor(context),
              size: Constants.ICON_MEDIUM_SIZE,
            ),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 32,
            ),
            contentPadding: EdgeInsets.zero,
            hintStyle: TextStyle(
                color: placeholderColor(context),
                fontWeight: Constants.MEDIUM_FONT_WEIGHT,
                fontSize: Constants.S1_FONT_SIZE),
            hintText: placeholder,
            border: InputBorder.none,
          ),
          textInputAction: TextInputAction.search,
          onTap: () {},
          autocorrect: false,
        ),
      ),
    );
  }
}
