part of zl_views;

class ZlButtonOutline extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const ZlButtonOutline({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: onPressed,
      child: Container(
        height: 62.h,
        padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 35.w),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFF2F4F6)),
          borderRadius: BorderRadius.all(Radius.circular(100.r)),
        ),
        child: Text(title, style: ZlTextStyles.semibold_16_1_35()),
      ),
    );
  }
}
