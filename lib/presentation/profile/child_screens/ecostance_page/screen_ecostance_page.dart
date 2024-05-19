import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_codes/country_codes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:net_carbons/presentation/profile/bloc/ecostange_page/me/ecostance_page_bloc.dart';
import 'package:net_carbons/presentation/profile/bloc/ecostange_page/me/ecostance_page_event.dart';
import 'package:net_carbons/presentation/profile/bloc/ecostange_page/me/ecostance_page_state.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../app/app_controller/app_controller_bloc.dart';
import '../../../../app/constants/a2_a3.dart';
import '../../../../app/constants/svg_flags.dart';
import '../../../../app/utils/image_utils.dart';
import '../../../../data/user_profile/ecostance_page/template.dart';
import '../../../../domain/countries/model/country_modal.dart';
import '../../../../utils/utils.dart';
import '../../../app_widgets/text_input_field.dart';
import '../../../resources/color.dart';
import '../../../../../app/utils/enums.dart';
import '../../../resources/ui_widgets/top_wave.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_manager;

class ScreenEcostancePage extends StatefulWidget {
  const ScreenEcostancePage({super.key});

  @override
  ScreenEcostancePageState createState() => ScreenEcostancePageState();
}

class ScreenEcostancePageState extends State<ScreenEcostancePage> {
  late EcostancePageBloc _ecostancePageBloc;

  @override
  void initState() {
    super.initState();

    print("CALLED ONLY ONCE");
    _ecostancePageBloc = context.read<EcostancePageBloc>();
    _ecostancePageBloc.add(MeResponseApi());
    _ecostancePageBloc.add((InitialMyEcoStancePageApi()));
    _ecostancePageBloc.add(CancelEditEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppAppBar(() {
        Navigator.pop(context);
      }, bottom: preferredSize(context)),
      body: BlocBuilder<EcostancePageBloc, EcostancePageState>(
        bloc: _ecostancePageBloc,
        builder: (context, state) {
          return SingleChildScrollView(
            child: _buildPageContent(context, state),
          );
        },
      ),
    );
  }
}

Widget _buildPageContent(BuildContext context, EcostancePageState state) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16.0),
        _buildPublishStatus(context, state),
        Column(
          children: [
            _contentEdit(context),
          ],
        ),
      ],
    ),
  );
}

Widget _buildPublishStatus(BuildContext context, EcostancePageState state) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Publish Status:",
        style: Theme.of(context).textTheme.subtitle1,
      ),
      const SizedBox(
        height: 8,
      ),
      Row(
        children: [
          Text(
            "Off",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const SizedBox(
            width: 16,
          ),
          CupertinoSwitch(
            value: state.isPublished,
            onChanged: (value) {
              if (state.isEditing) {
                context
                    .read<EcostancePageBloc>()
                    .add(PublishStatusChanged(value));
              }
            },
            activeColor: AppColors.greenBtn,
            trackColor: AppColors.lightGrey,
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            "On",
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    ],
  );
}

Future<void> _launchUrl(Uri uri) async {
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $uri');
  }
}

Widget _contentEdit(BuildContext context) {
  return BlocBuilder<EcostancePageBloc, EcostancePageState>(
    builder: (context, state) {
      switch (state.status) {
        case ApiStatus.loading:
          return const Center(child: CupertinoActivityIndicator());
        case ApiStatus.failure:
          return Center(child: Text(state.message.toString()));
        case ApiStatus.success:
          return _buildContentEditWidget(context);
        default:
          return const SizedBox();
      }
    },
  );
}

