import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sea_cinema_frontend/app/data/data.dart';
import 'package:sea_cinema_frontend/app/extensions/extensions.dart';
import 'package:sea_cinema_frontend/app/shared/shared.dart';
import 'package:sea_cinema_frontend/app/widgets/widgets.dart';
import 'package:supercharged/supercharged.dart';

import '../controllers/movie_detail_controller.dart';

class MovieDetailView extends GetView<MovieDetailController> {
  const MovieDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScaffoldDefault(
        isPadding: false,
        child: Stack(
          children: [
            // * Poster
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: grayColor,
                image: DecorationImage(
                    image: NetworkImage(controller.movie.poster),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(.75),
                  Colors.black.withOpacity(0),
                ],
              )),
            ),
            Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // * Header
                  const Header('Detail Movie', isShadow: true, isTitle: false),
                  // * Title
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 75),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      color: darkGrayColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.movie.title,
                                style: semiBoldPoppinsFontStyle.copyWith(
                                    fontSize: 22),
                              ),
                              const SizedBox(height: 5),
                              RatingStars(
                                  voteAverage:
                                      controller.movie.rating.toDouble()),
                              const SizedBox(height: 5),
                              Text(controller.movie.getGenres,
                                  style: regularPoppinsFontStyle.copyWith(
                                      color: 'CACBCE'.toColor())),
                              Text(controller.movie.duration,
                                  style: regularPoppinsFontStyle.copyWith(
                                      color: 'CACBCE'.toColor())),
                            ],
                          ),
                        ),
                        // * Age Rating
                        Container(
                          width: 40,
                          height: 20,
                          margin: const EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                              color: 'F5F6F8'.toColor(),
                              borderRadius: BorderRadius.circular(4)),
                          child: Text(
                            '${controller.movie.ageRating}+',
                            textAlign: TextAlign.center,
                            style: regularPoppinsFontStyle.copyWith(
                              color: blackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  // * Synopsis
                  Text(
                    'Synopsis',
                    style: mediumPoppinsFontStyle.copyWith(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    controller.movie.description,
                    style: regularPoppinsFontStyle.copyWith(
                        color: '878787'.toColor()),
                  ),
                  const SizedBox(height: 50),
                  FutureBuilder<List<Showtime>>(
                      future: controller.getShowtime(controller.movie.id),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: makeLoadingIndicator());
                        }
                        if (!snapshot.hasData) {
                          return const Center(
                            child: Text("Tidak ada data..."),
                          );
                        }

                        return Button(
                            text: "Book Now",
                            onTap: () {
                              if (controller.userController.user.value.age <
                                  controller.movie.ageRating) {
                                showSnackBar(
                                    "Umur anda tidak mencukupi untuk menonton film ini!");
                                return;
                              }

                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (context) => ModalShowtimes(
                                    controller.movie, snapshot.data!),
                              );
                            });
                      }),
                ],
              ),
            ),
          ],
        ));
  }
}
