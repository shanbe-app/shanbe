import 'package:client/rx/service_provider.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class EmojiSegmentList extends StatelessWidget {
  final Function onPickEmoji;
  final String title;
  final List<String> emojis;

  const EmojiSegmentList(
      {Key? key,
      required this.title,
      required this.emojis,
      required this.onPickEmoji})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Icon(
              Icons.arrow_forward_ios,
              color: Constants.PRIMARY_COLOR,
              size: Constants.ICON_MEDIUM_SIZE,
            ),
            const SizedBox(
              width: 2,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: Constants.CAPTION_FONT_SIZE,
                  fontWeight: Constants.MEDIUM_FONT_WEIGHT,
                  color: Constants.PRIMARY_COLOR),
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemBuilder: (context, index) => PlatformIconButton(
            onPressed: () {
              onPickEmoji(emojis[index]);
            },
            padding: const EdgeInsets.all(0),
            icon: Text(
              ServiceProvider.getInstance()
                  .emojiManager
                  .parser
                  .emojify(emojis[index]),
              style: const TextStyle(fontSize: Constants.H5_FONT_SIZE),
              textAlign: TextAlign.center,
            ),
          ),
          itemCount: emojis.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              crossAxisCount: 4,
              mainAxisExtent: 40,
              crossAxisSpacing: 40),
        )
      ],
    );
  }
}
