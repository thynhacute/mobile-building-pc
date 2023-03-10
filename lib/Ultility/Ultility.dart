import 'dart:convert';

String addDotToPrice(int num){
  String result = "";
  String numText = num.toString();
  int dotAt = numText.length % 3 == 0 ? 3 : numText.length % 3;
  for(int i = 0; i < numText.length; i++){
    if(dotAt == i && i != numText.length - 1){
      result += ".";
      dotAt += 3;
    }
    result += numText[i];
  }
  return result;
}

String decodeUtf8(String text){
  return utf8.decode(text.runes.toList());
}