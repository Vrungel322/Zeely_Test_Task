part of zl_views;

class ZlButtonBlack extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const ZlButtonBlack({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return ScalableWidget(
      onPressed: onPressed,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 62.h,
              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(100.r))),
              child: Center(child: Text(title, style: ZlTextStyles.semibold_16_1_0(color: Colors.white))),
            ),
          ),
        ],
      ),
    );
  }
}
