class Activities {
  Activities(
    this.id,
    this.type,
    this.date,
    this.status,
    this.reason,
    this.time,
    this.borg,
  );
  String id;
  String type;
  DateTime date;
  String status;
  String reason;
  int time;
  int borg;

  @override
  String toString() {
    return '{${this.id}, {${this.type}}, ${this.date}, ${this.status}, ${this.reason}, ${this.time}, ${this.borg}}';
  }
}
