//
// bool loading = false;
// double progress = 0;
// Dio dio = Dio();
// Future<bool> saveVideo(String url, String fileName) async {
//   Directory directory;
//   try {
//     if (Platform.isAndroid) {
//       if (await _requestPermission(Permission.storage)) {
//         directory = (await getExternalStorageDirectory())!;
//         String newPath = "";
//         //print(directory);
//         List<String> paths = directory.path.split("/");
//         for (int x = 1; x < paths.length; x++) {
//           String folder = paths[x];
//           if (folder != "Android") {
//             newPath += "/$folder";
//           } else {
//             break;
//           }
//         }
//         newPath = "$newPath/RPSApp";
//         directory = Directory(newPath);
//       } else {
//         return false;
//       }
//     } else {
//       if (await _requestPermission(Permission.photos)) {
//         directory = await getTemporaryDirectory();
//       } else {
//         final status = await  Permission.photos.request();
//         if(status == PermissionStatus.granted){
//           return true;
//         }
//         return false;
//       }
//     }
//     File saveFile = File("${directory.path}/$fileName");
//     if (!await directory.exists()) {
//       await directory.create(recursive: true);
//     }
//     if (await directory.exists()) {
//       await dio.download(url, saveFile.path,
//           onReceiveProgress: (value1, value2) {
//             //print("object");
//             setState(() {
//               progress = value1 / value2;
//             });
//           });
//       if (Platform.isIOS) {
//         await ImageGallerySaver.saveFile(saveFile.path,
//             isReturnPathOfIOS: true);
//       }
//       return true;
//     }
//     return false;
//   } catch (e) {
//     //print(e);
//     return false;
//   }
// }
//
// Future<bool> _requestPermission(Permission permission) async {
//   if (await permission.isGranted) {
//     return true;
//   } else {
//     var result = await permission.request();
//     if (result == PermissionStatus.granted) {
//       return true;
//     }
//   }
//   return false;
// }
//
// downloadFile() async {
//   setState(() {
//     loading = true;
//     progress = 0;
//   });
//   bool downloaded = await saveVideo(
//       "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4",
//       "video.mp4");
//   if (downloaded) {
//     //print("File Downloaded");
//   } else {
//     //print("Problem Downloading File");
//   }
//   setState(() {
//     loading = false;
//   });
// }
//
//
