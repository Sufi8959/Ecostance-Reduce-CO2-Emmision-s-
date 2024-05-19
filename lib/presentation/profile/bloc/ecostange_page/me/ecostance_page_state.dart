import 'package:flutter/material.dart';
import 'package:net_carbons/app/utils/enums.dart';
import 'package:net_carbons/data/user_profile/ecostance_page/previous/PreviousResponse.dart';
import 'package:net_carbons/data/user_profile/ecostance_page/slug/MeResponse.dart';
import '../../../../../data/user_profile/ecostance_page/my_page/MyPageResponse.dart';
import '../../../../../data/user_profile/ecostance_page/template.dart';

class EcostancePageState {
  final ApiStatus status;
  final MeResponse? response;
  //final MyPageResponse? myPageResponse;
  //final PreviousResponse? previousResponse;
  final String message;
  final bool isEditing;
  final bool isPublished;
  final bool isPrevious;
  final bool optionalNameEditSwitch;
  final bool optionalEmailEditSwitch;
  final bool optionalPhoneEditSwitch;
  final bool optionalLinkdinEditSwitch;
  final bool optionalTwitterEditSwitch;
  final bool optionalInstagramEditSwitch;
  final bool optionalFacebookEditSwitch;
  final TextEditingController optionalNameEdit;
  final TextEditingController optionalPhoneEdit;
  final TextEditingController optionalEmailEdit;
  final TextEditingController optionalTwitterEdit;
  final TextEditingController optionalInstagramEdit;
  final TextEditingController optionalLinkdinEdit;
  final TextEditingController optionalFacebookEdit;
  final TextEditingController ecoStancePageController;
  final TextEditingController referralLinkController;
  final TextEditingController aboutUsController;
  final TextEditingController headerController;
  final TextEditingController descController;
  final List<Template>? templateList;
  final int? selectedIndex;
  final String? imagePath;

  const EcostancePageState({
    this.status = ApiStatus.loading,
    this.isEditing = false,
    this.response,
    //this.myPageResponse,
    //this.previousResponse,
    this.message = "",
    this.isPublished = false,
    this.isPrevious = false,
    this.imagePath,
    required this.optionalNameEdit,
    required this.optionalPhoneEdit,
    required this.optionalEmailEdit,
    required this.optionalTwitterEdit,
    required this.optionalInstagramEdit,
    required this.optionalFacebookEdit,
    required this.optionalLinkdinEdit,
    this.optionalNameEditSwitch = false,
    this.optionalEmailEditSwitch = false,
    this.optionalPhoneEditSwitch = false,
    this.optionalLinkdinEditSwitch = false,
    this.optionalTwitterEditSwitch = false,
    this.optionalInstagramEditSwitch = false,
    this.optionalFacebookEditSwitch = false,
    this.templateList,
    this.selectedIndex,
    required this.ecoStancePageController,
    required this.referralLinkController,
    required this.aboutUsController,
    required this.headerController,
    required this.descController,
  });

  EcostancePageState copyWith({
    ApiStatus? status,
    MeResponse? response,
    MyPageResponse? myPageResponse,
    PreviousResponse? previousResponse,
    bool? isEditing,
    String? message,
    bool? isPublished,
    bool? isPrevious,
    String? imagePath,
    bool? optionalNameEditSwitch,
    bool? optionalEmailEditSwitch,
    bool? optionalPhoneEditSwitch,
    bool? optionalLinkdinEditSwitch,
    bool? optionalTwitterEditSwitch,
    bool? optionalInstagramEditSwitch,
    bool? optionalFacebookEditSwitch,
    List<Template>? templateList,
    int? selectedIndex,
    TextEditingController? ecoStancePageController,
    TextEditingController? referralLinkController,
    TextEditingController? aboutUsController,
    TextEditingController? headerController,
    TextEditingController? descController,
    TextEditingController? optionalNameEdit,
    TextEditingController? optionalPhoneEdit,
    TextEditingController? optionalEmailEdit,
    TextEditingController? optionalTwitterEdit,
    TextEditingController? optionalInstagramEdit,
    TextEditingController? optionalLinkdinEdit,
    TextEditingController? optionalFacebookEdit,
  }) {
    return EcostancePageState(
      status: status ?? this.status,
      isEditing: isEditing ?? this.isEditing,
      response: response ?? this.response,
      // myPageResponse: myPageResponse ?? this.myPageResponse,
      // previousResponse: previousResponse ?? this.previousResponse,
      message: message ?? this.message,
      isPublished: isPublished ?? this.isPublished,
      isPrevious: isPrevious ?? this.isPrevious,
      imagePath: imagePath ?? this.imagePath,
      optionalNameEdit: optionalNameEdit ?? this.optionalNameEdit,
      optionalPhoneEdit: optionalPhoneEdit ?? this.optionalPhoneEdit,
      optionalEmailEdit: optionalEmailEdit ?? this.optionalEmailEdit,
      optionalTwitterEdit: optionalTwitterEdit ?? this.optionalTwitterEdit,
      optionalLinkdinEdit: optionalLinkdinEdit ?? this.optionalLinkdinEdit,
      optionalInstagramEdit:
          optionalInstagramEdit ?? this.optionalInstagramEdit,
      optionalFacebookEdit: optionalFacebookEdit ?? this.optionalFacebookEdit,
      optionalNameEditSwitch:
          optionalNameEditSwitch ?? this.optionalNameEditSwitch,
      optionalEmailEditSwitch:
          optionalEmailEditSwitch ?? this.optionalEmailEditSwitch,
      optionalPhoneEditSwitch:
          optionalPhoneEditSwitch ?? this.optionalPhoneEditSwitch,
      optionalLinkdinEditSwitch:
          optionalLinkdinEditSwitch ?? this.optionalLinkdinEditSwitch,
      optionalTwitterEditSwitch:
          optionalTwitterEditSwitch ?? this.optionalTwitterEditSwitch,
      optionalInstagramEditSwitch:
          optionalInstagramEditSwitch ?? this.optionalInstagramEditSwitch,
      optionalFacebookEditSwitch:
          optionalFacebookEditSwitch ?? this.optionalFacebookEditSwitch,
      templateList: templateList,
      selectedIndex: selectedIndex ?? -1,
      ecoStancePageController:
          ecoStancePageController ?? this.ecoStancePageController,
      referralLinkController:
          referralLinkController ?? this.referralLinkController,
      aboutUsController: aboutUsController ?? this.aboutUsController,
      headerController: headerController ?? this.headerController,
      descController: descController ?? this.descController,
    );
  }

  List<Object?> get props => [
        status,
        response,
        isEditing,
        // previousResponse,
        // myPageResponse,
        message,
        isPublished,
        isPrevious,
        imagePath,
        optionalNameEdit,
        optionalEmailEdit,
        optionalPhoneEdit,
        optionalTwitterEdit,
        optionalInstagramEdit,
        optionalLinkdinEdit,
        optionalFacebookEdit,
        optionalNameEditSwitch,
        optionalEmailEditSwitch,
        optionalPhoneEditSwitch,
        optionalTwitterEditSwitch,
        optionalInstagramEditSwitch,
        optionalLinkdinEditSwitch,
        optionalFacebookEditSwitch,
        templateList,
        selectedIndex
      ];
}
