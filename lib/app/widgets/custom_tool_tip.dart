part of 'widgets.dart';

class CustomTooltip extends StatelessWidget {
  final Widget child;
  final String message;
  final bool preferBelow;

  const CustomTooltip({
    Key? key,
    required this.message,
    required this.child,
    this.preferBelow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      key: key,
      message: message,
      preferBelow: preferBelow,
      verticalOffset: 40,
      textStyle: regularPoppinsFontStyle.copyWith(color: blackColor),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
