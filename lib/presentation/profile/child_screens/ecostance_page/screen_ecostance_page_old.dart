// import 'dart:io';

// import 'package:country_codes/country_codes.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:net_carbons/app/utils/enums.dart';
// import 'package:net_carbons/data/user_profile/ecostance_page/my_page/MyPageResponse.dart';
// import 'package:net_carbons/data/user_profile/ecostance_page/previous/PreviousResponse.dart';
// import 'package:net_carbons/data/user_profile/ecostance_page/slug/MeResponse.dart';
// import 'package:net_carbons/data/user_profile/ecostance_page/template.dart';
// import 'package:net_carbons/presentation/profile/bloc/ecostange_page/previous/ecostance_previous_event.dart';
// import 'package:net_carbons/presentation/profile/bloc/ecostange_page/previous/ecostance_previous_state.dart';
// import 'package:net_carbons/presentation/profile/bloc/ecostange_page/settings/ecostance_settings_bloc.dart';
// import 'package:net_carbons/presentation/profile/bloc/ecostange_page/settings/ecostance_settings_event.dart';
// import 'package:net_carbons/presentation/profile/bloc/ecostange_page/settings/ecostance_settings_state.dart';
// import 'package:net_carbons/presentation/resources/assets.dart';
// import 'package:net_carbons/presentation/resources/ui_widgets/top_wave.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'package:toggle_switch/toggle_switch.dart';
// import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svgManager;
// import 'package:url_launcher/url_launcher.dart';
// import '../../../../app/app_controller/app_controller_bloc.dart';
// import '../../../../app/constants/a2_a3.dart';
// import '../../../../app/constants/svg_flags.dart';
// import '../../../../app/dependency.dart';
// import '../../../../app/utils/image_utils.dart';
// import '../../../../data/core/network/dio.dart';
// import '../../../../domain/countries/model/country_modal.dart';
// import '../../../app_widgets/outlined_button.dart';
// import '../../../app_widgets/text_input_field.dart';
// import '../../../resources/color.dart';
// import '../../bloc/ecostange_page/me/ecostance_page_bloc.dart';
// import '../../bloc/ecostange_page/me/ecostance_page_event.dart';
// import '../../bloc/ecostange_page/me/ecostance_page_state.dart';
// import '../../bloc/ecostange_page/previous/ecostance_previous_bloc.dart';
// import '../my_profile/screen_my_profile.dart';
// import 'package:flutter/services.dart';

// class ScreenEcostancePage extends StatefulWidget {
//   const ScreenEcostancePage({Key? key}) : super(key: key);

//   @override
//   ScreenEcostancePageState createState() => ScreenEcostancePageState();
// }

// class ScreenEcostancePageState extends State<ScreenEcostancePage> {
//   final dio = getIt<DioManager>();
//   final TextEditingController ecoStancePageController = TextEditingController();
//   final TextEditingController referralLinkController = TextEditingController();
//   final TextEditingController headingController = TextEditingController();
//   final TextEditingController descController = TextEditingController();
//   final TextEditingController aboutController = TextEditingController();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController twitterController = TextEditingController();
//   final TextEditingController linkedInController = TextEditingController();
//   final TextEditingController instagramController = TextEditingController();
//   final TextEditingController facebookController = TextEditingController();
//   int myIndex = 0;
//   String displayValue = 'EcoStance';
//   String slug = '';
//   String refId = '';
//   bool isPublic = false;
//   bool showName = false;
//   bool showPhone = false;
//   bool showEmail = false;
//   bool showTwitter = false;
//   bool showLinkedin = false;
//   bool showInstagram = false;
//   bool showFacebook = false;
//   bool _value = false;
//   bool isEditing = true;
//   bool isPrevious = false;
//   bool isEditClicked = false;
//   CountryModal? selectedCountry;
//   CountryModal? selectedCountryLocal;
//   bool firstRun = true;
//   bool loading = false;
//   XFile? selectedImage;
//   String? existingImageUrl;
//   List<Template> templateList = [];
//   int selectedIndex = -1;

//   // MeResponse? _meResponse;
//   // MyPageResponse? _myPageResponse;
//   PreviousResponse? _previousResponse;

//   ScrollController scrollController = ScrollController();

//   final Map<String, GlobalKey<FormState>> formKey = {
//     "ecoStancePageKey": GlobalKey<FormState>(),
//     "referralLinkKey": GlobalKey<FormState>(),
//     "headingKey": GlobalKey<FormState>(),
//     "descriptionKey": GlobalKey<FormState>(),
//     "aboutKey": GlobalKey<FormState>(),
//     "nameKey": GlobalKey<FormState>(),
//   };
//   final Map<String, FocusNode> nodes = {
//     "ecoStancePageKey": FocusNode(),
//     "referralLinkKey": FocusNode(),
//     "headingKey": FocusNode(),
//     "descriptionKey": FocusNode(),
//     "aboutKey": FocusNode(),
//     "nameKey": FocusNode(),
//   };

//   String defaultAboutUs =
//       'This is a paragraph about us. We are a family of five, living in Miami, Florida We are interested in playing our part in saving the environment and our planet. Living in a city that is on the front line of climate change gives us a front row-seat to the impending loom. Often during high tides or occasional torrential rains, we are inundated with a flooded downtown where spotting a fish is commonplace. We are not waiting for 2030 or 2050 for NetZero. Yes the government and businesses have to play their part, but we as individuals can make a much bigger difference. If you can spread the word, that now there is a way, we have a chance.The world you and I have inherited is not just ours, but we are mere beneficiaries of its wonders. It is our responsibility to take care of it so that we can pass it on to our future.';
//   String defaultDesc =
//       'We are reducing our greenhouse gas emissions everyday by wasting less, buying green, saving energy and by being conscientious consumers. But we can make only limited lifestyle changes. For our remaining emissions, we are buying carbon offsets to have a zero emission footprint. Each carbon offset we purchase goes into certified projects like planting new trees, reforestation, methane sequestration, ocean cleanup, and other such initiatives that help combat climate change today. We decided not to wait and do something today.';
//   String defaultTitle = 'We are doing our part in combating climate change';
//   String defaultTheme = 'blue';
//   String selectedTheme = 'blue';

//   @override
//   void initState() {
//     init();
//     setTemplateData();
//     context.read<EcostancePageBloc>().add(MeResponseFetched());
//     context.read<EcostanceSettingsBloc>().add(MyPageResponseFetched());
//     super.initState();
//   }

