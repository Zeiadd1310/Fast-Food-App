abstract class ProductDetailsEvent {}

class SelectSizeEvent extends ProductDetailsEvent {
  final String size;
  SelectSizeEvent(this.size);
}

class ToggleAddonEvent extends ProductDetailsEvent {
  final String addon;
  final double price;
  ToggleAddonEvent(this.addon, this.price);
}
