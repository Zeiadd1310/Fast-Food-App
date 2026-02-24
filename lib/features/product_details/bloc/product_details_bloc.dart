import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_details_event.dart';
import 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc() : super(const ProductDetailsState()) {
    on<SelectSizeEvent>(_onSelectSize);
    on<ToggleAddonEvent>(_onToggleAddon);
  }

  void _onSelectSize(SelectSizeEvent event, Emitter<ProductDetailsState> emit) {
    emit(
      state.copyWith(
        selectedSize: event.size,
        selectedSizePrice: event.size == 'سنجل' ? 0.00 : 100.0,
      ),
    );
  }

  void _onToggleAddon(
    ToggleAddonEvent event,
    Emitter<ProductDetailsState> emit,
  ) {
    final addons = List<String>.from(state.selectedAddons);
    double addonsPrice = state.addonsPrice;

    if (addons.contains(event.addon)) {
      addons.remove(event.addon);
      addonsPrice -= event.price;
    } else {
      addons.add(event.addon);
      addonsPrice += event.price;
    }

    emit(state.copyWith(selectedAddons: addons, addonsPrice: addonsPrice));
  }
}
