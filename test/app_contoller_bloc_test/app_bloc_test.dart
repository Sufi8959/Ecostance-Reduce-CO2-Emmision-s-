// import 'package:bloc_test/bloc_test.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:get_it/get_it.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:net_carbons/app/app_controller/app_controller_bloc.dart';
// import 'package:net_carbons/app/app_controller/state_classes/settings.dart';
// import 'package:net_carbons/app/network_info/network_info.dart';
// import 'package:net_carbons/data/all_countries/repository/repository.dart';
// import 'package:net_carbons/data/core/general/failiure.dart';
// import 'package:net_carbons/data/core/network/app_api.dart';
// import 'package:net_carbons/data/core/network/dio.dart';
// import 'package:net_carbons/data/user_profile/repository/repository.dart';
// import 'package:net_carbons/domain/countries/model/country_modal.dart';
//
// class MockNetworkInfoImplementer extends Mock
//     implements NetworkInfoImplementer {}
//
// class MockCountriesRepository extends Mock implements CountriesRepository {}
//
// class MockUserRepository extends Mock implements UserProfileRepository {}
//
// void main() async {
//  late MockCountriesRepository countriesRepository;
//   late MockUserRepository userRepository;
//
//   late AppControllerBloc appControllerBloc;
//   setUp(() async {
//     countriesRepository = MockCountriesRepository();
//     userRepository = MockUserRepository();
//     appControllerBloc = AppControllerBloc(
//       countriesRepository: countriesRepository,
//       userProfileRepository: userRepository,
//     );
//   });
//   test('initial state is correct', () {
//     expect(appControllerBloc.state, equals(
//     InitialAppControllerState(
//       countryModal: null,
//         isLoading: false,
//         countries: [],
//         currencyList: currencyList,
//         currency: '',
//         appCustomSettings: AppCustomSettings(notificationEnabled: false))));
//   });
//   test("Fetc countries", () async {
//     Future<Either<Failure, List<CountryModal>>> transformer(Invocation invocation) async{
//       return const Right([]);
//
//     }
//     when(countriesRepository.fetAllCountries).thenAnswer(transformer);
//
//     appControllerBloc.add(AppControllerEvent.fetchCountries());
//     expect(
//         appControllerBloc.state,
//         equals(AppControllerState.initial(
//             isLoading: false,
//             currency: "USD",
//             countries: [],
//             currencyList: currencyList,
//             appCustomSettings: AppCustomSettings(notificationEnabled: false), buildApp: false)));
//   });
// }
