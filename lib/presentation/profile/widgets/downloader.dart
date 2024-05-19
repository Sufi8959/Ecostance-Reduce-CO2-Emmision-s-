import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:android_path_provider/android_path_provider.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:net_carbons/presentation/profile/child_screens/order/order_details.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloaderWidget extends StatefulWidget {
  const DownloaderWidget(
      {Key? key,
      required this.url,
      required this.fileName,
      required this.mainText,
      this.parentSnack = false})
      : super(key: key);
  final String url;
  final String fileName;
  final Widget mainText;
  final bool parentSnack;
  @override
  State<DownloaderWidget> createState() => _DownloaderWidgetState();
}

class _DownloaderWidgetState extends State<DownloaderWidget> {
  DownloadTaskData downloadTaskData = DownloadTaskData(
      downloadTaskStatus: DownloadTaskStatus.undefined, taskId: '');
  String link = "https://www.africau.edu/images/default/sample.pdf";
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    _bindBackgroundIsolate();
    // FlutterDownloader.registerCallback(downloadCallback, step: 1);
    super.initState();
  }

  ReceivePort receivePort = ReceivePort();

  dynamic taskId;

  void _downloadFile(String url, String fileName) async {
    if (url.isEmpty) {
      return;
    }
    final permission = await _checkPermission();

    if (permission) {
      final localPath = (await _findLocalPath());
      print(localPath.toString());
      final id = await FlutterDownloader.enqueue(
          fileName: "$fileName.pdf",
          url: url,
          savedDir: localPath,
          openFileFromNotification: true,
          saveInPublicStorage: true);

      print('${id}  **id');
      taskId = id;
    } else {}
  }

  Future<bool> _checkPermission() async {
    if (Platform.isIOS) {
      return true;
    }

    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;
    if (Platform.isAndroid && androidInfo.version.sdkInt! <= 28) {
      //print("29");
      final status = await Permission.storage.status;
      if (status != PermissionStatus.granted) {
        final result = await Permission.storage.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  Future<String> _findLocalPath() async {
    String? externalStorageDirPath;
    if (Platform.isAndroid) {
      try {
        externalStorageDirPath = await AndroidPathProvider.downloadsPath;
      } catch (e) {
        final directory = await getExternalStorageDirectory();
        externalStorageDirPath = directory?.path;
      }
    } else if (Platform.isIOS) {
      externalStorageDirPath =
          (await getApplicationDocumentsDirectory()).absolute.path;
      print(externalStorageDirPath);
    }
    return '$externalStorageDirPath' ?? '';
  }

  void _bindBackgroundIsolate() {
    final isSuccess = IsolateNameServer.registerPortWithName(
      receivePort.sendPort,
      'downloader_send_port',
    );
    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    }
    receivePort.listen((dynamic data) async {
      final taskId = data[0] as String;
      final status = data[1] as DownloadTaskStatus;
      final progressL = data[2] as int;
      print("sttt  $status");
      setState(() {
        downloadTaskData = DownloadTaskData(
            downloadTaskStatus: status, taskId: taskId, progress: progressL);
      });

      if (status == DownloadTaskStatus.complete && taskId.isNotEmpty) {
        Future.delayed(const Duration(seconds: 2), () {
          FlutterDownloader.open(taskId: taskId).then((success) {
            if (!success) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Cannot open this file')));
            }
          });
        });
        FlutterDownloader.open(taskId: taskId);
      }

      print(
        'Callback on UI isolate: '
        'task ($taskId) is in status ($status) and process (${downloadTaskData.progress})',
      );
    });
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    print(" from calb ${id}");
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send?.send([id, status, progress]);
  }

  @override
  void dispose() {
    _unbindBackgroundIsolate();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (downloadTaskData.downloadTaskStatus ==
            DownloadTaskStatus.complete) {
          try {
            FlutterDownloader.open(taskId: downloadTaskData.taskId);
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Cannot open this file')));
          }

          return;
        }
        if (downloadTaskData.downloadTaskStatus == DownloadTaskStatus.running ||
            downloadTaskData.downloadTaskStatus ==
                DownloadTaskStatus.enqueued) {
          return;
        }
        if (widget.url.isEmpty) {
          if (widget.parentSnack) {
            return;
          }
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Cannot download this file')));
          return;
        }
        _downloadFile(widget.url, widget.fileName);
      },
      child: Row(
        children: [
          downloadTaskData.progress == 100
              ? Text(
                  "Open",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: AppColors.redAccent1),
                )
              : downloadTaskData.downloadTaskStatus ==
                          DownloadTaskStatus.running ||
                      downloadTaskData.downloadTaskStatus ==
                          DownloadTaskStatus.enqueued
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${downloadTaskData.progress}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(color: AppColors.redAccent1),
                        ),
                        const CupertinoActivityIndicator()
                      ],
                    )
                  : widget.mainText,
        ],
      ),
    );
  }
}
