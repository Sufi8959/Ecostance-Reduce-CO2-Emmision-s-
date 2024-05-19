import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:net_carbons/app/dependency.dart';
import 'package:net_carbons/domain/countries/i_repository.dart';
import 'package:net_carbons/domain/countries/model/country_modal.dart';

class MockCountryRepo extends Mock implements ICountriesRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpDep();
  late MockCountryRepo sut;

  setUp(() {
    sut = MockCountryRepo();
  });
  test("fetAllCountries", () async{
    expect(List<CountryModal>, []);
  });

}

