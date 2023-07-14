part of 'widgets.dart';

class InputPassword extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String? Function(String?)? validator;
  final bool isEnabled;

  RxBool isObscure = true.obs;

  InputPassword({
    Key? key,
    required this.controller,
    required this.hint,
    this.validator,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => TextFormField(
          obscureText: isObscure.value,
          controller: controller,
          style: regularPoppinsFontStyle.copyWith(fontSize: 18),
          validator: validator,
          decoration: defaultInputStyle.copyWith(
            hintText: hint,
            enabled: isEnabled,
            fillColor: isEnabled ? null : whiteColor.withOpacity(.5),
            suffixIcon: IconButton(
              icon: SvgPicture.asset(isObscure.value
                  ? 'assets/ic_eye.svg'
                  : 'assets/ic_eye_hide.svg'),
              onPressed: () {
                isObscure.value = !isObscure.value;
              },
            ),
          ),
        ),
      ),
    );
  }
}
