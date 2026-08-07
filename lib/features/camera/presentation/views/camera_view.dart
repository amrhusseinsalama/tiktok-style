import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_style/core/di/dependency_injection.dart';
import 'package:tiktok_style/core/helper/extentions.dart';
import 'package:tiktok_style/core/helper/spacing.dart';
import 'package:tiktok_style/core/helper/video_filters.dart';
import 'package:tiktok_style/core/routing/routes.dart';
import 'package:tiktok_style/features/camera/presentation/widgets/filter_selector_widget.dart';
import 'package:tiktok_style/features/camera/presentation/widgets/recording_button_widget.dart';
import 'package:tiktok_style/features/camera/presentation/widgets/timer_widget.dart';
import '../cubit/camera_cubit.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  int recordedSeconds = 0;
  bool isRecording = false;
  int selectedFilter = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CameraCubit>()..initializeCamera(),
      child: BlocConsumer<CameraCubit, CameraState>(
        listener: (context, state) {
          if (state is CameraStopped) {
            context.pushNamed(
              Routes.videoPreview,
              arguments: {
                'videoPath': state.videoPath,
                'selectedFilter': selectedFilter,
              },
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<CameraCubit>();
          if (state is CameraLoading ||
              cubit.cameraController == null ||
              !cubit.cameraController!.value.isInitialized) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (state is CameraRecording) {
            recordedSeconds = state.recordedSeconds;
            isRecording = true;
          } else {
            recordedSeconds = 0;
            isRecording = false;
          }

          return Scaffold(
            body: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: cubit.cameraController!.value.previewSize!.height,
                      height: cubit.cameraController!.value.previewSize!.width,
                      child: ColorFiltered(
                        colorFilter: getFilter(selectedFilter),
                        child: CameraPreview(cubit.cameraController!),
                      ),
                    ),
                  ),
                ),
                buildTimerWidget(isRecording, recordedSeconds),
                buildFilterSelector(selectedFilter, (filter) {
                  if (isRecording) return;
                  setState(() {
                    selectedFilter = filter;
                  });
                }),
                verticalSpacing(10),
                buildRecordingButton(
                  () {
                    if (isRecording) {
                      cubit.stopRecording();
                    } else {
                      cubit.startRecording();
                    }
                  },
                  isRecording ? 30.w : 60.w,
                  isRecording ? 30.h : 60.h,
                  isRecording ? 10.r : 50.r,
                ),

                Positioned(
                  top: 50,
                  right: 20,
                  child: IconButton(
                    onPressed: isRecording ? null : cubit.switchCamera,
                    icon: Icon(
                      Icons.cameraswitch_rounded,
                      color: isRecording ? Colors.grey : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
