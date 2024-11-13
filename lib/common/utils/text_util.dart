class TextUtil {
  /// isEmpty
  static bool isEmpty(String? text) {
    return text == null || text.isEmpty;
  }

  /// 每隔 x位 加 pattern
  static String formatDigitPattern(String text,
      {int digit = 4, String pattern = ' '}) {
    text = text.replaceAllMapped(RegExp('(.{$digit})'), (Match match) {
      return '${match.group(0)}$pattern';
    });
    if (text.endsWith(pattern)) {
      text = text.substring(0, text.length - 1);
    }
    return text;
  }

  /// 每隔 x位 加 pattern, 从末尾开始
  static String formatDigitPatternEnd(String text,
      {int digit = 4, String pattern = ' '}) {
    String temp = reverse(text);
    temp = formatDigitPattern(temp, digit: digit, pattern: pattern);
    temp = reverse(temp);
    return temp;
  }

  /// 每隔4位加空格
  static String formatSpace4(String text) {
    return formatDigitPattern(text);
  }

  /// 每隔3三位加逗号
  /// num 数字或数字字符串。int型。
  static String formatComma3(Object num) {
    return formatDigitPatternEnd(num.toString(), digit: 3, pattern: ',');
  }

  /// 每隔3三位加逗号
  /// num 数字或数字字符串。double型。
  static String formatDoubleComma3(Object num,
      {int digit = 3, String pattern = ','}) {


    if(num.toString().contains('.')){
      List<String> list = num.toString().split('.');
      String left =
      formatDigitPatternEnd(list[0], digit: digit, pattern: pattern);
      String right = list[1];
      return '$left.$right';
    }else{
      return formatComma3(num);
    }


  }

  /// hideNumber
  static String hideNumber(String phoneNo,
      {int start = 3, int end = 7, String replacement = '****'}) {
    return phoneNo.replaceRange(start, end, replacement);
  }

  /// replace
  static String replace(String text, Pattern from, String replace) {
    return text.replaceAll(from, replace);
  }

  /// split
  static List<String> split(String text, Pattern pattern) {
    return text.split(pattern);
  }

  /// reverse
  static String reverse(String text) {
    if (isEmpty(text)) return '';
    StringBuffer sb = StringBuffer();
    for (int i = text.length - 1; i >= 0; i--) {
      sb.writeCharCode(text.codeUnitAt(i));
    }
    return sb.toString();
  }


  ///身份证号脱敏
  static String maskIDCard(String? idCard) {
    if (idCard == null || idCard.isEmpty) {
      return '';
    }

    // 如果身份证号长度不足 10 位，直接返回原字符串（因为无法脱敏）
    if (idCard.length <= 10) {
      return idCard;
    }

    // 保留前6位和后4位，中间固定显示6位 '*'
    String maskedID = idCard.replaceRange(6, idCard.length - 4, '******');

    return maskedID.trim();
  }
  ///手机号脱敏
  static String maskPhoneNumber(String? phoneNumber) {
    // 如果输入为空或不是有效的手机号长度，直接返回原始值
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return '';
    }

    // 去除所有非数字字符
    final cleanedPhoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // 检查是否为标准的 11 位手机号（如中国大陆手机号）
    if (cleanedPhoneNumber.length != 11) {
      return phoneNumber; // 返回原始值
    }

    // 显示前 3 位和后 4 位，中间替换为 '*'
    String start = cleanedPhoneNumber.substring(0, 3);
    String end = cleanedPhoneNumber.substring(cleanedPhoneNumber.length - 4);
    return '$start****$end';
  }
}