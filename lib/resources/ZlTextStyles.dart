part of resources;

class ZlTextStyles {
  ZlTextStyles._();

  static const _italian_Plate_No2_Expanded = 'Italian Plate No2 Expanded';

  ///=====-Regular======

  static TextStyle regular_10_1({Color color = const Color(0xFF000000)}) {
    return const TextStyle(
      fontFamily: _italian_Plate_No2_Expanded,
    ).updateTextSize(10.sp).updateLineHeight(1).copyWith(color: color, fontWeight: FontWeight.w400);
  }

  static TextStyle regular_14_1_4({Color color = const Color(0xFF000000)}) {
    return const TextStyle(
      fontFamily: _italian_Plate_No2_Expanded,
    ).updateTextSize(14.sp).updateLineHeight(1.4).copyWith(color: color, fontWeight: FontWeight.w400);
  }

  ///=====-Semibold======

  static TextStyle semibold_12_1_0({Color color = const Color(0xFF000000)}) {
    return const TextStyle(
      fontFamily: _italian_Plate_No2_Expanded,
    ).updateTextSize(12.sp).updateLineHeight(1.0).copyWith(color: color, fontWeight: FontWeight.w600);
  }

  static TextStyle semibold_14_1_2({Color color = const Color(0xFF000000)}) {
    return const TextStyle(
      fontFamily: _italian_Plate_No2_Expanded,
    ).updateTextSize(14.sp).updateLineHeight(1.2).copyWith(color: color, fontWeight: FontWeight.w600);
  }

  static TextStyle semibold_14_1_1({Color color = const Color(0xFF000000)}) {
    return const TextStyle(
      fontFamily: _italian_Plate_No2_Expanded,
    ).updateTextSize(14.sp).updateLineHeight(1.1).copyWith(color: color, fontWeight: FontWeight.w600);
  }

  static TextStyle semibold_16_1_0({Color color = const Color(0xFF000000)}) {
    return const TextStyle(
      fontFamily: _italian_Plate_No2_Expanded,
    ).updateTextSize(16.sp).updateLineHeight(1.0).copyWith(color: color, fontWeight: FontWeight.w600);
  }

  static TextStyle semibold_16_1_35({Color color = const Color(0xFF000000)}) {
    return const TextStyle(
      fontFamily: _italian_Plate_No2_Expanded,
    ).updateTextSize(16.sp).updateLineHeight(1.35).copyWith(color: color, fontWeight: FontWeight.w600);
  }

  ///=====-Bold======

  static TextStyle bold_12_1_4({Color color = const Color(0xFF000000)}) {
    return const TextStyle(
      fontFamily: _italian_Plate_No2_Expanded,
    ).updateTextSize(12.sp).updateLineHeight(1.4).copyWith(color: color, fontWeight: FontWeight.w700);
  }

  static TextStyle bold_22_1_2({Color color = const Color(0xFF000000)}) {
    return const TextStyle(
      fontFamily: _italian_Plate_No2_Expanded,
    ).updateTextSize(22.sp).updateLineHeight(1.2).copyWith(color: color, fontWeight: FontWeight.w700);
  }

  static TextStyle bold_26_1_2({Color color = const Color(0xFF000000)}) {
    return const TextStyle(
      fontFamily: _italian_Plate_No2_Expanded,
    ).updateTextSize(26.sp).updateLineHeight(1.2).copyWith(color: color, fontWeight: FontWeight.w700);
  }
}

extension _TextStyleExt on TextStyle {
  TextStyle updateTextSize(double textSize) {
    final newTextStyle = copyWith(fontSize: textSize);
    return newTextStyle;
  }

  TextStyle updateLineHeight(double lineHeightCoefficient) {
    return copyWith(height: fontSize == null ? null : lineHeightCoefficient);
  }
}
