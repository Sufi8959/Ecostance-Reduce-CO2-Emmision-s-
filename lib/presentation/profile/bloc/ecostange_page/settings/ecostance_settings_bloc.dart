// import 'package:bloc/bloc.dart';
// import 'package:net_carbons/presentation/profile/bloc/ecostange_page/ecostance_page_repository.dart';

// import '../../../../../app/utils/enums.dart';
// import 'ecostance_settings_event.dart';
// import 'ecostance_settings_state.dart';

// class EcostanceSettingsBloc
//     extends Bloc<EcostanceSettingsEvent, EcostanceSettingsState> {
//   EcostancePageRepository repository = EcostancePageRepository();

//   EcostanceSettingsBloc() : super(const EcostanceSettingsState()) {
//     on<MyPageResponseFetched>(fetchMyPageApi);
//   }

//   Future<void> fetchMyPageApi(
//       MyPageResponseFetched event, Emitter<EcostanceSettingsState> emit) async {
//     await repository.fetchMyPage().then((value) {
//       emit(state.copyWith(
//           status: ApiStatus.success, response: value, message: 'success'));
//     }).onError((error, stackTrace) {
//       print(error);
//       print(stackTrace);
//       emit(
//           state.copyWith(status: ApiStatus.failure, message: error.toString()));
//     });
//   }
// }
