import 'package:flutter/material.dart';

class EmojiSegments extends StatefulWidget {
  final Function(String) onPickEmoji;

  const EmojiSegments({Key? key, required this.onPickEmoji}) : super(key: key);

  @override
  State<EmojiSegments> createState() => _EmojiSegmentsState();
}

class _EmojiSegmentsState extends State<EmojiSegments> {
  int emojiSegmentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
