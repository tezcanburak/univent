part of 'calendar_widget.dart';

/// Unit of calendar.
class DateBox extends StatelessWidget {
  const DateBox({
    super.key,
    required this.child,
    this.color,
    this.width = 24.0,
    this.height = 24.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.onPressed,
    this.showDot = false,
    this.isSelected = false,
    this.isToday = false,
    this.hasEvent = false,
  });

  /// Child widget.
  final Widget child;

  /// Background color.
  final Color? color;

  /// Widget width.
  final double width;

  /// Widget height.
  final double height;

  /// Container border radius.
  final BorderRadius borderRadius;

  /// Pressed callback function.
  final VoidCallback? onPressed;

  /// Show DateBox event in container.
  final bool showDot;

  /// DateBox is today.
  final bool isToday;

  /// DateBox selection.
  final bool isSelected;

  /// Show event in DateBox.
  final bool hasEvent;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      alignment: Alignment.center,
      child: InkResponse(
        onTap: onPressed,
        radius: 16.0,
        borderRadius: borderRadius,
        highlightShape: BoxShape.rectangle,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected
                ? ColorConstants.red
                : isToday
                ? Colors.lightBlueAccent
                : null,
            borderRadius: borderRadius,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              child,
              if (showDot && hasEvent)
                Container(
                  margin: const EdgeInsets.all(2.0),
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected
                        ? ColorConstants.lightGrey
                        : ColorConstants.grey,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
