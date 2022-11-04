String twoDigits(int n) => n.toString().padLeft(2,'0');

String formatTime(int n) {
  final hours = n ~/ 60;
  final minutes = n.remainder(60);
  return "${twoDigits(hours)}:${twoDigits(minutes)}";
}