import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/app/constants/a3_a2.dart';
import 'package:net_carbons/app/dependency.dart';
import 'package:net_carbons/app/extensions.dart';
import 'package:net_carbons/data/all_countries/city_response/city.dart';
import 'package:net_carbons/data/all_countries/repository/repository.dart';
import 'package:net_carbons/presentation/app_widgets/csPicker/modals/country_state.dart';
import 'package:net_carbons/presentation/resources/color.dart';

import 'data/country.dart';

class StateCountrySelector extends StatefulWidget {
  const StateCountrySelector(
      {Key? key,
      required this.initialCountryIso3Code,
      required this.initialStateCode,
      required this.onCountryChanged,
      required this.onStateChanged,
      required this.onCityChanged,
      required this.initialCity,
      this.countryFormKey,
      this.stateFormKey,
      this.cityFormKey,
      this.countryFocusNode,
      this.stateFocusNode,
      this.cityFocusNode})
      : super(key: key);

  final String initialCountryIso3Code;
  final String initialStateCode;
  final String initialCity;

  final Function(CountryPickerModel?) onCountryChanged;
  final Function(Region?) onStateChanged;
  final Function(City?) onCityChanged;

  final GlobalKey<FormState>? countryFormKey;
  final GlobalKey<FormState>? stateFormKey;
  final GlobalKey<FormState>? cityFormKey;

  final FocusNode? countryFocusNode;
  final FocusNode? stateFocusNode;
  final FocusNode? cityFocusNode;

  ///country-state
  @override
  State<StateCountrySelector> createState() => _StateCountrySelectorState();
}

class _StateCountrySelectorState extends State<StateCountrySelector> {
  final countryRepo = getIt<CountriesRepository>();

  List<CountryPickerModel> countries = [];

  List<Region>? states;
  List<City>? cities = [];

  CountryPickerModel? selectedCountry;
  Region? selectedState;
  City? selectedCity;

  bool cityIsLoading = false;

  @override
  void initState() {
    initData();
    print("+s==s=s" + widget.initialCountryIso3Code);
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void initData() async {
    final countriesString = await readJson('country-state');

    countries = countriesListModalFromJson(countriesList);
    countries.sort((a, b) => a.countryName.compareTo(b.countryName));
    selectedCountry = countries.firstWhereOrNull((element) =>

        ///TODO: confirm country code
        element.countryShortCode ==
        countryCodesConvertA3ToA2(a3Code: widget.initialCountryIso3Code));

    if (selectedCountry != null) {
      widget.onCountryChanged(selectedCountry);
      states = selectedCountry!.regions;
      states?.sort((a, b) => a.name.compareTo(b.name));
      selectedState = states?.firstWhereOrNull(
        (element) => element.shortCode == widget.initialStateCode,
      );
      if (selectedState != null) {
        widget.onStateChanged(selectedState);
        await getCities();
        selectedCity = cities?.firstWhereOrNull(
          (element) => element.name == widget.initialCity,
        );
        if (selectedCity != null) {
          widget.onCityChanged(selectedCity);
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Country",
          style: Theme.of(context).textTheme.subtitle1,
        ),
        SizedBox(
          height: 9.h,
        ),
        SizedBox(
          width: double.maxFinite,
          child: Form(
            key: widget.countryFormKey,
            child: Center(
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField<CountryPickerModel>(
                  focusNode: widget.countryFocusNode,
                  validator: (value) =>
                      selectedCountry == null ? 'Country is required' : null,
                  isExpanded: true,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: 32.sp,
                  ),
                  hint: const Text(" Select a Country"),
                  value: selectedCountry,
                  isDense: true,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCountry = newValue;
                      selectedState = null;
                      selectedCity = null;
                      states = newValue?.regions ?? [];
                    });
                    widget.onCountryChanged(newValue);
                  },
                  items: countries.map((country) {
                    return DropdownMenuItem<CountryPickerModel>(
                      value: country,
                      child: Text(
                        country.countryName.length < 22
                            ? country.countryName
                            : "${country.countryName.substring(0, 21)}...",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: AppColors.primaryActiveColor),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 26.h,
        ),
        Text(
          "State",
          style: Theme.of(context).textTheme.subtitle1,
        ),
        SizedBox(
          height: 9.h,
        ),
        SizedBox(
          width: double.maxFinite,
          child: Form(
            key: widget.stateFormKey,
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<Region>(
                focusNode: widget.stateFocusNode,
                validator: (value) =>
                    selectedState == null ? 'State is required' : null,
                isExpanded: true,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 32,
                ),
                hint: const Text("Select your state"),
                value: selectedState,
                isDense: true,
                onChanged: (newValue) async {
                  setState(() {
                    selectedState = newValue;
                    cities = [];
                    selectedCity = null;
                  });
                  widget.onStateChanged(newValue);

                  await getCities();
                },
                items: states?.map((country) {
                  return DropdownMenuItem<Region>(
                    value: country,
                    child: Text(
                      country.name.length < 22
                          ? country.name
                          : "${country.name.substring(0, 21)}...",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: AppColors.primaryActiveColor),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 26.h,
        ),
        Text(
          "City",
          style: Theme.of(context).textTheme.subtitle1,
        ),
        SizedBox(
          height: 9.h,
        ),
        SizedBox(
          width: double.maxFinite,
          child: Form(
            key: widget.cityFormKey,
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<City>(
                onTap: () => widget.cityFormKey?.currentState?.validate(),
                focusNode: widget.cityFocusNode,
                validator: (value) =>
                    selectedCity == null ? 'City is required' : null,
                isExpanded: true,
                icon: Center(
                    child: cityIsLoading
                        ? const CupertinoActivityIndicator()
                        : Icon(
                            Icons.keyboard_arrow_down,
                            size: 30.sp,
                          )),
                hint: const Text("Select your City"),
                value: selectedCity,
                isDense: true,
                onChanged: (newValue) {
                  setState(() {
                    selectedCity = newValue;
                  });
                  widget.onCityChanged(newValue);
                },
                items: cities?.map((city) {
                  return DropdownMenuItem<City>(
                    value: city,
                    child: Text(
                      city.name ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: AppColors.primaryActiveColor),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> getCities() async {
    setState(() {
      cityIsLoading = true;
    });
    final res = await countryRepo.fetchCities(
        selectedCountry?.countryShortCode, selectedState?.shortCode);
    res.fold((l) {
      setState(() {
        cityIsLoading = false;
      });
    }, (r) {
      cities?.clear();

      setState(() {
        cities = r.cities;
        cities?.sort((a, b) => (a.name ?? '').compareTo(b.name ?? ''));
        cityIsLoading = false;
      });
    });
  }

  Future<String> readJson(String filename) async {
    final String response =
        await rootBundle.loadString('assets/json/$filename.json');
    return response;
  }
}
