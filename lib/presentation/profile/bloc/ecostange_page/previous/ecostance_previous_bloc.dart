// import 'package:bloc/bloc.dart';
// import 'package:net_carbons/presentation/profile/bloc/ecostange_page/ecostance_page_repository.dart';

// import '../../../../../app/utils/enums.dart';
// import 'ecostance_previous_event.dart';
// import 'ecostance_previous_state.dart';

// class EcostancePreviousBloc
//     extends Bloc<EcostancePreviousEvent, EcostancePreviousState> {
//   EcostancePageRepository repository = EcostancePageRepository();

//   EcostancePreviousBloc() : super(const EcostancePreviousState()) {
//     on<PreviousResponseFetched>(fetchPreviousApi);
//   }

//   Future<void> fetchPreviousApi(PreviousResponseFetched event,
//       Emitter<EcostancePreviousState> emit) async {
//     await repository.fetchPrevious().then((value) {
//       print('success');
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
