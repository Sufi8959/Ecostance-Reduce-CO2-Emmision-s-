// import 'package:equatable/equatable.dart';
// import 'package:net_carbons/app/utils/enums.dart';
// import 'package:net_carbons/data/user_profile/ecostance_page/my_page/MyPageResponse.dart';

// class EcostanceSettingsState extends Equatable {
//   final ApiStatus status;
//   final MyPageResponse? response;
//   final String message;

//   const EcostanceSettingsState({
//     this.status = ApiStatus.loading,
//     this.response, // Allow nullable response to be provided
//     this.message = "",
//   });

//   EcostanceSettingsState copyWith(
//       {ApiStatus? status, MyPageResponse? response, String? message}) {
//     return EcostanceSettingsState(
//         status: status ?? this.status,
//         response: response ?? this.response,
//         message: message ?? this.message);
//   }

//   @override
//   // TODO: implement props
//   List<Object?> get props => [status, response, message];
// }