Widget _buildContentEditWidget(BuildContext context) {
  final state = context.watch<EcostancePageBloc>().state;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 16),
      _buildEcoStancePageRow(context),
      _buildEcoStancePageFormField(context, state),
      const SizedBox(height: 16),
      _buildReferralLinkRow(context),
      _buildReferralLinkFormField(context, state),
      const SizedBox(height: 24),
      _buildHeadingFormField(context, state),
      const SizedBox(height: 24),
      _buildDescriptionFormField(context, state),
      const SizedBox(height: 24),
      _buildAboutUsFormField(context, state),
      const SizedBox(height: 24),
      // countrySelection(context, state),
      // const SizedBox(height: 32),
      // profilePic(context),
      // const SizedBox(height: 32),
      templateWidget(context),
      const SizedBox(height: 32),
      _buildOptionalInfoText(context),
      const SizedBox(height: 32),
      contactInfoOptional(context),
    ],
  );
}

Widget _buildEcoStancePageRow(BuildContext context) {
  return Row(
    children: [
      Text(
        "EcoStance Page:",
        style: Theme.of(context).textTheme.subtitle1,
      ),
      IconButton(
        icon: const Icon(Icons.info_outline, color: Colors.grey),
        onPressed: () => _showInfoDialog(context),
      ),
      IconButton(
        icon: const Icon(Icons.copy, color: Colors.grey),
        onPressed: () => _copyToClipboard(context),
      ),
      IconButton(
        icon: const Icon(Icons.qr_code_2, color: Colors.grey),
        onPressed: () => _showQRCodeDialog(context),
      ),
    ],
  );
}

void _showInfoDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: const Text(ecostancePageInfo),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}

void _copyToClipboard(BuildContext context) {
  Clipboard.setData(const ClipboardData(text: 'Text to copy'));
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Text copied to clipboard'),
    ),
  );
}

void _showQRCodeDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: SizedBox(
        width: 200,
        height: 200,
        child: Center(
          child: QrImageView(
            data:
                'https://ecostance.marketsverse.com/c/state.response!.slug!.slug!',
            version: QrVersions.auto,
            backgroundColor: Colors.white,
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
      ],
    ),
  );
}

Widget _buildEcoStancePageFormField(
    BuildContext context, EcostancePageState state) {
  return Form(
    key: formKey['ecoStancePageKey'],
    child: InputField(
      onChanged: (data) =>
          formKey['ecoStancePageKey']?.currentState?.validate(),
      focusNode: nodes['ecoStancePageKey'],
      enabled: state.isEditing,
      textEditingController: state.ecoStancePageController,
      label: "",
      hintText: '',
      onFocused: () {},
      onUnfocused: () => formKey['ecoStancePageKey']?.currentState?.validate(),
      validator: (val) {
        if (val!.isEmpty) {
          return 'Enter a valid url';
        }
        return null;
      },
    ),
  );

  // Form(
  //   key: formKey['ecoStancePageKey'],
  //   child: TextFormField(
  //     onChanged: (data) =>
  //         formKey['ecoStancePageKey']?.currentState?.validate(),
  //     focusNode: nodes['ecoStancePageKey'],
  //     enabled: state.isEditing,
  //     controller: state.ecoStancePageController,
  //     decoration: InputDecoration(
  //       contentPadding: const EdgeInsets.all(8),
  //       hintText: "",
  //       hintStyle: const TextStyle(color: Colors.grey),
  //       filled: true,
  //       fillColor: Colors.grey.withOpacity(0.1),
  //       enabledBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(8),
  //         borderSide: const BorderSide(color: Colors.grey, width: 0),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(8),
  //         borderSide: const BorderSide(color: Colors.grey, width: 0),
  //       ),
  //     ),
  //     validator: (val) {
  //       if (val!.isEmpty) {
  //         return 'Enter a valid URL';
  //       }
  //       return null;
  //     },
  //   ),
  // );
}

Widget _buildReferralLinkRow(BuildContext context) {
  return Row(
    children: [
      Text(
        "Referral Link:",
        style: Theme.of(context).textTheme.subtitle1,
      ),
      const SizedBox(width: 8),
      IconButton(
        icon: const Icon(Icons.copy, color: Colors.grey),
        onPressed: () => _copyReferralLinkToClipboard(context),
      ),
    ],
  );
}

