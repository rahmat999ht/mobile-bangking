import '../../../app/core/core.dart';

buildTransactionTitle() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: const [
      Text(
        "Transactions",
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      ),
      Expanded(
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Today",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      Icon(Icons.expand_more_rounded),
    ],
  );
}
