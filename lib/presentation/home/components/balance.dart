import '../../../app/core/core.dart';

buildBalance(String tabungan, HomeController c) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      BalanceCard(
        balance: c.dashboardC.formatRupiah(tabungan),
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
}
