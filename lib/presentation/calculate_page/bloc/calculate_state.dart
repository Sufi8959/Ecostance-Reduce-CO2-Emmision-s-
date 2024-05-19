part of 'calculate_bloc.dart';

@freezed
class CalculateState with _$CalculateState {
  const factory CalculateState.initial(
      {required int noOfPeople,
      required int noOfPeopleUsingTransport,
//
      required double incomeValue,
      required double airTravelValue,
      required double houseSizeValue,
      required double meatEggFishValue,
//
      required int percentageSliderValue,
//
      required double calculatorResultValue,
//
      required double offsetValue,
//
      required double calculatedAmount,
//
      required CountryModal? selectedCountry,
      required CountryModal? selectedCountryLocal,
//
      required List<CountryModal> countries,
//
      required bool isLoading,
//
      required bool isProductLoading,
//
      required bool isCountryError,
//
      required ProductModal? productWithLeastPrice,
      required EmissionSavingStatus emissionSavingStatus,
      required bool emissionLoading,
      required bool userMadeAChange,
      String? errorMessage}) = _Initial;
}

enum EmissionSavingStatus { loading, failed, saved, initial }
