part of 'widgets.dart';

class RatingStars extends StatelessWidget {
  final double voteAverage;
  final double starSize;

  final MainAxisAlignment rowMainAxisAlignment;

  RatingStars({
    this.voteAverage = 0,
    this.starSize = 20,
    this.rowMainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    // int n = (voteAverage / 2).round();
    int n = voteAverage.round();
    List<Widget> widgets = List.generate(
      5,
      (index) => Icon(
        Icons.star,
        color: index < n ? yellowColor : '616060'.toColor(),
        size: starSize,
      ),
    );

    return Row(
      mainAxisAlignment: rowMainAxisAlignment,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: widgets,
    );
  }
}
