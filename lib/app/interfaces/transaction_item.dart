import '../core/core.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem(this.data,
      {Key? key, this.onTap, required this.idLogin})
      : super(key: key);
  final TransaksiModel data;
  final GestureTapCallback? onTap;
  final String idLogin;

  @override
  Widget build(BuildContext context) {
    final FirebaseMethod firebaseMethod = FirebaseMethod();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.fromLTRB(10, 12, 10, 10),
        decoration: BoxDecoration(
          color: AppColor.secondary,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: StreamBuilder<DocumentSnapshot<UserModel>>(
          stream: firebaseMethod.getUserByID(data.toUser!.id).snapshots(),
          builder: (ctx, s) {
            if (s.hasData) {
              final user = s.data!.data()!;
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AvatarImage(
                    user.image!,
                    isSVG: false,
                    width: 35,
                    height: 35,
                    radius: 50,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        _buildNameAndAmount(
                          user.fName!,
                          data.amount.toString(),
                        ),
                        const SizedBox(height: 2),
                        _buildDateAndType(),
                      ],
                    ),
                  ),
                ],
              );
            }
            return const EmptyState();
          },
        ),
      ),
    );
  }

  Widget _buildDateAndType() {
    final date = data.uploadDate.toDate();
    final day = date.day;
    final month = date.month;
    final year = date.year;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          '$day $month $year',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        (data.userLogin!.id == idLogin)
            ? const Icon(
                Icons.upload_rounded,
                color: AppColor.green,
              )
            : const Icon(
                Icons.download_rounded,
                color: AppColor.red,
              ),
      ],
    );
  }

  Widget _buildNameAndAmount(String name, String price) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 5),
        Text(
          price,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
