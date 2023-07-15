part of 'widgets.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  const TransactionCard(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (transaction.status == StatusTransaction.SUCCESS ||
                transaction.status == StatusTransaction.CANCEL) {
              Get.toNamed(
                Routes.TRANASCTION_DETAIL,
                arguments: [transaction],
              );
            }
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // * Image
              Container(
                width: 80,
                height: 100,
                margin: const EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  color: grayColor,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: transaction.status == StatusTransaction.TOPUP ||
                            transaction.status == StatusTransaction.WITHDRAW
                        ? AssetImage('assets/bg_topup.png') as ImageProvider
                        : NetworkImage(transaction.showtime!.movie!.poster),
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
                      transaction.status == StatusTransaction.TOPUP
                          ? "Top Up Wallet"
                          : transaction.status == StatusTransaction.WITHDRAW
                              ? "Withdraw Wallet"
                              : transaction.showtime!.movie!.title,
                      style: mediumPoppinsFontStyle.copyWith(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 2),
                  // * Genre
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 3,
                    child: Text(
                      NumberFormat.currency(
                        locale: 'id_ID',
                        decimalDigits: 0,
                        symbol: 'Rp ',
                      ).format(transaction.totalCost),
                      style: regularPoppinsFontStyle.copyWith(
                        color: transaction.status ==
                                    StatusTransaction.SUCCESS ||
                                transaction.status == StatusTransaction.WITHDRAW
                            ? redColor
                            : greenColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  // * Date
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 3,
                    child: Text(
                      transaction.dateTime.dateYear,
                      style: regularPoppinsFontStyle.copyWith(color: grayColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
