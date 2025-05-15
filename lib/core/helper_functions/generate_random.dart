import 'dart:math' as math;

String generateRandomString({required int sizeOfCode}) {
  String code = "";
  math.Random rand = math.Random();

  for (int j = 0; j < sizeOfCode; j++) {
    int curRandChar = rand.nextInt(26) + 'a'.codeUnitAt(0);
    String c = String.fromCharCode(curRandChar);
    code += c;
  }

  return code;
}
