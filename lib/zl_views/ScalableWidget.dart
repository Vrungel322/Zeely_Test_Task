part of zl_views;

class ScalableWidget extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;
  final double scaleFactor;
  final Duration duration;

  const ScalableWidget({
    super.key,
    required this.onPressed,
    required this.child,
    this.scaleFactor = 0.9,
    this.duration = const Duration(milliseconds: 100),
  });

  @override
  State<ScalableWidget> createState() => _ScalableWidgetState();
}

class _ScalableWidgetState extends State<ScalableWidget> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onPressed();
      },
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? widget.scaleFactor : 1.0,
        duration: widget.duration,
        curve: Curves.easeOut,
        child: widget.child,
      ),
    );
  }
}