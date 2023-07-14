part of 'shared.dart';

// Margin
const double defaultMargin = 16;

// Padding
const double defaultPadding = 16;

// Duration
const Duration animationDuration = Duration(milliseconds: 250);

// Colors
Color orangeColor = 'EBA352'.toColor();
Color yellowColor = 'EBA352'.toColor();
Color redColor = 'FA5A7D'.toColor();
Color greenColor = '2EB086'.toColor();

Color blackColor = '181818'.toColor();

Color grayColor = 'CDCDCD'.toColor();
Color darkGrayColor = '272727'.toColor();

Color whiteColor = 'FFFFFF'.toColor();
Color whiteColor80 = whiteColor.withOpacity(.8);

// Poppins Fonts
TextStyle regularPoppinsFontStyle = GoogleFonts.poppins(
  color: grayColor,
  fontSize: 14,
);

TextStyle mediumPoppinsFontStyle = GoogleFonts.poppins(
  color: whiteColor,
  fontSize: 14,
  fontWeight: FontWeight.w500,
);

TextStyle semiBoldPoppinsFontStyle = GoogleFonts.poppins(
  color: whiteColor,
  fontSize: 14,
  fontWeight: FontWeight.w600,
);

// Heading
TextStyle headingPrimaryFontStyle =
    semiBoldPoppinsFontStyle.copyWith(fontSize: 26);

TextStyle headingSecondaryFontStyle =
    semiBoldPoppinsFontStyle.copyWith(fontSize: 20);

// Inputs
InputDecoration defaultInputStyle = makeInput(8);

InputDecoration makeInput(double borderRadius) {
  return InputDecoration(
    filled: true,
    fillColor: '838383'.toColor().withOpacity(.26),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 11,
    ),
    hintStyle:
        regularPoppinsFontStyle.copyWith(color: whiteColor80, fontSize: 18),
    errorStyle: regularPoppinsFontStyle.copyWith(color: redColor, fontSize: 14),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.transparent,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.transparent,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        width: 1,
        color: whiteColor,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        width: 1,
        color: redColor,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        width: 1,
        color: redColor,
      ),
    ),
  );
}

// Buttons
ButtonStyle defaultButtonStyle = makeButton(orangeColor);

// Functions
ButtonStyle makeButton(
  Color primary, {
  double borderRadius = 8,
  Color textColor = Colors.white,
}) {
  return ElevatedButton.styleFrom(
    primary: primary,
    onPrimary: textColor,
    onSurface: primary,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius)),
    elevation: 0,
    shadowColor: Colors.transparent,
  );
}

// Loading Indicator
Widget makeLoadingIndicator({Color color = const Color(0XFFF4AE00)}) {
  return SpinKitRing(
    size: 40,
    color: color,
  );
}

// Snackbar
void showSnackBar(String message, {String status = "Warning"}) {
  Get.snackbar(
    status,
    message,
    colorText: whiteColor,
    backgroundColor: status == "Warning" ? redColor : greenColor,
    icon: Icon(Icons.add_alert, color: whiteColor),
  );
}
