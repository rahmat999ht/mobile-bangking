import '../../../app/core/core.dart';

class CardBanking extends GetView<SendController> {
  const CardBanking(
    this.listTransaksi, {
    super.key,
  });

  final List<TransaksiModel> listTransaksi;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.secondary,
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
        border: Border.all(color: AppColor.inActiveIcon),
        boxShadow: const [
          BoxShadow(
            color: AppColor.purple,
            blurRadius: 5.5,
            spreadRadius: 2.5,
            offset: Offset(5, 5),
          )
        ],
      ),
      child: Obx(() {
        final date =
            listTransaksi[controller.counter.value].uploadDate.toDate();
        final userId = listTransaksi[controller.counter.value].toUser!.id;
        return StreamBuilder<DocumentSnapshot<UserModel>>(
          stream: controller.firebaseMethod.getUserByID(userId).snapshots(),
          builder: (context, s) {
            if (s.hasData) {
              final user = s.data!.data()!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          (user.typeBank == 'BRI')
                              ? SizedBox(
                                  height: 50,
                                  child: Image.network(
                                      'https://buatlogoonline.com/wp-content/uploads/2022/10/Logo-Bank-BRI.png'),
                                )
                              : SizedBox(
                                  height: 50,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 7),
                                    child: Image.network(
                                        'https://upload.wikimedia.org/wikipedia/id/thumb/5/55/BNI_logo.svg/175px-BNI_logo.svg.png?20131101150556'),
                                  ),
                                ),
                          Text(
                            '${controller.transaksiC.zeroLeft(date.month)}/${controller.transaksiC.zeroLeft(date.day)}',
                          ),
                        ],
                      ),
                      20.sizeHeight,
                      Obx(
                        () => Text(
                          controller.dashboardC.formatRupiah(
                            listTransaksi[controller.counter.value]
                                .amount
                                .toString(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  10.sizeHeight,
                  Text(
                    '**** **** **** ${user.noRek}',
                  ),
                ],
              );
            } else {
              return const LoadingState();
            }
          },
        );
      }),
    );
  }
}
