import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:net_carbons/app/app_controller/app_controller_bloc.dart';
import 'package:net_carbons/data/product/repository/repository.dart';
import 'package:net_carbons/domain/home_products/modal/models.dart';
import 'package:net_carbons/domain/product/modal/review_modals.dart';

part 'product_details_bloc.freezed.dart';
part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final SingleProductRepository singleProductRepository;
  final AppControllerBloc appControllerBloc;

  ProductDetailsBloc({
    required this.singleProductRepository,
    required this.appControllerBloc,
  }) : super(_Initial(
            isLoading: false,
            productModal: ProductModal.empty(),
            hasError: false,
            productIds: [],
            currentId: '',
            currentProductReviews: [],
            reviewHasError: false,
            reviewLoading: false)) {
    appControllerBloc.stream.listen((event) {});

    on<ProductDetailsEventStarted>((event, emit) {
      return emit(state.copyWith(
          productIds: event.productIds,
          isLoading: true,
          productModal: ProductModal.empty()));
    });

    on<ProductDetailsEventLoadProductWithIndex>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      if (state.productIds.isEmpty) {
        emit(state.copyWith(
            isLoading: false, hasError: true, currentProductReviews: []));
        return;
      }
      final resp = await singleProductRepository.fetchProductData(
          state.productIds[event.index], appControllerBloc.state.currency);
      return resp.fold(
          (l) => emit(state.copyWith(
              isLoading: false,
              hasError: true,
              currentProductReviews: [],
              currentId: state.productIds[event.index])),
          (r) => emit(state.copyWith(
              isLoading: false,
              hasError: false,
              productModal: r,
              currentId: r.id,
              currentProductReviews: [])));
    });

    on<ProductDetailsEventGetReviews>((event, emit) async {
      emit(state.copyWith(reviewLoading: true, currentProductReviews: []));
      final res = await singleProductRepository.fetchReviews(event.productId);
      return res.fold(
          (l) => emit(state.copyWith(
                reviewHasError: true,
              )),
          (r) => emit(state.copyWith(
              reviewHasError: false,
              reviewLoading: false,
              currentProductReviews: r.data)));
    });

    on<ProductDetailsEventLoadProductWithId>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final resp = await singleProductRepository.fetchProductData(
          event.productId, appControllerBloc.state.currency);
      return resp.fold(
          (l) => emit(state.copyWith(isLoading: false, hasError: true)),
          (r) => emit(state.copyWith(
              isLoading: false, hasError: false, productModal: r)));
    });
    on<ProductDetailsEventViewComplete>((event, emit) => emit(_Initial(
        isLoading: false,
        productModal: ProductModal.empty(),
        hasError: false,
        productIds: [],
        currentId: '',
        currentProductReviews: [],
        reviewHasError: false,
        reviewLoading: false)));
  }
}
