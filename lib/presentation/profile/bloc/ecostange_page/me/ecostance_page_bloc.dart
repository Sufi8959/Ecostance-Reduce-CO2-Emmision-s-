// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:net_carbons/app/utils/enums.dart';
import 'package:net_carbons/presentation/profile/bloc/ecostange_page/ecostance_page_repository.dart';
import 'ecostance_page_event.dart';
import 'ecostance_page_state.dart';

class EcostancePageBloc extends Bloc<EcostancePageEvent, EcostancePageState> {
  final EcostancePageRepository repository = EcostancePageRepository();

  String oldSlug = "";

  EcostancePageBloc()
      : super(EcostancePageState(
            templateList: [],
            selectedIndex: 0,
            ecoStancePageController: TextEditingController(),
            referralLinkController: TextEditingController(),
            aboutUsController: TextEditingController(),
            headerController: TextEditingController(),
            descController: TextEditingController(),
            optionalNameEdit: TextEditingController(),
            optionalEmailEdit: TextEditingController(),
            optionalPhoneEdit: TextEditingController(),
            optionalLinkdinEdit: TextEditingController(),
            optionalTwitterEdit: TextEditingController(),
            optionalInstagramEdit: TextEditingController(),
            optionalFacebookEdit: TextEditingController())) {
    on<MeResponseApi>(fetchMeResponseApi);
    on<InitialMyEcoStancePageApi>(fetchMyPageApi);
    on<DefaultstMyEcoStancePageApi>(changeToDefaults);
    on<PreviousVersionMyEcoStanceApi>(fetchPreviousApi);
    on<OptionSelected>(_handleOptionSelected);
    on<TemplateSelectedEvent>(_handleTemplateSelected);
    on<CancelEditEvent>(_handleCancelEdit);
    on<EditEvent>(_handleEdit);
    on<PublishStatusChanged>(_handlePublishStatusChanged);
    on<SelectImageEvent>(_handleSelectImage);
    on<OptionalNameEditSwitchChanged>(_handleOptionalNameEditSwitchChanged);
    on<OptionalPhoneEditSwitchChanged>(_handleOptionalPhoneEditSwitchChanged);
    on<OptionalEmailEditSwitchChanged>(_handleOptionalEmailEditSwitchChanged);
    on<OptionalTwitterEditSwitchChanged>(
        _handleOptionalTwitterEditSwitchChanged);
    on<OptionalLinkdinEditSwitchChanged>(
        _handleOptionalLinkdinEditSwitchChanged);
    on<OptionalInstagramEditSwitchChanged>(
        _handleOptionalInstagramEditSwitchChanged);
    on<OptionalFacebookEditSwitchChanged>(
        _handleOptionalFacebookEditSwitchChanged);
  }

  void _handleOptionalNameEditSwitchChanged(
      OptionalNameEditSwitchChanged event, Emitter<EcostancePageState> emit) {
    emit(state.copyWith(optionalNameEditSwitch: event.isSwitchEnabled));
  }

  void _handleOptionalPhoneEditSwitchChanged(
      OptionalPhoneEditSwitchChanged event, Emitter<EcostancePageState> emit) {
    emit(state.copyWith(optionalPhoneEditSwitch: event.isSwitchEnabled));
  }

  void _handleOptionalEmailEditSwitchChanged(
      OptionalEmailEditSwitchChanged event, Emitter<EcostancePageState> emit) {
    emit(state.copyWith(optionalEmailEditSwitch: event.isSwitchEnabled));
  }

  void _handleOptionalTwitterEditSwitchChanged(
      OptionalTwitterEditSwitchChanged event,
      Emitter<EcostancePageState> emit) {
    emit(state.copyWith(optionalTwitterEditSwitch: event.isSwitchEnabled));
  }

  void _handleOptionalLinkdinEditSwitchChanged(
      OptionalLinkdinEditSwitchChanged event,
      Emitter<EcostancePageState> emit) {
    emit(state.copyWith(optionalLinkdinEditSwitch: event.isSwitchEnabled));
  }

  void _handleOptionalInstagramEditSwitchChanged(
      OptionalInstagramEditSwitchChanged event,
      Emitter<EcostancePageState> emit) {
    emit(state.copyWith(optionalInstagramEditSwitch: event.isSwitchEnabled));
  }