//   void setTemplateData() {
//     templateList = [];
//     templateList.add(Template(
//         id: 0,
//         displayName: "Blue",
//         name: "blue",
//         link:
//             "https://ecostance.marketsverse.com/assets/images/sustainability/sky.png"));
//     templateList.add(Template(
//         id: 1,
//         displayName: "Gray",
//         name: "gray",
//         link:
//             "https://ecostance.marketsverse.com/assets/images/sustainability/gray.png"));
//     templateList.add(Template(
//         id: 2,
//         displayName: "White",
//         name: "white",
//         link:
//             "https://ecostance.marketsverse.com/assets/images/sustainability/white.png"));
//     templateList.add(Template(
//         id: 3,
//         displayName: "Green",
//         name: "green",
//         link:
//             "https://ecostance.marketsverse.com/assets/images/sustainability/green.png"));
//     templateList.add(Template(
//         id: 4,
//         displayName: "Beige",
//         name: "beige",
//         link:
//             "https://ecostance.marketsverse.com/assets/images/sustainability/beige.png"));
//     templateList.add(Template(
//         id: 5,
//         displayName: "Pink",
//         name: "pink",
//         link:
//             "https://ecostance.marketsverse.com/assets/images/sustainability/pink.png"));

//     selectedIndex =
//         templateList.indexWhere((item) => item.name == selectedTheme);
//     if (selectedIndex != -1) {
//       templateList[selectedIndex].isChecked =
//           true; // Set the checked state of the selected item
//     }
//   }

//   void init() async {
//     final locale = CountryCodes.getDeviceLocale();
//     final CountryDetails details = CountryCodes.detailsForLocale(locale);
//     final alpha3code =
//         countryCodesConvertA2ToA3(a2Code: details.alpha2Code ?? '');
//     final CountryModal countryModal = CountryModal(
//         id: '',
//         entity: details.localizedName ?? "",
//         countryCode: alpha3code ?? "USA",
//         currencyName: '',
//         currencyCode: '',
//         numericCode: '',
//         minorUnit: '',
//         carbonCountryCode: '',
//         carbonCountryPerCapita: '',
//         phonePrefix: details.dialCode ?? "",
//         status: '',
//         show: '',
//         createdAt: DateTime.now(),
//         updatedAt: DateTime.now(),
//         v: 0,
//         isCurrencySupported: false);

//     selectedCountryLocal = countryModal;
//   }

//   bool convertStringToBool(String value) {
//     return value.toLowerCase() == "true";
//   }

//   Future<void> saveApiCall(BuildContext context) async {
//     selectedTheme = templateList[selectedIndex].name;
//     //selectedIndex = templateList[selectedIndex].id;

//     try {
//       //  final apiResp = await dio.get('/v1/sustainability-page-settings/previous');
//       final data = {
//         'number': phoneController.text,
//         "countryCode": selectedCountry!.countryCode,
//         'numericCode': "+${selectedCountry!.phonePrefix}",
//         "name": nameController.text,
//         "showName": showName,
//         "email": emailController.text,
//         "showEmail": showEmail,
//         "showPhone": showPhone,
//         "twitter": twitterController.text,
//         "showTwitter": showTwitter,
//         "facebook": facebookController.text,
//         "showFacebook": showFacebook,
//         "linkedin": linkedInController.text,
//         "showLinkedin": showLinkedin,
//         "instagram": instagramController.text,
//         "showInstagram": showInstagram,
//         "country": selectedCountry!.entity,
//         "aboutUs": aboutController.text,
//         "description": descController.text,
//         "title": headingController.text,
//         "profilePicURL": "",
//         "isPublic": isPublic,
//         "themeSelected": selectedTheme,
//         "isChecked": selectedIndex,
//       };
//       print("save --> $data");
//       FormData formData = FormData.fromMap(data);
//       final resp = await dio.patch('/v1/sustainability-page-settings',
//           formData: formData);

//       if (resp.statusCode == 200) {
//         //  print("save success --> ");
//         isEditing = true;
//         isEditClicked = !isEditClicked;
//         // _previousResponse = PreviousResponse.fromJson(resp.data);
//         context.read<EcostancePageBloc>().add(MeResponseFetched());
//         context.read<EcostanceSettingsBloc>().add(MyPageResponseFetched());
//         setState(() {});
//       } else {
//         //   print("Server Error");
//       }
//     } on SocketException catch (e) {
//       //  print("Internet connection failed");
//     } on DioError catch (e) {
//       //  print("Something went wrong. Please try again later.");
//     } catch (e) {
//       print("Server Error, Something went wrong. Please try again later. " +
//           e.toString());
//     }
//   }

//   Future<void> defaultApiCall(BuildContext context) async {
//     print("$loading");
//     try {
//       final data = {
//         'number': phoneController.text,
//         "countryCode": selectedCountry!.countryCode,
//         'numericCode': "+${selectedCountry!.phonePrefix}",
//         "name": nameController.text,
//         "showName": showName,
//         "email": emailController.text,
//         "showEmail": false,
//         "showPhone": false,
//         "twitter": "",
//         "showTwitter": false,
//         "facebook": "",
//         "showFacebook": false,
//         "linkedin": "",
//         "showLinkedin": false,
//         "instagram": "",
//         "showInstagram": false,
//         "country": selectedCountry!.entity,
//         "aboutUs": defaultAboutUs,
//         "description": defaultDesc,
//         "title": defaultTitle,
//         "profilePicURL": "",
//         "isPublic": false,
//         "themeSelected": defaultTheme,
//       };
//       print("default --> $data");
//       FormData formData = FormData.fromMap(data);
//       final resp = await dio.patch('/v1/sustainability-page-settings',
//           formData: formData);

//       if (resp.statusCode == 200) {
//         loading = false;
//         print("$loading");
//         print("default success --> ");
//         // _previousResponse = PreviousResponse.fromJson(resp.data);
//         context.read<EcostancePageBloc>().add(MeResponseFetched());
//         context.read<EcostanceSettingsBloc>().add(MyPageResponseFetched());
//         setState(() {});
//       } else {
//         loading = false;
//         print("$loading");
//         print("Server Error");
//       }
//     } on SocketException catch (e) {
//       print("Internet connection failed");
//     } on DioError catch (e) {
//       print("Something went wrong. Please try again later.");
//     } catch (e) {
//       print("Server Error, Something went wrong. Please try again later. " +
//           e.toString());
//     }
//   }

//   Future<void> publishApiCall(BuildContext context) async {
//     selectedTheme = templateList[selectedIndex].name;
//     try {
//       // final resp = await dio.get('/v1/sustainability-page-settings/previous');
//       final data = {
//         'number': phoneController.text,
//         "countryCode": selectedCountry!.countryCode,
//         'numericCode': "+${selectedCountry!.phonePrefix}",
//         "name": nameController.text,
//         "showName": showName,
//         "email": emailController.text,
//         "showEmail": showEmail,
//         "showPhone": showPhone,
//         "twitter": twitterController.text,
//         "showTwitter": showTwitter,
//         "facebook": facebookController.text,
//         "showFacebook": showFacebook,
//         "linkedin": linkedInController.text,
//         "showLinkedin": showLinkedin,
//         "instagram": instagramController.text,
//         "showInstagram": showInstagram,
//         "country": selectedCountry!.entity,
//         "aboutUs": aboutController.text,
//         "description": descController.text,
//         "title": headingController.text,
//         "profilePicURL": "",
//         "isPublic": isPublic,
//         "themeSelected": selectedTheme,
//         "isChecked": selectedIndex
//       };
//       print("publish --> $data");
//       isEditing = true;
//       isEditClicked = !isEditClicked;
//       FormData formData = FormData.fromMap(data);
//       final resp = await dio.patch('/v1/sustainability-page-settings/publish',
//           formData: formData);