void _copyReferralLinkToClipboard(BuildContext context) {
  Clipboard.setData(const ClipboardData(text: 'Text to copy'));
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Text copied to clipboard'),
    ),
  );
}

Widget _buildReferralLinkFormField(
    BuildContext context, EcostancePageState state) {
  return Form(
    key: formKey['referralLinkKey'],
    child: InputField(
      onChanged: (data) => formKey['referralLinkKey']?.currentState?.validate(),
      focusNode: nodes['referralLinkKey'],
      textEditingController: state.referralLinkController,
      label: "",
      hintText: '',
      enabled: state.isEditing,
      onFocused: () {},
      onUnfocused: () => formKey['referralLinkKey']?.currentState?.validate(),
      validator: (val) {
        if (val!.isEmpty) {
          return 'Enter a valid link';
        }
        return null;
      },
    ),
  );
}

Widget _buildHeadingFormField(BuildContext context, EcostancePageState state) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Heading:",
        style: Theme.of(context).textTheme.subtitle1,
      ),
      const SizedBox(
        height: 8,
      ),
      Form(
        key: formKey['headingKey'],
        child: InputField(
          onChanged: (data) => formKey['headingKey']?.currentState?.validate(),
          focusNode: nodes['headingKey'],
          enabled: state.isEditing,
          textEditingController: state.headerController,
          label: "",
          hintText: '',
          onFocused: () {},
          onUnfocused: () => formKey['headingKey']?.currentState?.validate(),
          validator: (val) {
            if (val!.isEmpty) {
              return 'Enter heading';
            }
            return null;
          },
        ),
      ),
    ],
  );
}

Widget _buildDescriptionFormField(
    BuildContext context, EcostancePageState state) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Description:",
        style: Theme.of(context).textTheme.subtitle1,
      ),
      const SizedBox(
        height: 8,
      ),
      Form(
        key: formKey['descriptionKey'],
        child: InputField(
          onChanged: (data) =>
              formKey['descriptionKey']?.currentState?.validate(),
          focusNode: nodes['descriptionKey'],
          enabled: state.isEditing,
          textEditingController: state.descController,
          label: "",
          hintText: '',
          onFocused: () {},
          onUnfocused: () =>
              formKey['descriptionKey']?.currentState?.validate(),
          validator: (val) {
            if (val!.isEmpty) {
              return 'Enter description';
            }
            return null;
          },
          maxLines: 4,
        ),
      ),
    ],
  );
}

Widget _buildAboutUsFormField(BuildContext context, EcostancePageState state) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "About Us:",
        style: Theme.of(context).textTheme.subtitle1,
      ),
      const SizedBox(
        height: 8,
      ),
      Form(
        key: formKey['aboutKey'],
        child: InputField(
          onChanged: (data) => formKey['aboutKey']?.currentState?.validate(),
          focusNode: nodes['aboutKey'],
          enabled: state.isEditing,
          textEditingController: state.aboutUsController,
          label: "",
          hintText: '',
          onFocused: () {},
          onUnfocused: () => formKey['aboutKey']?.currentState?.validate(),
          validator: (val) {
            if (val!.isEmpty) {
              return 'Enter about us';
            }
            return null;
          },
          maxLines: 4,
        ),
      ),
    ],
  );
}

