import '../../../app/core/core.dart';

buildHeader(UserModel user) {
  return appBarCustom(
    isCenter: false,
    AvatarImage(
      user.image!,
      isSVG: false,
      width: 35,
      height: 35,
    ),
    Column(
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
    ),
    const SizedBox(),
  );
}
