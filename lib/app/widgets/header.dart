part of 'widgets.dart';

class Header extends StatelessWidget {
  final String title;
  final bool isTitle;
  final bool isShadow;
  final bool isBack;
  final Function? backHandle;

  const Header(
    this.title, {
    Key? key,
    this.isTitle = true,
    this.isShadow = false,
    this.isBack = false,
    this.backHandle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 22),
      height: 56,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              child: Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset("assets/ic_arrow_back.svg"),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isShadow ? whiteColor.withOpacity(.4) : null),
              ),
              onTap: () {
                Get.back();
              },
            ),
          ),
          isTitle
              ? Align(
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: mediumPoppinsFontStyle.copyWith(fontSize: 18),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
