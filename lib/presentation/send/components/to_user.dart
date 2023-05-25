import '../../../app/core/core.dart';

StreamBuilder toUser(List<TransaksiModel> listTransaksi, int value) {
  final userId = listTransaksi[value].toUser!.id;
  final firebaseMethod = FirebaseMethod();
  return StreamBuilder<DocumentSnapshot<UserModel>>(
    stream: firebaseMethod.getUserByID(userId).snapshots(),
    builder: (context, s) {
      if (s.hasData) {
        final user = s.data!.data()!;
        return RichText(
          text: TextSpan(
            text: 'To  ',
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              color: AppColor.shadowColor,
            ),
            children: <TextSpan>[
              TextSpan(
                text: user.fName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColor.primary,
                ),
              ),
            ],
          ),
        );
      } else {
        return const LoadingState();
      }
    },
  );
}
