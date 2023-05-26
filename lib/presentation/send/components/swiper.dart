import 'dart:developer';

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
        // index: controller.counter.value,
        viewportFraction: 0.25,
        scale: 0.2,
        loop: false,
        itemCount: listTransaksi.length,
        itemBuilder: (context, index) {
          final userId = listTransaksi[index].toUser!.id;
          log('panjang ${listTransaksi.length}');
          log('index $index $userId');

          return StreamBuilder<DocumentSnapshot<UserModel>>(
            stream: controller.firebaseMethod.getUserByID(userId).snapshots(),
            builder: (context, s) {
              log(s.data?.data()?.image ?? "W");
              if (s.hasData) {
                final user = s.data!.data()!;
                return AvatarImage(
                  user.image!,
                  isSVG: false,
                );
              } else {
                return const CircularProgressIndicator(
                  color: AppColor.shadowColor,
                );
              }
            },
          );
        },
      ),
    );
  }
}

// class ListSwiper extends GetView<SendController> {
//   const ListSwiper(this.listTransaksi, {super.key});

//   final List<TransaksiModel> listTransaksi;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 100,
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           children: [
//             for (int i = 0; i < listTransaksi.length; i++)
//               StreamBuilder<DocumentSnapshot<UserModel>>(
//                 stream: controller.firebaseMethod
//                     .getUserByID(listTransaksi[i].toUser!.id)
//                     .snapshots(),
//                 builder: (context, s) {
//                   if (s.hasData) {
//                     final user = s.data!.data()!;
//                     return GestureDetector(
//                       onTap: () {
//                         controller.counter.value = i;
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.only(
//                           left: i == 0 ? 20 : 10,
//                           top: 5,
//                           right: 8,
//                           bottom: 5,
//                         ),
//                         child: UserBox(
//                           user: user,
//                           height: 60,
//                           width: 60,
//                         ),
//                       ),
//                     );
//                   } else {
//                     return const CircularProgressIndicator(
//                       color: AppColor.shadowColor,
//                     );
//                   }
//                 },
//               ),
//           ],
//         ),
//       ),
//       //  ListView.builder(
//       //   shrinkWrap: true,
//       //   findChildIndexCallback: (key) {
//       //     return controller.counter.value = int.parse(key.toString());
//       //   },
//       //   itemCount: listTransaksi.length,
//       //   scrollDirection: Axis.horizontal,
//       //   itemBuilder: (context, index) =>
//       //       StreamBuilder<DocumentSnapshot<UserModel>>(
//       //     stream: controller.firebaseMethod
//       //         .getUserByID(listTransaksi[index].toUser!.id)
//       //         .snapshots(),
//       //     builder: (context, s) {
//       //       if (s.hasData) {
//       //         final user = s.data!.data()!;
//       //         return Padding(
//       //           padding: const EdgeInsets.all(8.0),
//       //           child: UserBox(
//       //             user: user,
//       //             height: 60,
//       //             width: 60,
//       //           ),
//       //         );
//       //       } else {
//       //         return const CircularProgressIndicator(
//       //           color: AppColor.shadowColor,
//       //         );
//       //       }
//       //     },
//       //   ),
//       // ),
//     );
//   }
// }
