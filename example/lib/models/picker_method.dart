// Copyright 2019 The FlutterCandies author. All rights reserved.
// Use of this source code is governed by an Apache license that can be found
// in the LICENSE file.

import 'dart:developer';

import 'package:custom_camera/wechat_camera_picker.dart';
import 'package:flutter/material.dart';
import 'package:video_compress/video_compress.dart';

import '../extensions/l10n_extensions.dart';

/// Provide common usages of the picker.
///
/// 提供常见的选择器调用方式。
List<PickMethod> pickMethods(BuildContext context) {
  return <PickMethod>[
    PickMethod(
      icon: '📷',
      name: context.l10n.pickMethodPhotosName,
      description: context.l10n.pickMethodPhotosDescription,
      method: (BuildContext context) => CameraPicker.pickFromCamera(context).then((data) {
        print('Data received: ${data!.file}');
      }),
    ),
    PickMethod(
      icon: '📹',
      name: context.l10n.pickMethodPhotosAndVideosName,
      description: context.l10n.pickMethodPhotosAndVideosDescription,
      method: (BuildContext context) => CameraPicker.pickFromCamera(
        context,
        pickerConfig: CameraPickerConfig(
            enableRecording: true,
            maxCaptureLimit: 5,
            imageQuality: 30,
            videoQuality: VideoQuality.MediumQuality,
            maximumRecordingDuration: Duration(
              seconds: 150,
            ),
            onPickConfirmed: (value) {
              log("Value  :$value");
            }),
      ).then((value) {
        log("Back Value2 : ${value}");
      }),
    ),
    PickMethod(
      icon: '🎥',
      name: context.l10n.pickMethodVideosName,
      description: context.l10n.pickMethodVideosDescription,
      method: (BuildContext context) => CameraPicker.pickFromCamera(
        context,
        pickerConfig: CameraPickerConfig(
            enableRecording: true,
            onlyEnableRecording: true,
            onXFileCaptured: (xFile, cameraPreview) {
              log("File Path : ${xFile.path}");
              return true;
            }),
      ).then((data) {
        print('Data received: ${data!.file}');
      }),
    ),
    PickMethod(
        icon: '📽',
        name: context.l10n.pickMethodVideosByTapName,
        description: context.l10n.pickMethodVideosByTapDescription,
        method: (BuildContext context) => CameraPicker.pickFromCamera(
              context,
              pickerConfig: const CameraPickerConfig(
                enableRecording: true,
                onlyEnableRecording: true,
                enableTapRecording: true,
              ),
            ).then((data) {
              print('Data received: ${data!.file}');
            })),
    PickMethod(
      icon: '🈲',
      name: context.l10n.pickMethodSilenceRecordingName,
      description: context.l10n.pickMethodSilenceRecordingDescription,
      method: (BuildContext context) => CameraPicker.pickFromCamera(
        context,
        pickerConfig: const CameraPickerConfig(
          enableRecording: true,
          onlyEnableRecording: true,
          enableTapRecording: true,
          enableAudio: false,
        ),
      ).then((data) {
        print('Data received: ${data!.file}');
      }),
    ),
    PickMethod(
      icon: '⏳',
      name: context.l10n.pickMethodNoDurationLimitName,
      description: context.l10n.pickMethodNoDurationLimitDescription,
      method: (BuildContext context) => CameraPicker.pickFromCamera(
        context,
        pickerConfig: const CameraPickerConfig(
          enableRecording: true,
          onlyEnableRecording: true,
          enableTapRecording: true,
          maximumRecordingDuration: null,
        ),
      ).then((data) {
        print('Data received: ${data!.file}');
      }),
    ),
    PickMethod(
      icon: '🎨',
      name: context.l10n.pickMethodCustomizableThemeName,
      description: context.l10n.pickMethodCustomizableThemeDescription,
      method: (BuildContext context) => CameraPicker.pickFromCamera(
        context,
        pickerConfig: CameraPickerConfig(
          theme: CameraPicker.themeData(Colors.blue),
        ),
      ).then((data) {
        print('Data received: ${data!.file}');
      }),
    ),
    PickMethod(
      icon: '↩️',
      name: context.l10n.pickMethodRotateInTurnsName,
      description: context.l10n.pickMethodRotateInTurnsDescription,
      method: (BuildContext context) => CameraPicker.pickFromCamera(
        context,
        pickerConfig: const CameraPickerConfig(cameraQuarterTurns: 1),
      ).then((data) {
        print('Data received: ${data!.file}');
      }),
    ),
    PickMethod(
      icon: '🔍',
      name: context.l10n.pickMethodScalingPreviewName,
      description: context.l10n.pickMethodScalingPreviewDescription,
      method: (BuildContext context) => CameraPicker.pickFromCamera(
        context,
        pickerConfig: const CameraPickerConfig(enableScaledPreview: true),
      ).then((data) {
        print('Data received: ${data!.file}');
      }),
    ),
    PickMethod(
      icon: '🌀',
      name: context.l10n.pickMethodLowerResolutionName,
      description: context.l10n.pickMethodLowerResolutionDescription,
      method: (BuildContext context) => CameraPicker.pickFromCamera(
        context,
        pickerConfig: const CameraPickerConfig(
          resolutionPreset: ResolutionPreset.low,
        ),
      ).then((data) {
        print('Data received: ${data!.file}');
      }),
    ),
    PickMethod(
      icon: '🤳',
      name: context.l10n.pickMethodPreferFrontCameraName,
      description: context.l10n.pickMethodPreferFrontCameraDescription,
      method: (BuildContext context) => CameraPicker.pickFromCamera(
        context,
        pickerConfig: const CameraPickerConfig(
          preferredLensDirection: CameraLensDirection.front,
        ),
      ).then((data) {
        print('Data received: ${data!.file}');
      }),
    ),
    PickMethod(
      icon: '📸',
      name: context.l10n.pickMethodPreferFlashlightOnName,
      description: context.l10n.pickMethodPreferFlashlightOnDescription,
      method: (BuildContext context) => CameraPicker.pickFromCamera(
        context,
        pickerConfig: const CameraPickerConfig(
          preferredFlashMode: FlashMode.always,
        ),
      ).then((data) {
        print('Data received: ${data!.file}');
      }),
    ),
    PickMethod(
      icon: '🪄',
      name: context.l10n.pickMethodForegroundBuilderName,
      description: context.l10n.pickMethodForegroundBuilderDescription,
      method: (BuildContext context) => CameraPicker.pickFromCamera(
        context,
        pickerConfig: CameraPickerConfig(
          foregroundBuilder: (
            BuildContext context,
            CameraController? controller,
          ) {
            return Center(
              child: Text(
                controller == null ? 'Waiting for initialize...' : '${controller.description.lensDirection}',
                style: const TextStyle(color: Colors.white),
              ),
            );
          },
        ),
      ).then((data) {
        print('Data received: ${data!.file}');
      }),
    ),
  ];
}

/// Define a regular pick method.
final class PickMethod {
  const PickMethod({
    required this.icon,
    required this.name,
    required this.description,
    required this.method,
    this.onLongPress,
  });

  final String icon;
  final String name;
  final String description;

  /// The core function that defines how to use the picker.
  final Future<AssetEntity?> Function(BuildContext context) method;

  final GestureLongPressCallback? onLongPress;
}
