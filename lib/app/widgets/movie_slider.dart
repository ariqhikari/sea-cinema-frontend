part of 'widgets.dart';

class MovieSlider extends StatelessWidget {
  final Movie movie;

  const MovieSlider({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.MOVIE_DETAIL, arguments: movie);
      },
      child: AnimatedContainer(
        width: 200,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: grayColor,
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: NetworkImage(movie.poster),
            fit: BoxFit.cover,
          ),
        ),
        duration: animationDuration,
      ),
    );
  }
}
