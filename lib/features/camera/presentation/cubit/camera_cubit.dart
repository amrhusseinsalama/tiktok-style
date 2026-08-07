import 'dart:async';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'camera_state.dart';

class CameraCubit extends Cubit<CameraState> {
  CameraCubit() : super(CameraInitial());
  CameraController? cameraController;
  List<CameraDescription> cameras = [];
  int selectedCameraIndex = 0;
  int recordedSeconds = 0;
  Timer? timer;

  Future<void> initializeCamera() async {
    emit(CameraLoading());
    try {
      cameras = await availableCameras();
      cameraController = CameraController(
        cameras[selectedCameraIndex],
        ResolutionPreset.high,
      );
      await cameraController!.initialize();
      emit(CameraReady());
    } catch (e) {
      emit(CameraError(e.toString()));
    }
  }

  Future<void> startRecording() async {
    if (cameraController == null || cameraController!.value.isRecordingVideo) {
      return;
    }
    recordedSeconds = 0;
    await cameraController!.startVideoRecording();
    emit(CameraRecording(recordedSeconds));
    timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      recordedSeconds++;
      emit(CameraRecording(recordedSeconds));
      if (recordedSeconds >= 30) {
        await stopRecording();
      }
    });
  }

  Future<void> stopRecording() async {
    if (cameraController == null || !cameraController!.value.isRecordingVideo) {
      return;
    }
    timer?.cancel();
    final video = await cameraController!.stopVideoRecording();
    emit(CameraStopped(video.path));
  }

  Future<void> switchCamera() async {
    if (cameraController?.value.isRecordingVideo ?? false) {
      return;
    }
    emit(CameraLoading());
    try {
      selectedCameraIndex = (selectedCameraIndex + 1) % cameras.length;
      await cameraController?.dispose();
      cameraController = CameraController(
        cameras[selectedCameraIndex],
        ResolutionPreset.high,
      );
      await cameraController!.initialize();
      emit(CameraReady());
    } catch (e) {
      emit(CameraError(e.toString()));
    }
  }

  @override
  Future<void> close() async {
    timer?.cancel();
    await cameraController?.dispose();
    return super.close();
  }
}
