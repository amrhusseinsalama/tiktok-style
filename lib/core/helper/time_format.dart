String formatTime(int seconds) {
  final minutes = (seconds ~/ 60).toString().padLeft(2, '0');

  final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');

  return '$minutes:$remainingSeconds';
}

String formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');

  final minutes = twoDigits(duration.inMinutes.remainder(60));

  final seconds = twoDigits(duration.inSeconds.remainder(60));

  return "$minutes:$seconds";
}