  void _handleOptionalFacebookEditSwitchChanged(
      OptionalFacebookEditSwitchChanged event,
      Emitter<EcostancePageState> emit) {
    emit(state.copyWith(optionalFacebookEditSwitch: event.isSwitchEnabled));
  }

  bool stringToBool(String str) {
    return str.toLowerCase() == 'true';
  }

  void _handleOptionSelected(
      OptionSelected event, Emitter<EcostancePageState> emit) async {
    try {
      // Emit loading as true when user selects an option
      emit(state.copyWith(status: ApiStatus.loading));

      switch (event.option) {
        case 'Defaults':
          add(DefaultstMyEcoStancePageApi());
          break;
        case 'Previous Version':
          add(PreviousVersionMyEcoStanceApi());
          break;
        case 'Preview':
          break;
        case 'Publish':
          await publish();
          break;
        case 'Save':
          await save();
          break;
      }
    } catch (error) {
      emit(
          state.copyWith(status: ApiStatus.failure, message: error.toString()));
    } finally {
      emit(state.copyWith(status: ApiStatus.loading));
    }
  }

  Future<void> changeToDefaults(DefaultstMyEcoStancePageApi event,
      Emitter<EcostancePageState> emit) async {
    await repository.fetchMyPage().then((value) {
      int templateIndex = 0;
      bool nameSwitch = false;
      bool emailSwitch = false;
      bool phoneSwitch = false;
      bool linkedinSwitch = false;
      bool twitterSwitch = false;
      bool instagramSwitch = false;
      bool facebookSwitch = false;

      state.ecoStancePageController.text =
          "https://ecostance.marketsverse.com/c/${state.response!.slug!.slug}";
      state.referralLinkController.text =
          "https://ecostance.marketsverse.com?refId=${state.response!.data!.id}";

      state.headerController.text =
          "We are doing our part in combating climate change";
      state.descController.text =
          "We are reducing our greenhouse gas emissions everyday by wasting less, buying green, saving energy and by being conscientious consumers. But we can make only limited lifestyle changes. For our remaining emissions, we are buying carbon offsets to have a zero emission footprint. Each carbon offset we purchase goes into certified projects like planting new trees, reforestation, methane sequestration, ocean cleanup, and other such initiatives that help combat climate change today. We decided not to wait and do something today.";
      state.aboutUsController.text =
          "This is a paragraph about us. We are a family of five, living in Miami, Florida We are interested in playing our part in saving the environment and our planet. Living in a city that is on the front line of climate change gives us a front row-seat to the impending loom. Often during high tides or occasional torrential rains, we are inundated with a flooded downtown where spotting a fish is commonplace. We are not waiting for 2030 or 2050 for NetZero. Yes the government and businesses have to play their part, but we as individuals can make a much bigger difference. If you can spread the word, that now there is a way, we have a chance.The world you and I have inherited is not just ours, but we are mere beneficiaries of its wonders. It is our responsibility to take care of it so that we can pass it on to our future.";
      state.optionalNameEdit.text = "";
      state.optionalPhoneEdit.text = "";
      state.optionalEmailEdit.text = "";
      state.optionalLinkdinEdit.text = "";
      state.optionalTwitterEdit.text = "";
      state.optionalInstagramEdit.text = "";

      state.optionalFacebookEdit.text = "";

      templateIndex = 0;

      emit(state.copyWith(
        status: ApiStatus.success,
        // myPageResponse: value,
        message: 'success',
        selectedIndex: templateIndex,
        isPublished: value.data!.isPublic,
        ecoStancePageController: state.ecoStancePageController,
        referralLinkController: state.referralLinkController,
        headerController: state.headerController,
        descController: state.descController,
        aboutUsController: state.aboutUsController,
        optionalNameEdit: state.optionalNameEdit,
        optionalEmailEdit: state.optionalEmailEdit,
        optionalPhoneEdit: state.optionalPhoneEdit,
        optionalInstagramEdit: state.optionalInstagramEdit,
        optionalLinkdinEdit: state.optionalInstagramEdit,
        optionalFacebookEdit: state.optionalFacebookEdit,
        optionalTwitterEdit: state.optionalTwitterEdit,
        optionalEmailEditSwitch: emailSwitch,
        optionalFacebookEditSwitch: facebookSwitch,
        optionalInstagramEditSwitch: instagramSwitch,
        optionalLinkdinEditSwitch: linkedinSwitch,
        optionalNameEditSwitch: nameSwitch,
        optionalPhoneEditSwitch: phoneSwitch,
        optionalTwitterEditSwitch: twitterSwitch,
      ));
    }).onError((error, stackTrace) {
      emit(
          state.copyWith(status: ApiStatus.failure, message: error.toString()));
    });
  }

