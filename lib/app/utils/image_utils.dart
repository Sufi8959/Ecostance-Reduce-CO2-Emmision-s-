import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:net_carbons/presentation/resources/assets.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageUtils {
  static Future<XFile?>? cropImage(String imagePath) async {
    CroppedFile? file = await ImageCropper().cropImage(
      sourcePath: imagePath,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: AppColors.primaryActiveColor,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: true),
        IOSUiSettings(
            title: 'Cropper',
            aspectRatioPickerButtonHidden: true,
            aspectRatioLockEnabled: true,
            resetAspectRatioEnabled: false,
            resetButtonHidden: true),
      ],
    );
    if (file != null) {
      return XFile(file.path);
    }
    return null;
  }

  static Future<dynamic> getImage(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return SizedBox(
            height: 241.h,
            width: MediaQuery.of(context).size.width,
            child: ImagePickerWidget(
              onImage: (image) async {
                Navigator.pop(ctx, image);
              },
            ),
          );
        });
  }
}

class ImagePickerWidget extends StatelessWidget {
  ImagePickerWidget({
    Key? key,
    required this.onImage,
  }) : super(key: key);
  final ImagePicker _picker = ImagePicker();
  final Function(XFile) onImage;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            final navigator = Navigator.of(context);
            final scaffoldMessenger = ScaffoldMessenger.of(context);
            if (Platform.isIOS) {
              if (await Permission.photos.isGranted != true) {
                final status = await Permission.photos.request();
                if (status == PermissionStatus.permanentlyDenied) {
                  navigator.pop();
                  scaffoldMessenger.showSnackBar(SnackBar(
                    content: const Text('Please enable permission in settings'),
                    action: SnackBarAction(
                        label: 'Open Settings',
                        onPressed: () {
                          openAppSettings();
                        }),
                  ));
                }
                if (status != PermissionStatus.granted) {
                  final status = await Permission.photos.request();
                  if (status.isGranted || status.isLimited) {
                    final XFile? image =
                        await _picker.pickImage(source: ImageSource.camera);
                    if (image != null) {
                      onImage(image);
                    }
                  }else{
                    navigator.pop();
                    scaffoldMessenger.showSnackBar(SnackBar(
                      content: const Text('Please enable permission in settings'),
                      action: SnackBarAction(
                          label: 'Open Settings',
                          onPressed: () {
                            openAppSettings();
                          }),
                    ));
                  }

                  return;
                }
              }
            }

            final XFile? image =
                await _picker.pickImage(source: ImageSource.camera);
            if (image != null) {
              onImage(image);
            }
          },
          child: const ImagePickerButton(
            title: 'Capture image',
            svgName: SvgAssets.cameraIcon,
          ),
        ),
        SizedBox(
          width: 21.w,
        ),
        GestureDetector(
          onTap: () async {
            final navigator = Navigator.of(context);
            final scaffoldMessenger = ScaffoldMessenger.of(context);

            if (await Permission.photos.isGranted != true) {
              final status = await Permission.photos.request();
              if (status == PermissionStatus.permanentlyDenied) {
                navigator.pop();
                scaffoldMessenger.showSnackBar(SnackBar(
                  content: const Text('Please enable permission in settings'),
                  action: SnackBarAction(
                      label: 'Open Settings',
                      onPressed: () {
                        openAppSettings();
                      }),
                ));
              }
              if (status != PermissionStatus.granted) {
                final status = await Permission.photos.request();
                if (status.isGranted || status.isLimited) {
                  final XFile? image =
                      await _picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    onImage(image);
                  }
                }else{
                  navigator.pop();
                  scaffoldMessenger.showSnackBar(SnackBar(
                    content: const Text('Please enable permission in settings'),
                    action: SnackBarAction(
                        label: 'Open Settings',
                        onPressed: () {
                          openAppSettings();
                        }),
                  ));
                }

                return;
              }
            }

            final XFile? image =
                await _picker.pickImage(source: ImageSource.gallery);
            if (image != null) {
              onImage(image);
            }
          },
          child: const ImagePickerButton(
            title: 'Select image',
            svgName: SvgAssets.picture,
          ),
        ),
      ],
    );
  }
}

class ImagePickerButton extends StatelessWidget {
  const ImagePickerButton({
    Key? key,
    required this.title,
    required this.svgName,
  }) : super(key: key);
  final String title;
  final String svgName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGrey, width: 1)),
      width: 150.w,
      height: 169.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 67.w,
            height: 60.h,
            child: SvgPicture.asset(
              svgName,
              color: AppColors.primaryActiveColor,
              width: 67.w,
              height: 60.h,
            ),
          ),
          SizedBox(
            height: 26.h,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          )
        ],
      ),
    );
  }
}
