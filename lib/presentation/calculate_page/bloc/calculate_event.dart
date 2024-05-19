part of 'calculate_bloc.dart';

@freezed
class CalculateEvent with _$CalculateEvent {
  const factory CalculateEvent.started() = Started;
  const factory CalculateEvent.noOfPeopleChanged(int noOfPeople) =
      NoOfPeopleChanged;

  const factory CalculateEvent.noOfPeopleUsingTransportChanged(
      int noOfPeopleUsingTransport) = NoOfPeopleUsingTransportChanged;

  const factory CalculateEvent.incomeChanged(double incomeValue) =
      IncomeChanged;
  const factory CalculateEvent.airTravelChanged(double airTravelValue) =
      AirTravelChanged;
  const factory CalculateEvent.houseSizeChanged(double houseSizeValue) =
      HouseSizeChanged;

  const factory CalculateEvent.meatEggFishChanged(double meatEggFishValue) =
      MeatEggFishChanged;

  const factory CalculateEvent.percentageSliderChanged(
      double percentageSliderValu) = PercentageSliderChanged;

  const factory CalculateEvent.selectedCountryChanged(
      CountryModal? countryModal) = SelectedCountryChanged;

  const factory CalculateEvent.getLeastProduct() = GetLeastProduct;

  const factory CalculateEvent.saveEmissionInServer(double emission) =
      CalculateEventSaveEmissionInServer;

  const factory CalculateEvent.saveEmissionInServerOnClick(double emission) =
      CalculateEventSaveEmissionInServerOnClick;

  // const factory CalculateEvent.addEmissionTOState(CarbonCalculationsResponseModal data) =
  // CalculateEventaddEmissionTOState;
  const factory CalculateEvent.fetchEmissionData() =
      CalculateEventfetchEmissionData;
}
