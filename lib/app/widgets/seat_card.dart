part of 'widgets.dart';

enum StatusSeat { AVAILABLE, RESERVED, SELECTED }

class SeatCard extends StatelessWidget {
  final StatusSeat status;
  final double width;
  final double height;
  final String seat;
  final Function onTap;

  const SeatCard(
    this.seat, {
    Key? key,
    this.status = StatusSeat.AVAILABLE,
    this.width = 35,
    this.height = 35,
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
            seat,
            style: mediumPoppinsFontStyle.copyWith(
                color: (status == StatusSeat.RESERVED)
                    ? '878787'.toColor()
                    : (status == StatusSeat.SELECTED)
                        ? whiteColor
                        : orangeColor),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: (status == StatusSeat.RESERVED)
              ? whiteColor
              : (status == StatusSeat.SELECTED)
                  ? orangeColor
                  : '323232'.toColor(),
        ),
        duration: animationDuration,
      ),
    );
  }
}