Widget _buildOptionalInfoText(BuildContext context) {
  return Column(
    children: [
      const SizedBox(
        height: 12,
      ),
      Align(
        alignment: Alignment.center,
        child: Text(
          "Contact Info (optional)",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      const SizedBox(
        height: 30,
      ),
    ],
  );
}

Widget countrySelection(
    BuildContext context, EcostancePageState ecostancePageState) {
  bool firstRun = true;
  CountryModal? selectedCountry;
  CountryModal? selectedCountryLocal;

  final locale = CountryCodes.getDeviceLocale();
  final CountryDetails details = CountryCodes.detailsForLocale(locale);
  final alpha3code =
      countryCodesConvertA2ToA3(a2Code: details.alpha2Code ?? '');
  final CountryModal countryModal = CountryModal(
      id: '',
      entity: details.localizedName ?? "",
      countryCode: alpha3code ?? "USA",
      currencyName: '',
      currencyCode: '',
      numericCode: '',
      minorUnit: '',
      carbonCountryCode: '',
      carbonCountryPerCapita: '',
      phonePrefix: details.dialCode ?? "",
      status: '',
      show: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      v: 0,
      isCurrencySupported: false);

  selectedCountryLocal = countryModal;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Country:",
        style: Theme.of(context).textTheme.subtitle1,
      ),
      const SizedBox(
        height: 8,
      ),
      SizedBox(
          height: 45.h,
          child: BlocBuilder<AppControllerBloc, AppControllerState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const CupertinoActivityIndicator();
              }
              if (state.countries.isNotEmpty) {
                if (state.countries.isNotEmpty) {
                  firstRun == true
                      ? selectedCountry = state.countries.firstWhere((element) {
                          return element.countryCode ==
                              state.countryModal?.countryCode;
                        },
                          orElse: () => state.countries.firstWhere(
                              (element) =>
                                  element.countryCode ==
                                  selectedCountryLocal?.countryCode,
                              orElse: () => state.countries.firstWhere(
                                    (element) => element.countryCode == "USD",
                                  )))
                      : null;
                }
                firstRun = false;
                return Center(
                    child: Container(
                        height: 45.h,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.appGreyColor, width: .5)),
                        padding: EdgeInsets.symmetric(horizontal: 18.w),
                        width: double.maxFinite,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<CountryModal>(
                            icon: Center(
                                child: Icon(
                              Icons.keyboard_arrow_down,
                              size: 32.sp,
                            )),
                            hint: const Text("Or Select a Country"),
                            value: selectedCountry,
                            isDense: true,
                            onChanged: (newValue) {
                              if (ecostancePageState.isEditing) {
                                selectedCountry = newValue;
                                selectedCountryLocal = newValue;
                              }
                            },
                            items: state.countries.map((country) {
                              return DropdownMenuItem<CountryModal>(
                                value: country,
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: svg_manager.Svg(
                                        'assets/flags_svg/${flags[country.countryCode ?? 'USA']}',
                                      ),
                                      backgroundColor: Colors.transparent,
                                      radius: 15.w,
                                    ),
                                    SizedBox(
                                      width: 13.w,
                                    ),
                                    Text(
                                      country.entity.length < 22
                                          ? country.entity
                                          : "${country.entity.substring(0, 21)}...",
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        )));
              }
              if (state.countries.isEmpty) {
                return Center(
                    child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ///TODO: Border design change
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.lightGrey, width: 1)),
                          height: 45.h,
                          padding: EdgeInsets.all(8.w),
                          width: double.maxFinite,
                          child: Center(
                            child: Text(
                              selectedCountryLocal?.entity ?? "",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                      color: AppColors.lightGrey, height: 1.2),
                            ),
                          )),
                    ),

                    TextButton(
                      onPressed: () async {
                        BlocProvider.of<AppControllerBloc>(context)
                            .add(const AppControllerEvent.fetchCountries());
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ));
              }
              return Container();
            },
          )),
    ],
  );
}

