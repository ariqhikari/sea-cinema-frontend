part of 'widgets.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Material(
            color: darkGrayColor,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Get.toNamed(Routes.MOVIE_DETAIL, arguments: movie);
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // * Image
                    Container(
                      width: 90,
                      height: 75,
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        color: grayColor,
                        borderRadius: BorderRadius.circular(9),
                        image: DecorationImage(
                          image: NetworkImage(movie.poster),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // * Detail
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // * Title
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 - 3,
                          child: Text(
                            movie.title,
                            style:
                                mediumPoppinsFontStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 2),
                        // * Genre
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 - 3,
                          child: Text(
                            movie.getGenres,
                            style: regularPoppinsFontStyle.copyWith(
                              color: '878787'.toColor(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        // * Star
                        RatingStars(voteAverage: movie.rating.toDouble()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
