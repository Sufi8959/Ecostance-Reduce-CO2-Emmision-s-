import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:net_carbons/app/app_controller/app_controller_bloc.dart';
import 'package:net_carbons/data/core/mapper/mapper.dart';
import 'package:net_carbons/data/home_products/repository/repository.dart';
import 'package:net_carbons/domain/home_products/modal/models.dart';
import 'package:net_carbons/presentation/home-products/widgets/sort_sheet_widget.dart';

import '../../../app/dependency.dart';
import '../../../data/all_countries/hive_modal/country_hive_modal.dart';
import '../../../data/all_countries/repository/repository.dart';
import '../../../domain/countries/model/country_modal.dart';

part 'products_bloc.freezed.dart';
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository productsRepository;
  final repository = getIt<CountriesRepository>();
  final AppControllerBloc appControllerBloc;

  late AppControllerState appControllerState;

  ProductsBloc(
      {required this.appControllerBloc, required this.productsRepository})
      : super(ProductsState.initial()) {
    appControllerState = appControllerBloc.state;

    appControllerBloc.stream.listen((event) {
      appControllerState = event;

      if (event.appControllerEventsType ==
          AppControllerEventsType.appControllerEventUpdateCurrency) {
        print(
            '${appControllerBloc.state.currency}  THis is the new app leavel currency');
        add(ProductsEvent.fetchInitialProducts());
      }
    });

    on<ChangeCurrency>((event, emit) async {
      print("ChangeCurrency ${event.newCurrency}");
      if (state.products.isNotEmpty) {
        emit(state.copyWith(
            products: state.products
                .map((e) => e.getWithUpdatedCurrency(event.newCurrency))
                .toList()));
      } else {


      }
    });

    on<EmitProducts>(
        (event, emit) => emit(state.copyWith(products: event.products)));


    on<Started>((event, emit) {

      if (state.products.isEmpty && !state.isLoading) {
        add(const ProductsEvent.fetchInitialProducts());
        return;
      }
    });
    on<ProductsEventfetchInitialProducts>((event, emit) async {
      if (state.isMoreLoading) {
        return;
      }
      emit(state.copyWith(isLoading: true));

      final result = await productsRepository.getProducts(
          appControllerBloc.state.currency, '', 1);

      return result.fold(
        (failure) {
          return emit(state.copyWith(
              hasError: true,
              isLoading: false,
              isMoreLoading: false,
              countryModal:
                  appControllerState.countryModal ?? CountryModal.empty(),
              countryAvailable:
                  appControllerState.countryModal?.countryCode != null,
              sortMode: ProductSortModes.defaultSort));
        },
        (data) {
          final products = data.products;
          return emit(state.copyWith(
            metadata: data.metadata,
            currentPage: data.metadata.currentPage,
            isLoading: false,
            isMoreLoading: false,
            hasMore: data.metadata.nextPage != null,
            products: [...products],
            hasError: false,
            countryModal:
                appControllerState.countryModal ?? CountryModal.empty(),
            countryAvailable:
                appControllerState.countryModal?.countryCode != null,
            sortMode: ProductSortModes.defaultSort,
          ));
        },
      );
    });
    on<ProductsEventfetchProducts>((event, emit) async {
      if (state.isLoading) {
        return;
      }
      if (!state.hasMore) {
        return;
      }

      if (state.metadata.nextPage == null) {
        return emit(state.copyWith(
          hasMore: false,
        ));
      }
      if (state.isMoreLoading) {
        return;
      }

      state.metadata.nextPage == 1
          ? emit(state.copyWith(isLoading: true))
          : emit(state.copyWith(isMoreLoading: true));
      print("ProductsEventfetchProducts");
      final result = await productsRepository.getProducts(
          appControllerBloc.state.currency, '', state.metadata.nextPage!);

      return result.fold(
        (failure) {
          return emit(state.copyWith(
              hasError: true,
              isLoading: false,
              isMoreLoading: false,
              countryModal:
                  appControllerState.countryModal ?? CountryModal.empty(),
              countryAvailable:
                  appControllerState.countryModal?.countryCode != null,
              sortMode: ProductSortModes.defaultSort));
        },
        (data) {
          final products = data.products;
          return emit(state.copyWith(
            metadata: data.metadata,
            currentPage: data.metadata.currentPage,
            isLoading: false,
            isMoreLoading: false,
            hasMore: data.metadata.nextPage != null,
            products: [...state.products, ...products],
            hasError: false,
            countryModal:
                appControllerState.countryModal ?? CountryModal.empty(),
            countryAvailable:
                appControllerState.countryModal?.countryCode != null,
            sortMode: ProductSortModes.defaultSort,
          ));
        },
      );
    });
    on<SortProducts>((event, emit) async {
      List<ProductModal> products = [...state.products];
      if (event.sortMode == ProductSortModes.defaultSort) {
        products.sort((a, b) => a.id.compareTo(b.id));
      } else if (event.sortMode == ProductSortModes.lowToHigh) {
        products.sort((a, b) =>
            a.priceList.first.price.compareTo(b.priceList.first.price));
      } else if (event.sortMode == ProductSortModes.highToLow) {
        products.sort((a, b) =>
            b.priceList.first.price.compareTo(a.priceList.first.price));
      }
      emit(state.copyWith(sortMode: event.sortMode, products: products));
    });
  }

}
