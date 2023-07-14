part of 'widgets.dart';

class Button extends StatelessWidget {
  final String text;
  final ButtonStyle? buttonStyle;
  final Function onTap;
  final bool isDisabled;
  final double? width;

  const Button({
    Key? key,
    required this.text,
    required this.onTap,
    this.buttonStyle,
    this.width,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        child: Text(
          text,
          style: semiBoldPoppinsFontStyle.copyWith(
            color: blackColor,
            fontSize: 20,
          ),
        ),
        style: buttonStyle ?? defaultButtonStyle,
        onPressed: (!isDisabled)
            ? () {
                onTap();
              }
            : null,
      ),
    );
  }
}
