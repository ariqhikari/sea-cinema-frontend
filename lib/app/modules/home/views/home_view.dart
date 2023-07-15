import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sea_cinema_frontend/app/data/data.dart';
import 'package:sea_cinema_frontend/app/extensions/extensions.dart';
import 'package:sea_cinema_frontend/app/routes/app_pages.dart';
import 'package:sea_cinema_frontend/app/shared/shared.dart';
import 'package:sea_cinema_frontend/app/widgets/widgets.dart';
import 'package:supercharged/supercharged.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final controller = Get.put(HomeController());

  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScaffoldDefault(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // * Header
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome ${controller.userController.user.value.name}👋",
                    style:
                        regularPoppinsFontStyle.copyWith(color: whiteColor80),
                  ),
                  const SizedBox(height: 9),
                  Text(
                    "Let’s relax and watch a movie",
                    style: semiBoldPoppinsFontStyle,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.PROFILE);
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: grayColor,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(
                          controller.userController.user.value.getUrlAvatar),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // * Now Playing
          Text(
            "Now Playing",
            style: mediumPoppinsFontStyle.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 17),
          FutureBuilder<List<Movie>>(
            future: controller.getNowPlaying(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: makeLoadingIndicator());
              }
              if (!snapshot.hasData) {
                return const Center(
                  child: Text("Tidak ada data..."),
                );
              }

              return Column(children: [
                CarouselSlider(
                  items: snapshot.data!.map((movie) {
                    return Builder(
                      builder: (BuildContext context) {
                        return MovieSlider(movie: movie);
                      },
                    );
                  }).toList(),
                  carouselController: controller.carouselController,
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      disableCenter: true,
                      aspectRatio: 9 / 16,
                      height: 360,
                      onPageChanged: (index, reason) {
                        controller.current.value = index;
                      }),
                ),
                const SizedBox(height: 16),
                // * Title
                Obx(
                  () => Text(
                    snapshot.data![controller.current.value].title,
                    textAlign: TextAlign.center,
                    style: semiBoldPoppinsFontStyle.copyWith(fontSize: 18),
                  ),
                ),
                // * Genre
                Text(
                  snapshot.data![controller.current.value].genres[0],
                  textAlign: TextAlign.center,
                  style: regularPoppinsFontStyle.copyWith(
                      color: '878787'.toColor()),
                ),
                const SizedBox(height: 7),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: snapshot.data!.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => controller.carouselController
                            .animateToPage(entry.key),
                        child: AnimatedContainer(
                          width:
                              controller.current.value == entry.key ? 32 : 12,
                          height: 12,
                          margin: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: controller.current.value == entry.key
                                ? orangeColor
                                : '616060'.toColor(),
                          ),
                          duration: animationDuration,
                        ),
                      );
                    }).toList(),
                  ),
                )
              ]);
            },
          ),
          const SizedBox(height: 24),
          // * Action
          Text(
            "Action",
            style: mediumPoppinsFontStyle.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 17),
          FutureBuilder<List<Movie>>(
            future: controller.getMovieByGenre("Action"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: makeLoadingIndicator());
              }
              if (!snapshot.hasData) {
                return const Center(
                  child: Text("Tidak ada data..."),
                );
              }

              return Column(children: [
                for (var movie in snapshot.data!) MovieCard(movie),
              ]);
            },
          ),
          const SizedBox(height: 16),
          // * Fantasy
          Text(
            "Fantasy",
            style: mediumPoppinsFontStyle.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 17),
          FutureBuilder<List<Movie>>(
            future: controller.getMovieByGenre("Fantasy"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: makeLoadingIndicator());
              }
              if (!snapshot.hasData) {
                return const Center(
                  child: Text("Tidak ada data..."),
                );
              }

              return Column(children: [
                for (var movie in snapshot.data!) MovieCard(movie),
              ]);
            },
          ),
          // * Horror
          Text(
            "Horror",
            style: mediumPoppinsFontStyle.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 17),
          FutureBuilder<List<Movie>>(
            future: controller.getMovieByGenre("Horror"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: makeLoadingIndicator());
              }
              if (!snapshot.hasData) {
                return const Center(
                  child: Text("Tidak ada data..."),
                );
              }

              return Column(children: [
                for (var movie in snapshot.data!) MovieCard(movie),
              ]);
            },
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
