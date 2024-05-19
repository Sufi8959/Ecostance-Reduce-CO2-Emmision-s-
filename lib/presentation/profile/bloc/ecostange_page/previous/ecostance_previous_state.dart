// import 'package:equatable/equatable.dart';
// import 'package:net_carbons/app/utils/enums.dart';
// import 'package:net_carbons/data/user_profile/ecostance_page/my_page/MyPageResponse.dart';
// import 'package:net_carbons/data/user_profile/ecostance_page/previous/PreviousResponse.dart';

// class EcostancePreviousState extends Equatable {
//   final ApiStatus status;
//   final PreviousResponse? response;
//   final String message;

//   const EcostancePreviousState({
//     this.status = ApiStatus.loading,
//     this.response, // Allow nullable response to be provided
//     this.message = "",
//   });

//   EcostancePreviousState copyWith(
//       {ApiStatus? status, PreviousResponse? response, String? message}) {
//     return EcostancePreviousState(
//         status: status ?? this.status,
//         response: response ?? this.response,
//         message: message ?? this.message);
//   }

//   @override
//   // TODO: implement props
//   List<Object?> get props => [status, response, message];
// }
