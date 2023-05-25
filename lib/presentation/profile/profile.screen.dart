import '../../app/core/core.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 100),
          _headerProfile(controller.userLogin!),
          const SizedBox(height: 30),
          _buildTransanctions(),
        ],
      ),
    );
  }

  Column _headerProfile(UserModel user) {
    return Column(
      children: [
        AvatarImage(
          user.image!,
          isSVG: false,
          width: 100,
          height: 100,
        ),
        const SizedBox(height: 10),
        Text(
          '${user.fName} ${user.lName}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          user.status!,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget _buildTransanctions() {
    return Column(
      children: [
        const CardProfile(
          'Update Profile',
          icon: Icons.person,
        ),
        const CardProfile(
          'Setting',
          icon: Icons.settings,
        ),
        const SizedBox(height: 160),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[350],
              minimumSize: const Size(
                double.infinity,
                50,
              ),
            ),
            onPressed: () {},
            child: const Text(
              'Log-Out',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