Widget templateWidget(BuildContext context) {
  final List<Template> templateList = templateListItems;
  final EcostancePageBloc bloc = BlocProvider.of<EcostancePageBloc>(context);

  return BlocBuilder<EcostancePageBloc, EcostancePageState>(
    builder: (context, state) {
      int selectedIndex = state.selectedIndex!;

      print(selectedIndex);

      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Select a Template: ",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: templateList.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final template = templateList[index];
                return Column(
                  children: [
                    Image.network(
                      template.link,
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(
                      width: 32,
                      height: 32,
                      child: RadioListTile<int>(
                        title: Text('Template $index'),
                        value: index,
                        groupValue: selectedIndex,
                        onChanged: (value) {
                          if (state.isEditing && value != null) {
                            print(selectedIndex);
                            print(value);
                            bloc.add(TemplateSelectedEvent(value));
                          } else {
                            showCustomSnackBar(
                                context, "Please select edit button to edit");
                          }
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Colors.green,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      );
    },
  );
}

Widget profilePic(BuildContext context) {
  final EcostancePageBloc bloc = BlocProvider.of<EcostancePageBloc>(context);

  return BlocBuilder<EcostancePageBloc, EcostancePageState>(
    builder: (context, state) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Profile Photo: ",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: Center(
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(75.0),
                        border: Border.all(
                          color: Colors.white.withOpacity(
                              0.5), // Border color with 50% transparency
                          width: 4.0,
                        ),
                        // color: Colors.grey.withOpacity(
                        //     0.5), // Background color with 50% transparency
                      ),
                      child:
                          (state.imagePath == null || state.imagePath!.isEmpty)
                              ? (state.imagePath != null
                                  ? Material(
                                      borderRadius: BorderRadius.circular(75.0),
                                      clipBehavior: Clip.hardEdge,
                                      child: CachedNetworkImage(
                                        placeholder: (context, url) =>
                                            const SizedBox(
                                          width: 140.0,
                                          height: 140.0,
                                          child: Padding(
                                            padding: EdgeInsets.all(50.0),
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                        imageUrl: state.imagePath!,
                                        width: 150.0,
                                        height: 150.0,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : const Icon(
                                      Icons.account_circle,
                                      size: 140.0,
                                      color: Colors.grey,
                                    ))
                              : Material(
                                  borderRadius: BorderRadius.circular(75.0),
                                  clipBehavior: Clip.hardEdge,
                                  child: Image.file(
                                    File(state.imagePath!),
                                    width: 140.0,
                                    height: 140.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: SizedBox(
                        height: 32,
                        width: 32,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: InkWell(
                            child: const Icon(
                              Icons.camera_alt,
                              size: 18,
                              color: Colors.black,
                            ),
                            onTap: () async {
                              if (state.isEditing) {
                                final image = await _selectImage(context);
                                if (image != null) {
                                  bloc.add(
                                      SelectImageEvent(imageUrl: image.path));
                                } else {
                                  showCustomSnackBar(context,
                                      'Please select edit button to edit');
                                }
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Future<XFile?> _selectImage(BuildContext context) async {
  final img = await ImageUtils.getImage(context);
  if (img == null) {
    return null;
  }
  final image = img as XFile;
  final size = await image.length();
  if (size > 2097152) {
    showCustomSnackBar(context, 'Image must be less than 2MB');
    return null;
  }

  if (image.path.endsWith('.jpg') ||
      image.path.endsWith('.jpeg') ||
      image.path.endsWith('.png')) {
    return image;
  } else {
    showCustomSnackBar(context, 'Image must be in jpg/jpeg/png format');

    return null;
  }
}

Widget contactInfoOptional(BuildContext context) {
  final EcostancePageBloc bloc = BlocProvider.of<EcostancePageBloc>(context);

  return BlocBuilder<EcostancePageBloc, EcostancePageState>(
    builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FieldWidget(
            label: 'Name',
            isEnabled: state.isEditing,
            controller: state.optionalNameEdit,
            switchValue: state.optionalNameEditSwitch,
            onChanged: (value) {
              if (state.isEditing) {
                bloc.add(OptionalNameEditEvent(state.optionalNameEdit));
              }
            },
            onSwitchChanged: (value) {
              if (state.isEditing) {
                bloc.add(OptionalNameEditSwitchChanged(value));
              } else {
                showCustomSnackBar(
                    context, "Please select edit button to edit");
              }
            },
          ),
          FieldWidget(
            label: 'Phone',
            isEnabled: state.isEditing,
            controller: state.optionalPhoneEdit,
            switchValue: state.optionalPhoneEditSwitch,
            onChanged: (value) {
              if (state.isEditing) {
                bloc.add(OptionalPhoneEditEvent(state.optionalPhoneEdit));
              }
            },
            onSwitchChanged: (value) {
              if (state.isEditing) {
                bloc.add(OptionalPhoneEditSwitchChanged(value));
              } else {
                showCustomSnackBar(
                    context, "Please select edit button to edit");
              }
            },
          ),
          FieldWidget(
            label: 'Email',
            isEnabled: state.isEditing,
            controller: state.optionalEmailEdit,
            switchValue: state.optionalEmailEditSwitch,
            onChanged: (value) {
              if (state.isEditing) {
                bloc.add(OptionalEmailEditEvent(state.optionalEmailEdit));
              }
            },
            onSwitchChanged: (value) {
              if (state.isEditing) {
                bloc.add(OptionalEmailEditSwitchChanged(value));
              } else {
                showCustomSnackBar(
                    context, "Please select edit button to edit");
              }
            },
          ),
          FieldWidget(
            label: 'Twitter',
            isEnabled: state.isEditing,
            controller: state.optionalTwitterEdit,
            switchValue: state.optionalTwitterEditSwitch,
            onChanged: (value) {
              if (state.isEditing) {
                bloc.add(OptionalTwitterEditEvent(state.optionalTwitterEdit));
              }
            },
            onSwitchChanged: (value) {
              if (state.isEditing) {
                bloc.add(OptionalTwitterEditSwitchChanged(value));
              } else {
                showCustomSnackBar(
                    context, "Please select edit button to edit");
              }
            },
          ),
          FieldWidget(
            label: 'LinkedIn',
            isEnabled: state.isEditing,
            controller: state.optionalLinkdinEdit,
            switchValue: state.optionalLinkdinEditSwitch,
            onChanged: (value) {
              if (state.isEditing) {
                bloc.add(OptionalLinkdinEditEvent(state.optionalLinkdinEdit));
              }
            },
            onSwitchChanged: (value) {
              if (state.isEditing) {
                bloc.add(OptionalLinkdinEditSwitchChanged(value));
              }
            },
          ),
          FieldWidget(
            label: 'Instagram',
            isEnabled: state.isEditing,
            controller: state.optionalInstagramEdit,
            switchValue: state.optionalInstagramEditSwitch,
            onChanged: (value) {
              if (state.isEditing) {
                bloc.add(
                    OptionalInstagramEditEvent(state.optionalInstagramEdit));
              }
            },
            onSwitchChanged: (value) {
              if (state.isEditing) {
                bloc.add(OptionalInstagramEditSwitchChanged(value));
              } else {
                showCustomSnackBar(
                    context, "Please select edit button to edit");
              }
            },
          ),
          FieldWidget(
            label: 'Facebook',
            isEnabled: state.isEditing,
            controller: state.optionalFacebookEdit,
            switchValue: state.optionalFacebookEditSwitch,
            onChanged: (value) {
              if (state.isEditing) {
                bloc.add(OptionalFacebookEditEvent(state.optionalFacebookEdit));
              }
            },
            onSwitchChanged: (value) {
              if (state.isEditing) {
                bloc.add(OptionalFacebookEditSwitchChanged(value));
              } else {
                showCustomSnackBar(
                    context, "Please select edit button to edit");
              }
            },
          ),
        ],
      );
    },
  );
}

void showCustomSnackBar(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(title),
      duration: const Duration(seconds: 2),
    ),
  );
}

PopupMenuItem<int> _buildPopupMenuItem(
    String title, IconData iconData, int position) {
  return PopupMenuItem<int>(
    value: position,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          iconData,
          color: Colors.black,
        ),
        Text(title),
      ],
    ),
  );
}

void _onOptionSelected(BuildContext context, int value) {
  switch (value) {
    case 0: // Cancel
      context.read<EcostancePageBloc>().add(CancelEditEvent());
      break;
    case 1: // Previous Version
      context.read<EcostancePageBloc>().add(OptionSelected("Previous Version"));
      break;
    case 2: // Preview
      String slug =
          context.read<EcostancePageBloc>().state.response!.slug!.slug!;
      _launchUrl(Uri.parse("https://ecostance.marketsverse.com/preview/$slug"));
      break;
    case 3: // Defaults
      context.read<EcostancePageBloc>().add(OptionSelected("Defaults"));
      break;
    case 4: // Publish
      context.read<EcostancePageBloc>().add(OptionSelected("Publish"));
      break;
    case 5: // Save
      context.read<EcostancePageBloc>().add(OptionSelected("Save"));
      break;
    default:
      break;
  }
}

final Map<String, GlobalKey<FormState>> formKey = {
  "ecoStancePageKey": GlobalKey<FormState>(),
  "referralLinkKey": GlobalKey<FormState>(),
  "headingKey": GlobalKey<FormState>(),
  "descriptionKey": GlobalKey<FormState>(),
  "aboutKey": GlobalKey<FormState>(),
  "nameKey": GlobalKey<FormState>(),
};
final Map<String, FocusNode> nodes = {
  "ecoStancePageKey": FocusNode(),
  "referralLinkKey": FocusNode(),
  "headingKey": FocusNode(),
  "descriptionKey": FocusNode(),
  "aboutKey": FocusNode(),
  "nameKey": FocusNode(),
};

PreferredSize preferredSize(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(80.h),
    child: Container(
      color: AppColors.primaryInactive,
      margin: const EdgeInsets.only(top: 16),
      height: 45.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "My EcoStance Page",
              style: Theme.of(context).textTheme.caption?.copyWith(
                    fontWeight: FontWeight.w600,
                    letterSpacing: .5,
                    fontSize: 16,
                    color: AppColors.primaryActiveColor,
                  ),
            ),
          ),
          BlocBuilder<EcostancePageBloc, EcostancePageState>(
            builder: (context, state) {
              return state.isEditing
                  ? PopupMenuButton<int>(
                      icon: const Icon(Icons.more_vert),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                      ),
                      onSelected: (int value) {
                        _onOptionSelected(context, value);
                      },
                      itemBuilder: (context) => [
                        _buildPopupMenuItem('Cancel', Icons.cancel, 0),
                        _buildPopupMenuItem(
                            'Previous Version', Icons.skip_previous, 1),
                        _buildPopupMenuItem(
                            'Preview', Icons.remove_red_eye_rounded, 2),
                        _buildPopupMenuItem('Defaults', Icons.refresh, 3),
                        _buildPopupMenuItem('Publish', Icons.publish, 4),
                        _buildPopupMenuItem('Save', Icons.save_alt, 5),
                      ],
                    )
                  : IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        context.read<EcostancePageBloc>().add(EditEvent());
                      },
                    );
            },
          ),
        ],
      ),
    ),
  );
}

class FieldWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool switchValue;
  final bool isEnabled;
  final ValueChanged<String> onChanged;
  final ValueChanged<bool> onSwitchChanged;

  const FieldWidget({
    super.key,
    required this.label,
    required this.controller,
    required this.switchValue,
    required this.isEnabled,
    required this.onChanged,
    required this.onSwitchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  hintText: "Enter your ${label.toLowerCase()}",
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.1),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.1),
                      width: 0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.1),
                    ),
                  ),
                ),
                enabled: isEnabled,
                onChanged: onChanged,
              ),
            ),
            const SizedBox(width: 16),
            CupertinoSwitch(
              value: switchValue,
              onChanged: onSwitchChanged,
              activeColor: AppColors.greenBtn,
              trackColor: AppColors.lightGrey,
            )
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