//       if (resp.statusCode == 200) {
//         print("save success --> ");
//         // _previousResponse = PreviousResponse.fromJson(resp.data);
//         context.read<EcostancePageBloc>().add(MeResponseFetched());
//         context.read<EcostanceSettingsBloc>().add(MyPageResponseFetched());
//         setState(() {});
//       } else {
//         print("Server Error");
//       }
//     } on SocketException catch (e) {
//       print("Internet connection failed");
//     } on DioException catch (e) {
//       print("Something went wrong. Please try again later.");
//     } catch (e) {
//       print("Server Error, Something went wrong. Please try again later. " +
//           e.toString());
//     }
//   }

//   void showCustomDialog(BuildContext context, String message) {
//     showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (BuildContext cxt) {
//         return Center(
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Material(
//               color: Colors.white,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(4)),
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Row(
//                       children: [
//                         const Expanded(
//                           child: Text(
//                             "",
//                             style: TextStyle(
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         InkWell(
//                             onTap: () {
//                               Navigator.of(context).pop();
//                             },
//                             child: const Icon(Icons.close_rounded)),
//                       ],
//                     ),
//                     Image.asset(
//                       ImageAssets.popupFlamingo,
//                       width: 120,
//                       height: 120,
//                     ),
//                     const SizedBox(
//                       height: 12,
//                     ),
//                     Text(
//                       "Are you Sure?",
//                       style: Theme.of(context).textTheme.titleMedium,
//                     ),
//                     const SizedBox(
//                       height: 6,
//                     ),
//                     Text(
//                       "All your edits will be lost",
//                       style: Theme.of(context).textTheme.bodyText2,
//                     ),
//                     const SizedBox(height: 16),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           width: 90,
//                           height: 45,
//                           child: AppButton2(
//                             isLoading: false,
//                             filled: true,
//                             onTap: () async {
//                               if (message == "previous") {
//                                 isPrevious = true;
//                                 context
//                                     .read<EcostancePreviousBloc>()
//                                     .add(PreviousResponseFetched());
//                                 // isEditing = true;
//                                 // isEditClicked = !isEditClicked;
//                                 Navigator.of(context).pop();
//                                 // isPrevious = false;
//                                 setState(() {});
//                               } else {
//                                 // loading = true;
//                                 // defaultApiCall(context);
//                                 // isEditing = true;
//                                 // isEditClicked = !isEditClicked;
//                                 aboutController.text = defaultAboutUs;
//                                 headingController.text = defaultTitle;
//                                 descController.text = defaultDesc;
//                                 Navigator.of(context).pop();
//                               }
//                             },
//                             text: Text(
//                               "Yes",
//                               style: Theme.of(context).textTheme.headline2,
//                             ),
//                             feedbackTimeText: Text(
//                               "Yes",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headline2
//                                   ?.copyWith(
//                                       color: AppColors.primaryActiveColor),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 24,
//                         ),
//                         SizedBox(
//                           width: 90,
//                           height: 45,
//                           child: AppButton2(
//                             isLoading: false,
//                             filled: false,
//                             onTap: () async {
//                               Navigator.of(context).pop();
//                             },
//                             text: Text(
//                               "No",
//                               style: Theme.of(context).textTheme.headline5,
//                             ),
//                             feedbackTimeText: Text(
//                               "No",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headline2
//                                   ?.copyWith(
//                                       color: AppColors.primaryActiveColor),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Future<void> _launchUrl(Uri uri) async {
//     if (!await launchUrl(uri)) {
//       throw Exception('Could not launch $uri');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     print(build);
//     return Scaffold(
//       appBar: buildAppAppBar(() {
//         Navigator.pop(context);
//       },
//           bottom: PreferredSize(
//               preferredSize: Size.fromHeight(80.h),
//               child: Container(
//                 color: AppColors.primaryInactive,
//                 height: 41.h,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 16.0),
//                       child: Text(
//                         "My EcoStance Page",
//                         // textAlign: TextAlign.center,
//                         style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                             fontWeight: FontWeight.w600,
//                             letterSpacing: .5,
//                             fontSize: 16,
//                             color: AppColors.primaryActiveColor),
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         Visibility(
//                           visible: isEditing,
//                           child: InkWell(
//                             onTap: () {
//                               setState(() {
//                                 isEditing = false;
//                                 isEditClicked = !isEditClicked;
//                               });
//                             },
//                             child: const Padding(
//                               padding: EdgeInsets.only(right: 16.0),
//                               child: Icon(Icons.edit),
//                             ),
//                           ),
//                         ),
//                         Visibility(
//                           visible: !isEditing,
//                           child: PopupMenuButton(
//                             onSelected: (value) {
//                               _onMenuItemSelected(value as int);
//                             },
//                             offset: const Offset(0.0, 56),
//                             shape: const RoundedRectangleBorder(
//                               borderRadius: BorderRadius.only(
//                                 bottomLeft: Radius.circular(8.0),
//                                 bottomRight: Radius.circular(8.0),
//                                 topLeft: Radius.circular(8.0),
//                                 topRight: Radius.circular(8.0),
//                               ),
//                             ),
//                             itemBuilder: (ctx) => [
//                               _buildPopupMenuItem('Cancel', Icons.cancel, 0),
//                               _buildPopupMenuItem('Default', Icons.refresh, 1),
//                               _buildPopupMenuItem(
//                                   'Previous', Icons.skip_previous, 2),
//                               _buildPopupMenuItem(
//                                   'Preview', Icons.remove_red_eye_rounded, 3),
//                               _buildPopupMenuItem('Publish', Icons.publish, 4),
//                               _buildPopupMenuItem('Save', Icons.save_alt, 5),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     // const SizedBox(width: 1,),
//                   ],
//                 ),
//               ))),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 30,
//               ),
//               isEditClicked ? _ecoStanceEditPage() : _ecoStancePage(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _ecoStancePage() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           isPrevious ? _content("previous") : _content("get"),
//           _template(false),
//           _contactInfo()
//         ],
//       ),
//     );
//   }

//   Widget _ecoStanceEditPage() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           isPrevious ? _contentEdit("previous") : _contentEdit("get"),
//           _template(true),
//           _contactInfoEdit()
//         ],
//       ),
//     );
//   }

//   Widget buildSwitchWithLabels(
//       BuildContext context, bool value, Function(bool) onChanged) {
//     return Row(
//       children: [
//         Text(
//           "Off",
//           style: Theme.of(context).textTheme.bodyMedium,
//         ),
//         const SizedBox(
//           width: 16,
//         ),
//         CupertinoSwitch(
//           value: value,
//           onChanged: onChanged,
//           activeColor: AppColors.greenBtn,
//           trackColor: AppColors.lightGrey,
//         ),
//         const SizedBox(
//           width: 16,
//         ),
//         Text(
//           "On",
//           style: Theme.of(context).textTheme.bodyMedium,
//         ),
//       ],
//     );
//   }

//   Widget _content(String content) {
//     return content == "get"
//         ? BlocBuilder<EcostanceSettingsBloc, EcostanceSettingsState>(
//             builder: (context, state) {
//               switch (state.status) {
//                 case ApiStatus.loading:
//                   return const Center(child: CupertinoActivityIndicator());
//                 case ApiStatus.failure:
//                   return Center(child: Text(state.message.toString()));
//                 case ApiStatus.success:
//                   print("get");
//                   headingController.text = state.response!.data!.draft!.title!;
//                   descController.text =
//                       state.response!.data!.draft!.description!;
//                   aboutController.text = state.response!.data!.draft!.aboutUs!;
//                   nameController.text = state.response!.data!.draft!.name!;
//                   selectedTheme = state.response!.data!.draft!.themeSelected!;
//                   setTemplateData();
//                   return _buildContentWidgets(context, state.response!.data!);
//               }
//             },
//           )
//         : BlocBuilder<EcostancePreviousBloc, EcostancePreviousState>(
//             builder: (context, state) {
//               switch (state.status) {
//                 case ApiStatus.loading:
//                   return const Center(child: CupertinoActivityIndicator());
//                 case ApiStatus.failure:
//                   return Center(child: Text(state.message.toString()));
//                 case ApiStatus.success:
//                   print("previous");
//                   isPrevious = false;
//                   headingController.text = state.response!.data!.title!;
//                   descController.text = state.response!.data!.description!;
//                   aboutController.text = state.response!.data!.aboutUs!;
//                   nameController.text = state.response!.data!.name!;
//                   selectedTheme = state.response!.data!.themeSelected!;
//                   return _buildContentWidgets(context, state.response!.data!);
//               }
//             },
//           );
//   }

//   Widget _buildContentWidgets(BuildContext context, dynamic data) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Publish Status:",
//           style: Theme.of(context).textTheme.subtitle1,
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         buildSwitchWithLabels(context, data!.isPublic!, (value) {
//           setState(() {
//             isPublic = value;
//           });
//         }),
//         const SizedBox(
//           height: 32,
//         ),
//         Row(
//           children: [
//             Text(
//               "EcoStance Page:",
//               style: Theme.of(context).textTheme.subtitle1,
//             ),
//             const SizedBox(
//               width: 16,
//             ),
//             // const Icon(
//             //   Icons.info_outline,
//             //   color: Colors.grey,
//             // ),
//             // const SizedBox(
//             //   width: 8,
//             // ),
//             // const Icon(Icons.copy, color: Colors.grey),
//             // const SizedBox(
//             //   width: 8,
//             // ),
//             // const Icon(Icons.qr_code_2, color: Colors.grey),
//             IconButton(
//               icon: const Icon(Icons.info_outline, color: Colors.grey),
//               onPressed: () {
//                 // Show pop-up dialog with some text
//                 showDialog(
//                   context: context,
//                   builder: (context) => AlertDialog(
//                     // title: Text('Information'),
//                     content: const Text(
//                         'This is your EcoStance Page web site link that can be advertised by you and/or your company on your own web site, your social media profiles, your social media posts, so that your friends and customers can access this link directly from anywhere'),
//                     actions: [
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: const Text('OK'),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//             const SizedBox(width: 8),
//             IconButton(
//               icon: const Icon(Icons.copy, color: Colors.grey),
//               onPressed: () {
//                 // Copy text to clipboard
//                 Clipboard.setData(const ClipboardData(text: 'Text to copy'));
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(
//                     content: Text('Text copied to clipboard'),
//                   ),
//                 );
//               },
//             ),
//             const SizedBox(width: 8),
//             IconButton(
//               icon: const Icon(Icons.qr_code_2, color: Colors.grey),
//               onPressed: () {
//                 // Show pop-up dialog with QR code
//                 showDialog(
//                   context: context,
//                   builder: (context) => AlertDialog(
//                     // title: Text('QR Code'),
//                     content: SizedBox(
//                       width: 200,
//                       height: 200,
//                       child: Center(
//                         child: QrImageView(
//                           data: 'https://ecostance.marketsverse.com/c/$slug',
//                           version: QrVersions.auto,
//                           backgroundColor: Colors.white,
//                         ),
//                       ),
//                     ),
//                     actions: [
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: const Text('Close'),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         BlocBuilder<EcostancePageBloc, EcostancePageState>(
//           builder: (context, state) {
//             switch (state.status) {
//               case ApiStatus.loading:
//                 return const Center(child: CupertinoActivityIndicator());
//               case ApiStatus.failure:
//                 return Center(child: Text(state.message.toString()));
//               case ApiStatus.success:
//                 slug = state.response!.slug!.slug!;
//                 ecoStancePageController.text =
//                     "https://ecostance.marketsverse.com/c/${slug}";
//                 referralLinkController.text =
//                     "https://ecostance.marketsverse.com?refId=${state.response!.data!.id}";
//                 return Column(
//                   children: [
//                     Container(
//                       width: double.infinity,
//                       color: AppColors.primaryInactive,
//                       padding: const EdgeInsets.all(6),
//                       child: Text(
//                         "https://ecostance.marketsverse.com/c/${slug}",
//                         style: Theme.of(context).textTheme.bodyMedium,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 32,
//                     ),
//                     Row(
//                       children: [
//                         Text(
//                           "Referral Link:",
//                           style: Theme.of(context).textTheme.titleMedium,
//                         ),
//                         const SizedBox(
//                           width: 16,
//                         ),
//                         IconButton(
//                           icon: const Icon(Icons.copy, color: Colors.grey),
//                           onPressed: () {
//                             // Copy text to clipboard
//                             Clipboard.setData(ClipboardData(
//                                 text:
//                                     'https://ecostance.marketsverse.com/?refId=${state.response!.data!.id}'));
//                             // Clipboard.setData(ClipboardData(text: 'https://play.google.com/store/apps/details?id=com.ecostance.ecostance'));
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text('Text copied to clipboard'),
//                               ),
//                             );
//                           },
//                         )
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 8,
//                     ),
//                     Container(
//                       width: double.infinity,
//                       color: AppColors.primaryInactive,
//                       padding: const EdgeInsets.all(6),
//                       child: Text(
//                         "https://ecostance.marketsverse.com?refId=${state.response!.data!.id}",
//                         style: Theme.of(context).textTheme.bodyText2,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 32,
//                     ),
//                   ],
//                 );
//             }
//           },
//         ),
//         Text(
//           "Heading:",
//           style: Theme.of(context).textTheme.subtitle1,
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         Text(
//           data!.draft!.title!,
//           style: Theme.of(context).textTheme.bodyText2,
//         ),
//         const SizedBox(
//           height: 32,
//         ),
//         Text(
//           "Description:",
//           style: Theme.of(context).textTheme.subtitle1,
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         Text(
//           data!.draft!.description!,
//           style: Theme.of(context).textTheme.bodyText2,
//         ),
//         const SizedBox(
//           height: 32,
//         ),
//         Text(
//           "About us:",
//           style: Theme.of(context).textTheme.subtitle1,
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         Text(
//           data!.draft!.aboutUs!,
//           style: Theme.of(context).textTheme.bodyText2,
//         ),
//         const SizedBox(
//           height: 32,
//         ),
//         Text(
//           "Country:",
//           style: Theme.of(context).textTheme.subtitle1,
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         Row(
//           children: [
//             SizedBox(
//               width: 35.w,
//               height: 23.3.h,
//               child: Image(
//                 image: svgManager.Svg(
//                   'assets/flags_svg/${flags['IND']}',
//                 ),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             SizedBox(
//               width: 13.w,
//             ),
//             Text(
//               "",
//               style: Theme.of(context).textTheme.bodyText1,
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 32,
//         ),
//         Text(
//           "Profile photo:",
//           style: Theme.of(context).textTheme.subtitle1,
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         data!.draft!.profilePicURL!.isNotEmpty
//             ? Image.network(
//                 data!.draft!.profilePicURL!,
//                 width: 100,
//                 height: 100,
//               )
//             : Image.asset(
//                 ImageAssets.userCircle,
//                 width: 100,
//                 height: 100,
//               )
//       ],
//     );
//   }

//   Widget _contentEdit(String content) {
//     return content == "get"
//         ? BlocBuilder<EcostanceSettingsBloc, EcostanceSettingsState>(
//             builder: (context, state) {
//               switch (state.status) {
//                 case ApiStatus.loading:
//                   return const Center(child: CupertinoActivityIndicator());
//                 case ApiStatus.failure:
//                   return Center(child: Text(state.message.toString()));
//                 case ApiStatus.success:
//                   print("get edit");
//                   headingController.text = state.response!.data!.draft!.title!;
//                   descController.text =
//                       state.response!.data!.draft!.description!;
//                   aboutController.text = state.response!.data!.draft!.aboutUs!;
//                   nameController.text = state.response!.data!.draft!.name!;
//                   selectedTheme = state.response!.data!.draft!.themeSelected!;
//                   //  setTemplateData();
//                   return _buildContentEditWidget(state.response!.data!);
//               }
//             },
//           )
//         : BlocBuilder<EcostancePreviousBloc, EcostancePreviousState>(
//             builder: (context, state) {
//               switch (state.status) {
//                 case ApiStatus.loading:
//                   return const Center(child: CupertinoActivityIndicator());
//                 case ApiStatus.failure:
//                   return Center(child: Text(state.message.toString()));
//                 case ApiStatus.success:
//                   print("previous edit");
//                   isPrevious = false;
//                   headingController.text = state.response!.data!.title!;
//                   descController.text = state.response!.data!.description!;
//                   aboutController.text = state.response!.data!.aboutUs!;
//                   nameController.text = state.response!.data!.name!;
//                   selectedTheme = state.response!.data!.themeSelected!;
//                   return _buildContentEditWidget(state.response!.data!);
//               }
//             },
//           );
//   }

//   Widget _buildContentEditWidget(dynamic data) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Publish Status:",
//           style: Theme.of(context).textTheme.subtitle1,
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         buildSwitchWithLabels(context, isPublic, (value) {
//           setState(() {
//             isPublic = value;
//           });
//         }),
//         const SizedBox(
//           height: 32,
//         ),
//         Row(
//           children: [
//             Text(
//               "EcoStance Page:",
//               style: Theme.of(context).textTheme.subtitle1,
//             ),
//             const SizedBox(
//               width: 16,
//             ),
//             const Icon(
//               Icons.info_outline,
//               color: Colors.grey,
//             ),
//             const SizedBox(
//               width: 8,
//             ),
//             const Icon(Icons.copy, color: Colors.grey),
//             const SizedBox(
//               width: 8,
//             ),
//             const Icon(Icons.qr_code_2, color: Colors.grey),
//           ],
//         ),
//         Form(
//           key: formKey['ecoStancePageKey'],
//           child: InputField(
//             textInputAction: TextInputAction.next,
//             onChanged: (data) =>
//                 formKey['ecoStancePageKey']?.currentState?.validate(),
//             focusNode: nodes['ecoStancePageKey'],
//             textEditingController: ecoStancePageController,
//             label: "",
//             hintText: '',
//             onFocused: () {},
//             onUnfocused: () =>
//                 formKey['ecoStancePageKey']?.currentState?.validate(),
//             validator: (val) {
//               if (val!.isEmpty) {
//                 return 'Enter a valid url';
//               }
//               return null;
//             },
//           ),
//         ),
//         const SizedBox(
//           height: 32,
//         ),
//         Row(
//           children: [
//             Text(
//               "Referral Link:",
//               style: Theme.of(context).textTheme.subtitle1,
//             ),
//             const SizedBox(
//               width: 16,
//             ),
//             const Icon(Icons.copy, color: Colors.grey),
//           ],
//         ),
//         Form(
//           key: formKey['referralLinkKey'],
//           child: InputField(
//             textInputAction: TextInputAction.next,
//             onChanged: (data) =>
//                 formKey['referralLinkKey']?.currentState?.validate(),
//             focusNode: nodes['referralLinkKey'],
//             textEditingController: referralLinkController,
//             label: "",
//             hintText: '',
//             onFocused: () {},
//             onUnfocused: () =>
//                 formKey['referralLinkKey']?.currentState?.validate(),
//             validator: (val) {
//               if (val!.isEmpty) {
//                 return 'Enter a valid link';
//               }
//               return null;
//             },
//           ),
//         ),
//         const SizedBox(
//           height: 32,
//         ),
//         Text(
//           "Heading:",
//           style: Theme.of(context).textTheme.subtitle1,
//         ),
//         Form(
//           key: formKey['headingKey'],
//           child: InputField(
//             textInputAction: TextInputAction.next,
//             onChanged: (data) =>
//                 formKey['headingKey']?.currentState?.validate(),
//             focusNode: nodes['headingKey'],
//             textEditingController: headingController,
//             label: "",
//             hintText: '',
//             onFocused: () {},
//             onUnfocused: () => formKey['headingKey']?.currentState?.validate(),
//             validator: (val) {
//               if (val!.isEmpty) {
//                 return 'Enter heading';
//               }
//               return null;
//             },
//           ),
//         ),
//         const SizedBox(
//           height: 32,
//         ),
//         Text(
//           "Description:",
//           style: Theme.of(context).textTheme.subtitle1,
//         ),
//         Form(
//           key: formKey['descriptionKey'],
//           child: InputField(
//             textInputAction: TextInputAction.next,
//             onChanged: (data) =>
//                 formKey['descriptionKey']?.currentState?.validate(),
//             focusNode: nodes['descriptionKey'],
//             textEditingController: descController,
//             label: "",
//             hintText: '',
//             onFocused: () {},
//             onUnfocused: () =>
//                 formKey['descriptionKey']?.currentState?.validate(),
//             validator: (val) {
//               if (val!.isEmpty) {
//                 return 'Enter description';
//               }
//               return null;
//             },
//             maxLines: 4,
//           ),
//         ),
//         const SizedBox(
//           height: 32,
//         ),
//         Text(
//           "About us:",
//           style: Theme.of(context).textTheme.subtitle1,
//         ),
//         Form(
//           key: formKey['aboutKey'],
//           child: InputField(
//             textInputAction: TextInputAction.next,
//             onChanged: (data) => formKey['aboutKey']?.currentState?.validate(),
//             focusNode: nodes['aboutKey'],
//             textEditingController: aboutController,
//             label: "",
//             hintText: '',
//             onFocused: () {},
//             onUnfocused: () => formKey['aboutKey']?.currentState?.validate(),
//             validator: (val) {
//               if (val!.isEmpty) {
//                 return 'Enter about us';
//               }
//               return null;
//             },
//             maxLines: 4,
//           ),
//         ),
//         const SizedBox(
//           height: 32,
//         ),
//         Text(
//           "Country:",
//           style: Theme.of(context).textTheme.subtitle1,
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         SizedBox(
//             height: 45.h,
//             child: BlocBuilder<AppControllerBloc, AppControllerState>(
//               builder: (context, state) {
//                 if (state.isLoading) {
//                   return const CupertinoActivityIndicator();
//                 }
//                 if (state.countries.isNotEmpty) {
//                   if (state.countries.isNotEmpty) {
//                     firstRun == true
//                         ? selectedCountry = state.countries.firstWhere(
//                             (element) {
//                             return element.countryCode ==
//                                 state.countryModal?.countryCode;
//                           },
//                             orElse: () => state.countries.firstWhere(
//                                 (element) =>
//                                     element.countryCode ==
//                                     selectedCountryLocal?.countryCode,
//                                 orElse: () => state.countries.firstWhere(
//                                       (element) => element.countryCode == "USD",
//                                     )))
//                         : null;
//                   }
//                   firstRun = false;
//                   return Center(
//                       child: Container(
//                           height: 45.h,
//                           decoration: BoxDecoration(
//                               border: Border.all(
//                                   color: AppColors.appGreyColor, width: .5)),
//                           padding: EdgeInsets.symmetric(horizontal: 18.w),
//                           width: double.maxFinite,
//                           child: DropdownButtonHideUnderline(
//                             child: DropdownButton<CountryModal>(
//                               icon: Center(
//                                   child: Icon(
//                                 Icons.keyboard_arrow_down,
//                                 size: 32.sp,
//                               )),
//                               hint: const Text("Or Select a Country"),
//                               value: selectedCountry,
//                               isDense: true,
//                               onChanged: (newValue) {
//                                 setState(() {
//                                   selectedCountry = newValue;
//                                   selectedCountryLocal = newValue;
//                                 });
//                               },
//                               items: state.countries.map((country) {
//                                 return DropdownMenuItem<CountryModal>(
//                                   value: country,
//                                   child: Row(
//                                     children: [
//                                       CircleAvatar(
//                                         backgroundImage: svgManager.Svg(
//                                           'assets/flags_svg/${flags[country.countryCode ?? 'USA']}',
//                                         ),
//                                         backgroundColor: Colors.transparent,
//                                         radius: 15.w,
//                                       ),
//                                       SizedBox(
//                                         width: 13.w,
//                                       ),
//                                       Text(
//                                         country.entity.length < 22
//                                             ? country.entity
//                                             : "${country.entity.substring(0, 21)}...",
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .bodyText1,
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                               }).toList(),
//                             ),
//                           )));
//                 }
//                 if (state.countries.isEmpty) {
//                   return Center(
//                       child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       ///TODO: Border design change
//                       Expanded(
//                         child: Container(
//                             decoration: BoxDecoration(
//                                 border: Border.all(
//                                     color: AppColors.lightGrey, width: 1)),
//                             height: 45.h,
//                             padding: EdgeInsets.all(8.w),
//                             width: double.maxFinite,
//                             child: Center(
//                               child: Text(
//                                 selectedCountryLocal?.entity ?? "",
//                                 textAlign: TextAlign.center,
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodyText1
//                                     ?.copyWith(
//                                         color: AppColors.lightGrey,
//                                         height: 1.2),
//                               ),
//                             )),
//                       ),

//                       TextButton(
//                         onPressed: () async {
//                           BlocProvider.of<AppControllerBloc>(context)
//                               .add(const AppControllerEvent.fetchCountries());
//                         },
//                         child: const Text('Retry'),
//                       ),
//                     ],
//                   ));
//                 }
//                 return Container();
//               },
//             )),
//         const SizedBox(
//           height: 32,
//         ),
//         Text(
//           "Profile photo:",
//           style: Theme.of(context).textTheme.subtitle1,
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         GestureDetector(
//           onTap: () async {
//             await _selectImage(context).then((value) async {
//               if (value != null) {
//                 final image = await ImageUtils.cropImage(value.path);
//                 if (image != null) {
//                   setState(() {
//                     selectedImage = image;
//                     existingImageUrl = null;
//                   });
//                 }
//               }
//             });
//           },
//           child: SizedBox(
//             height: 100.h,
//             width: 100.h,
//             child: ImagePlaceHolder(
//               image: selectedImage,
//               existingImage: existingImageUrl,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _template(bool isEdit) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(
//           height: 60,
//         ),
//         Align(
//           alignment: Alignment.center,
//           child: Text(
//             "Select a Template",
//             style: Theme.of(context).textTheme.titleLarge,
//           ),
//         ),
//         const SizedBox(
//           height: 30,
//         ),
//         SizedBox(
//           height: 300,
//           child: ListView.builder(
//             itemCount: templateList.length,
//             shrinkWrap: true,
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (context, index) {
//               final isSelected = selectedIndex == index;
//               return Column(
//                 children: [
//                   Image.network(
//                     templateList[index].link,
//                     width: 200,
//                     height: 200,
//                   ),
//                   const SizedBox(
//                     height: 16,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       if (isEdit) {
//                         setState(() {
//                           if (isSelected) {
//                             // If the same item is tapped again, uncheck it
//                             templateList[index].isChecked = false;
//                             selectedIndex = -1; // No item is selected
//                           } else {
//                             // Uncheck all items
//                             for (var item in templateList) {
//                               item.isChecked = false;
//                             }
//                             // Check the current item
//                             templateList[index].isChecked = true;
//                             selectedIndex = index;
//                           }
//                         });
//                       } else {
//                         selectedIndex = index;
//                       }
//                     },
//                     child: Container(
//                       width: 24,
//                       height: 24,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: isSelected
//                             ? AppColors.appleGreen
//                             : Colors.transparent,
//                         border: Border.all(color: AppColors.appleGreen),
//                       ),
//                       child: templateList[index].isChecked
//                           ? const Icon(Icons.check,
//                               color: Colors.white, size: 16)
//                           : null,
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         )
//       ],
//     );
//   }

//   Widget _contactInfo() {
//     return BlocBuilder<EcostanceSettingsBloc, EcostanceSettingsState>(
//         builder: (context, state) {
//       switch (state.status) {
//         case ApiStatus.loading:
//           return const Center(child: CupertinoActivityIndicator());
//         case ApiStatus.failure:
//           return Center(child: Text(state.message.toString()));
//         case ApiStatus.success:
//           showName =
//               convertStringToBool(state.response!.data!.draft!.showName!);
//           showPhone =
//               convertStringToBool(state.response!.data!.draft!.showPhone!);
//           showEmail =
//               convertStringToBool(state.response!.data!.draft!.showEmail!);
//           showTwitter =
//               convertStringToBool(state.response!.data!.draft!.showTwitter!);
//           showLinkedin =
//               convertStringToBool(state.response!.data!.draft!.showLinkedin!);
//           showInstagram =
//               convertStringToBool(state.response!.data!.draft!.showInstagram!);
//           showFacebook =
//               convertStringToBool(state.response!.data!.draft!.showFacebook!);

//           nameController.text = state.response!.data!.draft!.name!;
//           phoneController.text = state.response!.data!.draft!.phone!.number!;
//           emailController.text = state.response!.data!.draft!.email!;
//           twitterController.text = state.response!.data!.draft!.twitter!;
//           linkedInController.text = state.response!.data!.draft!.linkedin!;
//           instagramController.text = state.response!.data!.draft!.instagram!;
//           facebookController.text = state.response!.data!.draft!.facebook!;

//           return Column(
//             children: [
//               const SizedBox(
//                 height: 12,
//               ),
//               Align(
//                 alignment: Alignment.center,
//                 child: Text(
//                   "Contact Info (optional)",
//                   style: Theme.of(context).textTheme.titleLarge,
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Name:",
//                           style: Theme.of(context).textTheme.titleMedium,
//                         ),
//                         const SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           state.response!.data!.draft!.name!,
//                           style: Theme.of(context).textTheme.bodyMedium,
//                         ),
//                       ],
//                     ),
//                   ),
//                   buildSwitchWithLabels(context, showName, (value) {
//                     setState(() {
//                       showName = value;
//                     });
//                   }),
//                 ],
//               ),
//               const SizedBox(
//                 height: 32,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Phone:",
//                           style: Theme.of(context).textTheme.subtitle1,
//                         ),
//                         const SizedBox(
//                           height: 8,
//                         ),
//                         Row(
//                           children: [
//                             // SizedBox(
//                             //   width: 35.w,
//                             //   height: 23.3.h,
//                             //   child: Image(
//                             //     image: svgManager.Svg(
//                             //       'assets/flags_svg/${flags['IND']}',
//                             //     ),
//                             //     fit: BoxFit.cover,
//                             //   ),
//                             // ),
//                             // SizedBox(
//                             //   width: 13.w,
//                             // ),
//                             Text(
//                               state.response!.data!.draft!.phone!.number!,
//                               style: Theme.of(context).textTheme.bodyLarge,
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                   buildSwitchWithLabels(context, showPhone, (value) {
//                     setState(() {
//                       showPhone = value;
//                     });
//                   }),
//                 ],
//               ),
//               const SizedBox(
//                 height: 32,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Email:",
//                           style: Theme.of(context).textTheme.titleMedium,
//                         ),
//                         const SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           state.response!.data!.draft!.email!,
//                           style: Theme.of(context).textTheme.bodyMedium,
//                         ),
//                       ],
//                     ),
//                   ),
//                   buildSwitchWithLabels(context, showEmail, (value) {
//                     setState(() {
//                       showEmail = value;
//                     });
//                   }),
//                 ],
//               ),
//               const SizedBox(
//                 height: 32,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Twitter:",
//                           style: Theme.of(context).textTheme.subtitle1,
//                         ),
//                         const SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           state.response!.data!.draft!.twitter!,
//                           style: Theme.of(context).textTheme.bodyText2,
//                         ),
//                       ],
//                     ),
//                   ),
//                   buildSwitchWithLabels(context, showTwitter, (value) {
//                     setState(() {
//                       showTwitter = value;
//                     });
//                   })
//                 ],
//               ),
//               const SizedBox(
//                 height: 32,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "LinkedIn:",
//                           style: Theme.of(context).textTheme.subtitle1,
//                         ),
//                         const SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           "",
//                           style: Theme.of(context).textTheme.bodyText2,
//                         ),
//                       ],
//                     ),
//                   ),
//                   buildSwitchWithLabels(context, showLinkedin, (value) {
//                     setState(() {
//                       showLinkedin = value;
//                     });
//                   })
//                 ],
//               ),
//               const SizedBox(
//                 height: 32,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Instagram:",
//                           style: Theme.of(context).textTheme.subtitle1,
//                         ),
//                         const SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           "",
//                           style: Theme.of(context).textTheme.bodyText2,
//                         ),
//                       ],
//                     ),
//                   ),
//                   buildSwitchWithLabels(context, showInstagram, (value) {
//                     setState(() {
//                       showInstagram = value;
//                     });
//                   })
//                 ],
//               ),
//               const SizedBox(
//                 height: 32,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Facebook:",
//                           style: Theme.of(context).textTheme.subtitle1,
//                         ),
//                         const SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           "",
//                           style: Theme.of(context).textTheme.bodyText2,
//                         ),
//                       ],
//                     ),
//                   ),
//                   buildSwitchWithLabels(context, showFacebook, (value) {
//                     setState(() {
//                       showFacebook = value;
//                     });
//                   })
//                 ],
//               )
//             ],
//           );
//       }
//     });
//   }

//   Widget _contactInfoEdit() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(
//           height: 12,
//         ),
//         Align(
//           alignment: Alignment.center,
//           child: Text(
//             "Contact Info (optional)",
//             style: Theme.of(context).textTheme.titleLarge,
//           ),
//         ),
//         const SizedBox(
//           height: 30,
//         ),
//         Text(
//           "Name:",
//           style: Theme.of(context).textTheme.subtitle1,
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         Row(
//           children: [
//             Expanded(
//               flex: 1,
//               child: TextFormField(
//                 controller: nameController,
//                 style: Theme.of(context).textTheme.bodyText1?.copyWith(
//                     fontSize: 16.sp, color: AppColors.primaryActiveColor),
//                 decoration: const InputDecoration(
//                   border: UnderlineInputBorder(),
//                   labelText: '',
//                 ),
//               ),
//             ),
//             const SizedBox(
//               width: 12,
//             ),
//             buildSwitchWithLabels(context, showName, (value) {
//               setState(() {
//                 showName = value;
//               });
//             })
//           ],
//         ),
//         const SizedBox(
//           height: 32,
//         ),
//         Text(
//           "Phone:",
//           style: Theme.of(context).textTheme.subtitle1,
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         Row(
//           children: [
//             Expanded(
//               flex: 1,
//               child: TextFormField(
//                 controller: phoneController,
//                 style: Theme.of(context).textTheme.bodyText1?.copyWith(
//                     fontSize: 16.sp, color: AppColors.primaryActiveColor),
//                 decoration: const InputDecoration(
//                   border: UnderlineInputBorder(),
//                   labelText: '',
//                 ),
//               ),
//             ),
//             const SizedBox(
//               width: 12,
//             ),
//             buildSwitchWithLabels(context, showPhone, (value) {
//               setState(() {
//                 showPhone = value;
//               });
//             })
//           ],
//         ),
//         const SizedBox(
//           height: 32,
//         ),
//         Text(
//           "Email:",
//           style: Theme.of(context).textTheme.titleMedium,
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         Row(
//           children: [
//             Expanded(
//               flex: 1,
//               child: TextFormField(
//                 controller: emailController,
//                 style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                     fontSize: 16.sp, color: AppColors.primaryActiveColor),
//                 decoration: const InputDecoration(
//                   border: UnderlineInputBorder(),
//                   labelText: '',
//                 ),
//               ),
//             ),
//             const SizedBox(
//               width: 12,
//             ),
//             buildSwitchWithLabels(context, showEmail, (value) {
//               setState(() {
//                 showEmail = value;
//               });
//             })
//           ],
//         ),
//         const SizedBox(
//           height: 32,
//         ),
//         Text(
//           "Twitter:",
//           style: Theme.of(context).textTheme.subtitle1,
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         Row(
//           children: [
//             Expanded(
//               flex: 1,
//               child: TextFormField(
//                 controller: twitterController,
//                 style: Theme.of(context).textTheme.bodyText1?.copyWith(
//                     fontSize: 16.sp, color: AppColors.primaryActiveColor),
//                 decoration: const InputDecoration(
//                   border: UnderlineInputBorder(),
//                   labelText: '',
//                 ),
//               ),
//             ),
//             const SizedBox(
//               width: 12,
//             ),
//             buildSwitchWithLabels(context, showTwitter, (value) {
//               setState(() {
//                 showTwitter = value;
//               });
//             })
//           ],
//         ),
//         const SizedBox(
//           height: 32,
//         ),
//         Text(
//           "LinkedIn:",
//           style: Theme.of(context).textTheme.subtitle1,
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         Row(
//           children: [
//             Expanded(
//               flex: 1,
//               child: TextFormField(
//                 controller: linkedInController,
//                 style: Theme.of(context).textTheme.bodyText1?.copyWith(
//                     fontSize: 16.sp, color: AppColors.primaryActiveColor),
//                 decoration: const InputDecoration(
//                   border: UnderlineInputBorder(),
//                   labelText: '',
//                 ),
//               ),
//             ),
//             const SizedBox(
//               width: 12,
//             ),
//             buildSwitchWithLabels(context, showLinkedin, (value) {
//               setState(() {
//                 showLinkedin = value;
//               });
//             })
//           ],
//         ),
//         const SizedBox(
//           height: 32,
//         ),
//         Text(
//           "Instagram:",
//           style: Theme.of(context).textTheme.subtitle1,
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         Row(
//           children: [
//             Expanded(
//               flex: 1,
//               child: TextFormField(
//                 controller: instagramController,
//                 style: Theme.of(context).textTheme.bodyText1?.copyWith(
//                     fontSize: 16.sp, color: AppColors.primaryActiveColor),
//                 decoration: const InputDecoration(
//                   border: UnderlineInputBorder(),
//                   labelText: '',
//                 ),
//               ),
//             ),
//             const SizedBox(
//               width: 12,
//             ),
//             buildSwitchWithLabels(context, showInstagram, (value) {
//               setState(() {
//                 showInstagram = value;
//               });
//             })
//           ],
//         ),
//         const SizedBox(
//           height: 32,
//         ),
//         Text(
//           "Facebook:",
//           style: Theme.of(context).textTheme.subtitle1,
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         Row(
//           children: [
//             Expanded(
//               flex: 1,
//               child: TextFormField(
//                 controller: facebookController,
//                 style: Theme.of(context).textTheme.bodyText1?.copyWith(
//                     fontSize: 16.sp, color: AppColors.primaryActiveColor),
//                 decoration: const InputDecoration(
//                   border: UnderlineInputBorder(),
//                   labelText: '',
//                 ),
//               ),
//             ),
//             const SizedBox(
//               width: 12,
//             ),
//             buildSwitchWithLabels(context, showFacebook, (value) {
//               setState(() {
//                 showFacebook = value;
//               });
//             })
//           ],
//         ),
//         const SizedBox(
//           height: 32,
//         ),
//       ],
//     );
//   }

//   Future<XFile?> _selectImage(BuildContext context) async {
//     final img = await ImageUtils.getImage(context);
//     if (img == null) {
//       return null;
//     }
//     final image = img as XFile;
//     final size = await image.length();
//     if (size > 2097152) {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Image must be less than 2MB')));
//         return null;
//       }
//     }

//     if (image.name.endsWith('.jpg') ||
//         image.name.endsWith('.jpeg') ||
//         image.name.endsWith('.png')) {
//       return image;
//     } else {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//             content: Text('Image must be in jpg/jpeg/png format')));
//       }
//       return null;
//     }
//   }

//   PopupMenuItem _buildPopupMenuItem(
//       String title, IconData iconData, int position) {
//     return PopupMenuItem(
//       value: position,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Icon(
//             iconData,
//             color: Colors.black,
//           ),
//           Text(title),
//         ],
//       ),
//     );
//   }

//   _onMenuItemSelected(int value) {
//     setState(() {
//       if (value == 0) {
//         isEditing = true;
//         isEditClicked = !isEditClicked;
//       } else if (value == 1) {
//         showCustomDialog(context, "default");
//       } else if (value == 2) {
//         showCustomDialog(context, "previous");
//       } else if (value == 3) {
//         print("https://ecostance.marketsverse.com/c/$slug");
//         // saveApiCall(context);
//         // publishApiCall(context);
//         _launchUrl(Uri.parse("https://ecostance.marketsverse.com/c/$slug"));
//       } else if (value == 4) {
//         publishApiCall(context);
//       } else if (value == 5) {
//         saveApiCall(context);
//       }
//     });
//   }
// }
