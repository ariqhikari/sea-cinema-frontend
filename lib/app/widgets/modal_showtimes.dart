part of 'widgets.dart';

class ModalShowtimes extends StatelessWidget {
  final Movie movie;
  final List<Showtime> showtimes;
  var selectedDate = 0.obs;
  var selectedShowtimeIndex = 0.obs;
  var selectedShowtime = Showtime(
      id: '',
      movieId: '',
      date: DateTime.now(),
      time: TimeOfDay.now(),
      seats: {}).obs;

  ModalShowtimes(this.movie, this.showtimes, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DateTime> dates =
        showtimes.map((showtime) => showtime.date).toSet().toList();
    selectedShowtime.value = showtimes
        .filter((showtime) =>
            showtime.date.isSameDate(showtimes[selectedDate.value].date))
        .toList()[0];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: '323232'.toColor(),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30))),
      child: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          const SizedBox(height: 21),
          Center(
              child: Text(
            'Selected Date and Time',
            style: mediumPoppinsFontStyle.copyWith(fontSize: 16),
          )),
          const SizedBox(height: 20),
          // * Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dates.length,
                  itemBuilder: (_, index) => Container(
                    margin: EdgeInsets.only(
                        right: dates.lastIndex == index ? 0 : 15),
                    child: Obx(
                      () => DateCard(
                        dates[index],
                        isSelected: selectedDate.value == index,
                        onTap: () {
                          selectedDate.value = index;
                          selectedShowtimeIndex.value = 0;
                          selectedShowtime.value = showtimes
                              .filter((showtime) => showtime.date.isSameDate(
                                  showtimes[selectedDate.value].date))
                              .toList()[0];
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: showtimes
                      .filter((showtime) => showtime.date
                          .isSameDate(showtimes[selectedDate.value].date))
                      .toList()
                      .length,
                  itemBuilder: (_, index) => Container(
                    width: 70,
                    height: 50,
                    margin: EdgeInsets.only(right: 10),
                    child: Obx(
                      () => TimeCard(
                        showtimes
                            .filter((showtime) => showtime.date
                                .isSameDate(showtimes[selectedDate.value].date))
                            .toList()[index]
                            .time,
                        isSelected: selectedShowtimeIndex.value == index,
                        onTap: () {
                          selectedShowtimeIndex.value = index;
                          selectedShowtime.value = showtimes
                              .filter((showtime) => showtime.date.isSameDate(
                                  showtimes[selectedDate.value].date))
                              .toList()[index];
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Button(
                  text: "Book Now",
                  onTap: () {
                    Get.toNamed(
                      Routes.SEATS,
                      arguments: [movie, selectedShowtime.value],
                    );
                  }),
            ],
          ),
          const SizedBox(height: 51),
        ],
      ),
    );
  }
}
