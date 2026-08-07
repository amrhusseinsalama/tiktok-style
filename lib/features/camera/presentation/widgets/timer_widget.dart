import 'package:flutter/material.dart';
import 'package:tiktok_style/core/helper/time_format.dart';

Widget buildTimerWidget(bool isRecording, int recordedSeconds) {
  return Positioned(
    top: 60,
    left: 20,
    child: Row(
      children: [
        if (isRecording)
          const Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(Icons.fiber_manual_record, color: Colors.red, size: 18),
          ),
        Text(
          formatTime(recordedSeconds),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