  Future<void> fetchMyPageApi(
      InitialMyEcoStancePageApi event, Emitter<EcostancePageState> emit) async {
    await repository.fetchMyPage().then((value) {
      int templateIndex = 0;
      bool nameSwitch = false;
      bool emailSwitch = false;
      bool phoneSwitch = false;
      bool linkedinSwitch = false;
      bool twitterSwitch = false;
      bool instagramSwitch = false;
      bool facebookSwitch = false;

      state.ecoStancePageController.text =
          "https://ecostance.marketsverse.com/c/${state.response!.slug!.slug}";

      state.referralLinkController.text =
          "https://ecostance.marketsverse.com?refId=${state.response!.data!.id}";

      oldSlug = state.response!.slug!.slug!;

      if (value.data!.isPublic == false) {
        print("isPublic False");
        state.headerController.text = value.data!.draft!.title!;
        state.descController.text = value.data!.draft!.description!;
        state.aboutUsController.text = value.data!.draft!.aboutUs!;
        state.optionalNameEdit.text = value.data!.draft!.name!;
        state.optionalPhoneEdit.text = value.data!.draft!.phone!.number!;
        state.optionalEmailEdit.text = value.data!.draft!.email!;
        state.optionalLinkdinEdit.text = value.data!.draft!.linkedin!;
        state.optionalTwitterEdit.text = value.data!.draft!.twitter!;
        state.optionalInstagramEdit.text = value.data!.draft!.instagram!;
        state.optionalFacebookEdit.text = value.data!.draft!.facebook!;

        templateIndex = value.data!.draft!.themeSelected == "blue"
            ? 0
            : value.data!.draft!.themeSelected == "gray"
                ? 1
                : value.data!.draft!.themeSelected == "white"
                    ? 2
                    : value.data!.draft!.themeSelected == "green"
                        ? 3
                        : value.data!.draft!.themeSelected == "beige"
                            ? 4
                            : 5;

        nameSwitch = stringToBool(value.data!.draft!.showName!);
        emailSwitch = stringToBool(value.data!.draft!.showEmail!);
        phoneSwitch = stringToBool(value.data!.draft!.showPhone!);
        linkedinSwitch = stringToBool(value.data!.draft!.showLinkedin!);
        instagramSwitch = stringToBool(value.data!.draft!.showInstagram!);
        facebookSwitch = stringToBool(value.data!.draft!.showFacebook!);
        twitterSwitch = stringToBool(
          value.data!.draft!.showTwitter!,
        );
      } else if (value.data!.isPublic == true) {
        state.headerController.text = value.data!.published!.title!;
        state.descController.text = value.data!.published!.description!;
        state.aboutUsController.text = value.data!.published!.aboutUs!;
        state.optionalNameEdit.text = value.data!.published!.name!;
        state.optionalPhoneEdit.text = value.data!.published!.phone!.number!;
        state.optionalEmailEdit.text = value.data!.published!.email!;
        state.optionalLinkdinEdit.text = value.data!.published!.linkedin!;
        state.optionalTwitterEdit.text = value.data!.published!.twitter!;
        state.optionalInstagramEdit.text = value.data!.published!.instagram!;
        state.optionalFacebookEdit.text = value.data!.published!.facebook!;

        templateIndex = value.data!.published!.themeSelected == "blue"
            ? 0
            : value.data!.published!.themeSelected == "gray"
                ? 1
                : value.data!.published!.themeSelected == "white"
                    ? 2
                    : value.data!.published!.themeSelected == "green"
                        ? 3
                        : value.data!.published!.themeSelected == "beige"
                            ? 4
                            : 5;

        nameSwitch = stringToBool(value.data!.published!.showName!);
        emailSwitch = stringToBool(value.data!.published!.showEmail!);
        phoneSwitch = stringToBool(value.data!.published!.showPhone!);
        linkedinSwitch = stringToBool(value.data!.published!.showLinkedin!);
        instagramSwitch = stringToBool(value.data!.published!.showInstagram!);
        facebookSwitch = stringToBool(value.data!.published!.showFacebook!);
        twitterSwitch = stringToBool(
          value.data!.published!.showTwitter!,
        );
      }

      emit(state.copyWith(
        status: ApiStatus.success,
        // myPageResponse: value,
        message: 'success',
        selectedIndex: templateIndex,
        isPublished: value.data!.isPublic,
        ecoStancePageController: state.ecoStancePageController,
        referralLinkController: state.referralLinkController,
        headerController: state.headerController,
        descController: state.descController,
        aboutUsController: state.aboutUsController,
        optionalNameEdit: state.optionalNameEdit,
        optionalEmailEdit: state.optionalEmailEdit,
        optionalPhoneEdit: state.optionalPhoneEdit,
        optionalInstagramEdit: state.optionalInstagramEdit,
        optionalLinkdinEdit: state.optionalInstagramEdit,
        optionalFacebookEdit: state.optionalFacebookEdit,
        optionalTwitterEdit: state.optionalTwitterEdit,
        optionalEmailEditSwitch: emailSwitch,
        optionalFacebookEditSwitch: facebookSwitch,
        optionalInstagramEditSwitch: instagramSwitch,
        optionalLinkdinEditSwitch: linkedinSwitch,
        optionalNameEditSwitch: nameSwitch,
        optionalPhoneEditSwitch: phoneSwitch,
        optionalTwitterEditSwitch: twitterSwitch,
      ));
    }).onError((error, stackTrace) {
      emit(
          state.copyWith(status: ApiStatus.failure, message: error.toString()));
    });
  }

