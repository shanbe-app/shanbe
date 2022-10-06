import 'package:client/rx/services/rx_service.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class EmojiManager {
  EmojiParser parser;

  EmojiManager() : parser = EmojiParser(init: true);
}
