part of 'camera_cubit.dart';

sealed class CameraState extends Equatable {
  const CameraState();

  @override
  List<Object> get props => [];
}

final class CameraInitial extends CameraState {}

class CameraLoading extends CameraState {}

class CameraReady extends CameraState {}

class CameraRecording extends CameraState {
  final int recordedSeconds;

  const CameraRecording(this.recordedSeconds);
  @override
  List<Object> get props => [recordedSeconds];
}

class CameraStopped extends CameraState {
  final String videoPath;

  const CameraStopped(this.videoPath);
  @override
  List<Object> get props => [videoPath];
}

class CameraError extends CameraState {
  final String message;

  const CameraError(this.message);
}