  Future<void> fetchMeResponseApi(
      MeResponseApi event, Emitter<EcostancePageState> emit) async {
    await repository.fetchMe().then((value) {
      emit(state.copyWith(
        response: value,
      ));

      add(InitialMyEcoStancePageApi());
    }).onError((error, stackTrace) {
      emit(
          state.copyWith(status: ApiStatus.failure, message: error.toString()));
    });
  }

  Future<void> fetchPreviousApi(PreviousVersionMyEcoStanceApi event,
      Emitter<EcostancePageState> emit) async {
    int templateIndex = 0;
    bool nameSwitch = false;
    bool emailSwitch = false;
    bool phoneSwitch = false;
    bool linkedinSwitch = false;
    bool twitterSwitch = false;
    bool instagramSwitch = false;
    bool facebookSwitch = false;

    await repository.fetchPrevious().then((value) {
      print("Previous Fetched");

      state.ecoStancePageController.text =
          "https://ecostance.marketsverse.com/c/${state.response!.slug!.slug}";
      state.referralLinkController.text =
          "https://ecostance.marketsverse.com?refId=${state.response!.data!.id}";
      state.descController.text = value.data!.description!;
      state.aboutUsController.text = value.data!.aboutUs!;
      state.headerController.text = value.data!.title!;
      state.optionalNameEdit.text = value.data!.name!;
      state.optionalPhoneEdit.text = value.data!.phone!.number!;
      state.optionalEmailEdit.text = value.data!.email!;
      state.optionalLinkdinEdit.text = value.data!.linkedin!;
      state.optionalTwitterEdit.text = value.data!.twitter!;
      state.optionalInstagramEdit.text = value.data!.instagram!;
      state.optionalFacebookEdit.text = value.data!.facebook!;

      templateIndex = value.data!.themeSelected == "blue"
          ? 0
          : value.data!.themeSelected == "gray"
              ? 1
              : value.data!.themeSelected == "white"
                  ? 2
                  : value.data!.themeSelected == "green"
                      ? 3
                      : value.data!.themeSelected == "beige"
                          ? 4
                          : 5;

      nameSwitch = stringToBool(value.data!.showName!);
      emailSwitch = stringToBool(value.data!.showEmail!);
      phoneSwitch = stringToBool(value.data!.showPhone!);
      linkedinSwitch = stringToBool(value.data!.showLinkedin!);
      instagramSwitch = stringToBool(value.data!.showInstagram!);
      facebookSwitch = stringToBool(value.data!.showFacebook!);
      twitterSwitch = stringToBool(
        value.data!.showTwitter!,
      );

      emit(state.copyWith(
        status: ApiStatus.success,
        // previousResponse: value,
        message: 'success',
        selectedIndex: templateIndex,
        isPublished: value.data!.isPublic,
        ecoStancePageController: state.ecoStancePageController,
        referralLinkController: state.referralLinkController,
        headerController: state.headerController,
        descController: state.descController,
        aboutUsController: state.aboutUsController,
        optionalNameEdit: state.optionalNameEdit,
        optionalEmailEdit: state.optionalEmailEdit,
        optionalPhoneEdit: state.optionalPhoneEdit,
        optionalInstagramEdit: state.optionalInstagramEdit,
        optionalLinkdinEdit: state.optionalInstagramEdit,
        optionalFacebookEdit: state.optionalFacebookEdit,
        optionalTwitterEdit: state.optionalTwitterEdit,
        optionalEmailEditSwitch: emailSwitch,
        optionalFacebookEditSwitch: facebookSwitch,
        optionalInstagramEditSwitch: instagramSwitch,
        optionalLinkdinEditSwitch: linkedinSwitch,
        optionalNameEditSwitch: nameSwitch,
        optionalPhoneEditSwitch: phoneSwitch,
        optionalTwitterEditSwitch: twitterSwitch,
      ));
    }).onError((error, stackTrace) {
      emit(
          state.copyWith(status: ApiStatus.failure, message: error.toString()));
    });
  }

