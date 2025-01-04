import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cert_final/models/book_model.dart';

/// Events
abstract class ShoppingCartEvent {}

class AddToCartEvent extends ShoppingCartEvent {
  final BookModel book;
  AddToCartEvent(this.book);
}

class RemoveFromCartEvent extends ShoppingCartEvent {
  final BookModel book;
  RemoveFromCartEvent(this.book);
}

class IncreaseQuantityEvent extends ShoppingCartEvent {
  final BookModel book;
  IncreaseQuantityEvent(this.book);
}

class DecreaseQuantityEvent extends ShoppingCartEvent {
  final BookModel book;
  DecreaseQuantityEvent(this.book);
}

class ClearCartEvent extends ShoppingCartEvent {}

/// States
abstract class ShoppingCartState {}

class ShoppingCartInitial extends ShoppingCartState {}

class ShoppingCartUpdated extends ShoppingCartState {
  final List<BookModel> cartItems;
  final Map<BookModel, int> itemQuantities;
  ShoppingCartUpdated(this.cartItems, this.itemQuantities);
}

/// Bloc
class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  final List<BookModel> _cartItems = [];
  final Map<BookModel, int> _itemQuantities = {};

  ShoppingCartBloc() : super(ShoppingCartInitial()) {
    on<AddToCartEvent>((event, emit) {
      if (_itemQuantities.containsKey(event.book)) {
        _itemQuantities[event.book] = _itemQuantities[event.book]! + 1;
      } else {
        _cartItems.add(event.book);
        _itemQuantities[event.book] = 1;
      }
      emit(ShoppingCartUpdated(List.from(_cartItems), Map.from(_itemQuantities)));
    });

    on<RemoveFromCartEvent>((event, emit) {
      _cartItems.remove(event.book);
      _itemQuantities.remove(event.book);
      emit(ShoppingCartUpdated(List.from(_cartItems), Map.from(_itemQuantities)));
    });

    on<IncreaseQuantityEvent>((event, emit) {
      _itemQuantities[event.book] = _itemQuantities[event.book]! + 1;
      emit(ShoppingCartUpdated(List.from(_cartItems), Map.from(_itemQuantities)));
    });

    on<DecreaseQuantityEvent>((event, emit) {
      if (_itemQuantities[event.book]! > 1) {
        _itemQuantities[event.book] = _itemQuantities[event.book]! - 1;
      } else {
        _cartItems.remove(event.book);
        _itemQuantities.remove(event.book);
      }
      emit(ShoppingCartUpdated(List.from(_cartItems), Map.from(_itemQuantities)));
    });

    on<ClearCartEvent>((event, emit) {
      _cartItems.clear();
      _itemQuantities.clear();
      emit(ShoppingCartUpdated(List.from(_cartItems), Map.from(_itemQuantities)));
    });
  }
}
