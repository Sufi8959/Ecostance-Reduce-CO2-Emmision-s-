// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class DownloadService {
//   download(String url) async {
//     final status = await Permission.storage.request();
//
//     if (status.isGranted) {
//       final baseStorage = await getApplicationDocumentsDirectory();
//       final id = FlutterDownloader.enqueue(
//           url: url, savedDir: baseStorage.path, fileName: 'fileFromNet');
//     }
//   }
//
//   Future<bool> _checkPermission() async {
//     if (Platform.isIOS) {
//       return true;
//     }
//     return false;
//     // final deviceInfo = DeviceInfoPlugin();
//     // final androidInfo = await deviceInfo.androidInfo;
//     // if (widget.platform == TargetPlatform.android &&
//     //     androidInfo.version.sdkInt <= 28) {
//     //   final status = await Permission.storage.status;
//     //   if (status != PermissionStatus.granted) {
//     //     final result = await Permission.storage.request();
//     //     if (result == PermissionStatus.granted) {
//     //       return true;
//     //     }
//     //   } else {
//     //     return true;
//     //   }
//     // } else {
//     //   return true;
//     // }
//     // return false;
//   }
// }
//
// void _downloadFile(String url) async {
//   final status = await Permission.storage.request();
//   if (status.isGranted) {
//     final baseStorage = await getExternalStorageDirectory();
//     final id = await FlutterDownloader.enqueue(
//         url: url, savedDir: baseStorage!.path, fileName: ' filename ');
//   } else {
//     //print(' no permission ');
//   }
// }
