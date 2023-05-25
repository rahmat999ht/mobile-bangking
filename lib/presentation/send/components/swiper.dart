import '../../../app/core/core.dart';

class ListSwiper extends GetView<SendController> {
  const ListSwiper(this.listTransaksi, {super.key});

  final List<TransaksiModel> listTransaksi;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Swiper(
        onIndexChanged: (index) {
          controller.counter.value = index;
        },
        viewportFraction: 0.25,
        scale: 0.2,
        itemCount: listTransaksi.length,
        itemBuilder: (context, index) {
          final userId = listTransaksi[index].toUser!.id;
          return StreamBuilder<DocumentSnapshot<UserModel>>(
            stream: controller.firebaseMethod.getUserByID(userId).snapshots(),
            builder: (context, s) {
              if (s.hasData) {
                final user = s.data!.data()!;
                return AvatarImage(
                  user.image!,
                  isSVG: false,
                );
              } else {
                return const CircularProgressIndicator(
                  color: Colors.grey,
                );
              }
            },
          );
        },
      ),
    );
  }
}
