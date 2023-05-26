import '../../../app/core/core.dart';

buildBalance(HomeController c) {
  final userId = c.dashboardC.userModel!.id;
  return StreamBuilder<DocumentSnapshot<UserModel>>(
    stream: c.firebaseMethod.getUserByID(userId).snapshots(),
    builder: (context, s) {
      if (s.hasData) {
        final user = s.data!.data()!;
        return Stack(
          clipBehavior: Clip.none,
          children: [
            BalanceCard(
              balance: c.dashboardC.formatRupiah('${user.savings}'),
            ),
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColor.secondary,
                  shape: BoxShape.circle,
                  border: Border.all(),
                ),
                child: const Icon(Icons.add),
              ),
            )
          ],
        );
      } else {
        return const LoadingState();
      }
    },
  );
}