  Future<void> defaults() async {
    try {
      final data = {
        'number': state.optionalPhoneEdit.text,
        'countryCode': "IND",
        'numericCode': "+91",
        'name': "",
        'showName': "false",
        'email': "",
        'showEmail': "false",
        'showPhone': "false",
        'twitter': "",
        'showTwitter': "false",
        'facebook': "",
        'showFacebook': "false",
        'linkedin': "",
        'showLinkedin': "false",
        'instagram': "",
        'showInstagram': "false",
        'country': "IN",
        'aboutUs':
            "This is a paragraph about us. We are a family of five, living in Miami, Florida We are interested in playing our part in saving the environment and our planet. Living in a city that is on the front line of climate change gives us a front row-seat to the impending loom. Often during high tides or occasional torrential rains, we are inundated with a flooded downtown where spotting a fish is commonplace. We are not waiting for 2030 or 2050 for NetZero. Yes the government and businesses have to play their part, but we as individuals can make a much bigger difference. If you can spread the word, that now there is a way, we have a chance.The world you and I have inherited is not just ours, but we are mere beneficiaries of its wonders. It is our responsibility to take care of it so that we can pass it on to our future.",
        'description':
            "We are reducing our greenhouse gas emissions everyday by wasting less, buying green, saving energy and by being conscientious consumers. But we can make only limited lifestyle changes. For our remaining emissions, we are buying carbon offsets to have a zero emission footprint. Each carbon offset we purchase goes into certified projects like planting new trees, reforestation, methane sequestration, ocean cleanup, and other such initiatives that help combat climate change today. We decided not to wait and do something today.",
        'title': "We are doing our part in combating climate change",
        'profilePicURL': "https://example.com/profile.jpg",
        'isPublic': "false",
        'themeSelected': "blue",
      };

      await repository.defaultApiCall(data).then((value) {
        print("Defaults Fetched");
        add(MeResponseApi());
        add(InitialMyEcoStancePageApi());
      });
    } catch (error) {
      emit(
          state.copyWith(status: ApiStatus.failure, message: error.toString()));
    }
  }

  Future<void> fetchMe(
      MeResponseApi event, Emitter<EcostancePageState> emit) async {
    try {
      final response = await repository.fetchMe();
      emit(state.copyWith(
          status: ApiStatus.success, response: response, message: 'success'));
    } catch (error) {
      emit(
          state.copyWith(status: ApiStatus.failure, message: error.toString()));
    }
  }

