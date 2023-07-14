part of 'widgets.dart';

class DateCard extends StatelessWidget {
  final bool isSelected;
  final double width;
  final double height;
  final DateTime date;
  final Function onTap;

  const DateCard(
    this.date, {
    Key? key,
    this.isSelected = false,
    this.width = 40,
    this.height = 70,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                date.shortDayName,
                style: mediumPoppinsFontStyle,
              ),
              const SizedBox(height: 12),
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (isSelected) ? whiteColor : Colors.transparent,
                ),
                child: Center(
                  child: Text(
                    date.day.toString(),
                    style: semiBoldPoppinsFontStyle.copyWith(
                      color: (isSelected) ? blackColor : whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: (isSelected) ? orangeColor : '5A5757'.toColor(),
        ),
        duration: animationDuration,
      ),
    );
  }
}
