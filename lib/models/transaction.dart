class Transaction {
  final String id;
  final double amount;
  final String title;
  final DateTime date;

  Transaction(
      {required this.title,
      required this.amount,
      required this.date,
      required this.id});
}