  Future<void> save() async {
    try {
      final ecoStanceText = state.ecoStancePageController.text;
      const oldSlugText = "https://ecostance.marketsverse.com/c/";

      String newSlug = ecoStanceText.replaceFirst(oldSlugText, '');
      final Map<String, String> data;

      if (oldSlug == newSlug) {
        data = {
          'number': state.optionalPhoneEdit.text,
          'countryCode': "IND",
          'numericCode': "+91",
          'slug': oldSlug,
          'name': state.optionalNameEdit.text,
          'showName': state.optionalNameEditSwitch.toString(),
          'email': state.optionalEmailEdit.text,
          'showEmail': state.optionalEmailEditSwitch.toString(),
          'showPhone': state.optionalPhoneEditSwitch.toString(),
          'twitter': state.optionalTwitterEdit.text,
          'showTwitter': state.optionalTwitterEditSwitch.toString(),
          'facebook': state.optionalFacebookEdit.text,
          'showFacebook': state.optionalFacebookEditSwitch.toString(),
          'linkedin': state.optionalLinkdinEdit.text,
          'showLinkedin': state.optionalLinkdinEditSwitch.toString(),
          'instagram': state.optionalInstagramEdit.text,
          'showInstagram': state.optionalInstagramEditSwitch.toString(),
          'country': "IN",
          'aboutUs': state.aboutUsController.text,
          'description': state.descController.text,
          'title': state.headerController.text,
          'profilePicURL': "https://example.com/profile.jpg",
          'isPublic': state.isPublished.toString(),
          'themeSelected': state.selectedIndex == 0
              ? "blue"
              : state.selectedIndex == 1
                  ? "gray"
                  : state.selectedIndex == 2
                      ? "white"
                      : state.selectedIndex == 3
                          ? "green"
                          : state.selectedIndex == 4
                              ? "beige"
                              : "pink",
        };
      } else {
        data = {
          'number': state.optionalPhoneEdit.text,
          'countryCode': "IND",
          'numericCode': "+91",
          'newSlug': newSlug,
          'slug': oldSlug,
          'name': state.optionalNameEdit.text,
          'showName': state.optionalNameEditSwitch.toString(),
          'email': state.optionalEmailEdit.text,
          'showEmail': state.optionalEmailEditSwitch.toString(),
          'showPhone': state.optionalPhoneEditSwitch.toString(),
          'twitter': state.optionalTwitterEdit.text,
          'showTwitter': state.optionalTwitterEditSwitch.toString(),
          'facebook': state.optionalFacebookEdit.text,
          'showFacebook': state.optionalFacebookEditSwitch.toString(),
          'linkedin': state.optionalLinkdinEdit.text,
          'showLinkedin': state.optionalLinkdinEditSwitch.toString(),
          'instagram': state.optionalInstagramEdit.text,
          'showInstagram': state.optionalInstagramEditSwitch.toString(),
          'country': "IN",
          'aboutUs': state.aboutUsController.text,
          'description': state.descController.text,
          'title': state.headerController.text,
          'profilePicURL': "https://example.com/profile.jpg",
          'isPublic': state.isPublished.toString(),
          'themeSelected': state.selectedIndex == 0
              ? "blue"
              : state.selectedIndex == 1
                  ? "gray"
                  : state.selectedIndex == 2
                      ? "white"
                      : state.selectedIndex == 3
                          ? "green"
                          : state.selectedIndex == 4
                              ? "beige"
                              : "pink",
        };
      }

      await repository.saveApiCall(data).then((value) {
        print("Save Fetched");
        add(MeResponseApi());
        add(InitialMyEcoStancePageApi());
      });
    } catch (error) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(
          state.copyWith(status: ApiStatus.failure, message: error.toString()));
    }
  }

  Future<void> publish() async {
    try {
      final ecoStanceText = state.ecoStancePageController.text;
      const oldSlugText = "https://ecostance.marketsverse.com/c/";

      String newSlug = ecoStanceText.replaceFirst(oldSlugText, '');
      final Map<String, String> data;

      if (oldSlug == newSlug) {
        data = {
          'number': state.optionalPhoneEdit.text,
          'countryCode': "IND",
          'numericCode': "+91",
          'slug': oldSlug,
          'name': state.optionalNameEdit.text,
          'showName': state.optionalNameEditSwitch.toString(),
          'email': state.optionalEmailEdit.text,
          'showEmail': state.optionalEmailEditSwitch.toString(),
          'showPhone': state.optionalPhoneEditSwitch.toString(),
          'twitter': state.optionalTwitterEdit.text,
          'showTwitter': state.optionalTwitterEditSwitch.toString(),
          'facebook': state.optionalFacebookEdit.text,
          'showFacebook': state.optionalFacebookEditSwitch.toString(),
          'linkedin': state.optionalLinkdinEdit.text,
          'showLinkedin': state.optionalLinkdinEditSwitch.toString(),
          'instagram': state.optionalInstagramEdit.text,
          'showInstagram': state.optionalInstagramEditSwitch.toString(),
          'country': "IN",
          'aboutUs': state.aboutUsController.text,
          'description': state.descController.text,
          'title': state.headerController.text,
          'profilePicURL': "https://example.com/profile.jpg",
          'isPublic': state.isPublished.toString(),
          'themeSelected': state.selectedIndex == 0
              ? "blue"
              : state.selectedIndex == 1
                  ? "gray"
                  : state.selectedIndex == 2
                      ? "white"
                      : state.selectedIndex == 3
                          ? "green"
                          : state.selectedIndex == 4
                              ? "beige"
                              : "pink",
        };
      } else {
        data = {
          'number': state.optionalPhoneEdit.text,
          'countryCode': "IND",
          'numericCode': "+91",
          'newSlug': newSlug,
          'slug': oldSlug,
          'name': state.optionalNameEdit.text,
          'showName': state.optionalNameEditSwitch.toString(),
          'email': state.optionalEmailEdit.text,
          'showEmail': state.optionalEmailEditSwitch.toString(),
          'showPhone': state.optionalPhoneEditSwitch.toString(),
          'twitter': state.optionalTwitterEdit.text,
          'showTwitter': state.optionalTwitterEditSwitch.toString(),
          'facebook': state.optionalFacebookEdit.text,
          'showFacebook': state.optionalFacebookEditSwitch.toString(),
          'linkedin': state.optionalLinkdinEdit.text,
          'showLinkedin': state.optionalLinkdinEditSwitch.toString(),
          'instagram': state.optionalInstagramEdit.text,
          'showInstagram': state.optionalInstagramEditSwitch.toString(),
          'country': "IN",
          'aboutUs': state.aboutUsController.text,
          'description': state.descController.text,
          'title': state.headerController.text,
          'profilePicURL': "https://example.com/profile.jpg",
          'isPublic': state.isPublished.toString(),
          'themeSelected': state.selectedIndex == 0
              ? "blue"
              : state.selectedIndex == 1
                  ? "gray"
                  : state.selectedIndex == 2
                      ? "white"
                      : state.selectedIndex == 3
                          ? "green"
                          : state.selectedIndex == 4
                              ? "beige"
                              : "pink",
        };
      }

      await repository.publishApiCall(data).then((value) {
        print("Publish Fetched");
        add(MeResponseApi());
        add(InitialMyEcoStancePageApi());
      });
    } catch (error) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(
          state.copyWith(status: ApiStatus.failure, message: error.toString()));
    }
  }

  void _handleCancelEdit(
      CancelEditEvent event, Emitter<EcostancePageState> emit) {
    emit(state.copyWith(isEditing: false));
  }

  void _handleEdit(EditEvent event, Emitter<EcostancePageState> emit) {
    emit(state.copyWith(isEditing: true));
  }

  void _handlePublishStatusChanged(
      PublishStatusChanged event, Emitter<EcostancePageState> emit) {
    emit(state.copyWith(isPublished: event.isPublished));
  }

  void _handleSelectImage(
      SelectImageEvent event, Emitter<EcostancePageState> emit) {
    if (state.isEditing) {
      emit(state.copyWith(imagePath: event.imageUrl));
    }
  }

  void _handleTemplateSelected(
      TemplateSelectedEvent event, Emitter<EcostancePageState> emit) {
    if (state.isEditing) {
      emit(state.copyWith(selectedIndex: event.selectedIndex));
    }
  }
}
