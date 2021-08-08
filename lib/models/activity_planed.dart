class ActivityPlaned {
  ActivityPlaned(this.type, this.period, this.time, this.days);
  String type;
  String period;
  String time;
  List<String> days;

  @override
  String toString() {
    return '{${this.type}, ${this.period}, ${this.time}, ${this.days}}';
  }
}
