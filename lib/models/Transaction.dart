class Transaction {
  static int cid = 0;
  final String id;
  final String title;
  final double amount;
  final DateTime dateTime;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.dateTime,
  });

  @override
  String toString() {
    return 'Transaction{id: $id, title: $title, amount: $amount, dateTime: $dateTime}';
  }
}
