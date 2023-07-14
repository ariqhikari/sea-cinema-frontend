part of 'widgets.dart';

class TimeCard extends StatelessWidget {
  final bool isSelected;
  final double width;
  final double height;
  final TimeOfDay time;
  final Function onTap;

  const TimeCard(
    this.time, {
    Key? key,
    this.isSelected = false,
    this.width = 70,
    this.height = 50,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: AnimatedContainer(
        width: width,
        height: height,
        child: Center(
          child: Text(
            time.formatString(),
            style: mediumPoppinsFontStyle.copyWith(
                color: (isSelected) ? orangeColor : whiteColor),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color:
              (isSelected) ? orangeColor.withOpacity(.12) : '404040'.toColor(),
          border: Border.all(
            width: 1,
            color: (isSelected) ? orangeColor : whiteColor,
          ),
        ),
        duration: animationDuration,
      ),
    );
  }
}
