class ProductDetailsState {
  final String? selectedSize;
  final double selectedSizePrice;
  final List<String> selectedAddons;
  final double addonsPrice;
  final double basePrice;

  const ProductDetailsState({
    this.selectedSize,
    this.selectedSizePrice = 0.0,
    this.selectedAddons = const [],
    this.addonsPrice = 0.0,
    this.basePrice = 120.00,
  });

  double get totalPrice => basePrice + selectedSizePrice + addonsPrice;

  ProductDetailsState copyWith({
    String? selectedSize,
    double? selectedSizePrice,
    List<String>? selectedAddons,
    double? addonsPrice,
  }) {
    return ProductDetailsState(
      selectedSize: selectedSize ?? this.selectedSize,
      selectedSizePrice: selectedSizePrice ?? this.selectedSizePrice,
      selectedAddons: selectedAddons ?? this.selectedAddons,
      addonsPrice: addonsPrice ?? this.addonsPrice,
      basePrice: basePrice,
    );
  }
}
