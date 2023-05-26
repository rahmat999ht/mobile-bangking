import 'package:mobile_bangking/app/core/core.dart';

class TransaksiToDay extends GetView<TransaksiController> {
  const TransaksiToDay({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => _buildTransanctions(state!),
      onEmpty: const EmptyState(),
      onLoading: const LoadingState(),
      onError: (e) => ErrorState(error: e!),
    );
  }

  Widget _buildTransanctions(
    List<InitTransaksi> listTransaksi,
  ) {
    return Column(
      children: List.generate(
        listTransaksi.length,
        (index) {
          if (listTransaksi.isNotEmpty) {
            return TransactionItem(
              listTransaksi[index],
              onTap: () {},
            );
          } else {
            return const Text('ToDay isEmpty');
          }
        },
      ),
    );
  }
}
