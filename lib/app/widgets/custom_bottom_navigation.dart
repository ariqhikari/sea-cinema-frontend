part of 'widgets.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int index)? onTap;

  const CustomBottomNavigation({
    Key? key,
    this.selectedIndex = 0,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
            color: '1C1A1A'.toColor(),
            borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // * Home
            CustomTooltip(
              message: 'Home',
              child: GestureDetector(
                onTap: () {
                  if (onTap != null) onTap!(0);
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 18,
                  ),
                  child: Column(
                    children: [
                      // * Icon
                      SvgPicture.asset(
                        (selectedIndex == 0)
                            ? 'assets/ic_home.svg'
                            : 'assets/ic_home_normal.svg',
                        width: 20,
                        height: 20,
                      ),
                      // * Border
                      AnimatedContainer(
                        width: 35,
                        height: 4,
                        margin: const EdgeInsets.only(top: 11),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: ((selectedIndex == 0)
                              ? whiteColor
                              : Colors.transparent),
                        ),
                        duration: animationDuration,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // * Transaction
            CustomTooltip(
              message: 'Transaction',
              child: GestureDetector(
                onTap: () {
                  if (onTap != null) onTap!(1);
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 18,
                  ),
                  child: Column(
                    children: [
                      // * Icon
                      SvgPicture.asset(
                        (selectedIndex == 1)
                            ? 'assets/ic_transaction.svg'
                            : 'assets/ic_transaction_normal.svg',
                        width: 20,
                        height: 20,
                      ),
                      // * Border
                      AnimatedContainer(
                        width: 35,
                        height: 4,
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: ((selectedIndex == 1)
                              ? whiteColor
                              : Colors.transparent),
                        ),
                        duration: animationDuration,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // * Profile
            CustomTooltip(
              message: 'Profile',
              child: GestureDetector(
                onTap: () {
                  if (onTap != null) onTap!(2);
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 18,
                  ),
                  child: Column(
                    children: [
                      // * Icon
                      SvgPicture.asset(
                        (selectedIndex == 2)
                            ? 'assets/ic_profile.svg'
                            : 'assets/ic_profile_normal.svg',
                        width: 20,
                        height: 20,
                      ),
                      // * Border
                      AnimatedContainer(
                        width: 35,
                        height: 4,
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: ((selectedIndex == 2)
                              ? whiteColor
                              : Colors.transparent),
                        ),
                        duration: animationDuration,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavbarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width / 2 - 28, 0);
    path.quadraticBezierTo(size.width / 2 - 28, 33, size.width / 2, 33);
    path.quadraticBezierTo(size.width / 2 + 28, 33, size.width / 2 + 28, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
