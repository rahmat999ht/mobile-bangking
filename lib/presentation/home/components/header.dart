import '../../../app/core/core.dart';

buildHeader(String userId) {
  final firebaseMethod = FirebaseMethod();
  return appBarCustom(
    isCenter: false,
    StreamBuilder<DocumentSnapshot<UserModel>>(
      stream: firebaseMethod.getUserByID(userId).snapshots(),
      builder: (context, s) {
        if (s.hasData) {
          final user = s.data!.data()!;
          return AvatarImage(
            user.image!,
            isSVG: false,
            width: 35,
            height: 35,
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    ),
    StreamBuilder<DocumentSnapshot<UserModel>>(
      stream: firebaseMethod.getUserByID(userId).snapshots(),
      builder: (context, s) {
        if (s.hasData) {
          final user = s.data!.data()!;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello ${user.fName} ${user.lName}",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
              5.sizeHeight,
              const Text(
                "Welcome Back!",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: AppColor.primary,
                ),
              ),
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    ),
    const SizedBox(),
  );
}
