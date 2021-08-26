import 'package:flutter/material.dart';


class Command {
  static final all = [username, password, submit];

  static const username = "username";
  static const password = "password";
  static const submit = "submit";
}

class Utils {
  static scanText(String rawText){
    final text = rawText.toLowerCase();

    // if command words in raw text, then get the text after the command words
    if(text.contains(Command.username)){
      final body = _getTextAfterCommand(text: text, command: Command.username);

    }
  }

  static List _getTextAfterCommand({
  @required String text,
  @required String command,
}){
    final indexCommand = text.indexOf(command);
    final indexAfter = indexCommand + command.length;
    if(indexCommand == -1){
      return null;
    } else {
      return [command, text.substring(indexAfter).trim()];
    }
  }
}
