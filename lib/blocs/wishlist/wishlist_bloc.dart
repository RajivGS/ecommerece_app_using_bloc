import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/model.dart';
import '../../model/wishlist_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<WishlistEvent>((event, emit) {
      on<StartWishList>((event, emit) => _mapStartWishlistToState());
      on<AddWishlistProduct>(
          (event, emit) => _mapAddWishlistProductToState(event, state));
      on<RemoveWishlistProduct>(
          (event, emit) => _mapRemoveWishlistProductToState(event, state));
    });
  }
  Stream<WishlistState> _mapStartWishlistToState() async* {
    yield WishlistLoading();
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield const WishlistLoaded();
    } catch (_) {}
  }

  Stream<WishlistState> _mapAddWishlistProductToState(
    AddWishlistProduct event,
    WishlistState state,
  ) async* {
    if (state is WishlistLoaded) {
      try {
        yield WishlistLoaded(
            wishlist: WishList(
                products: List.from(state.wishlist.products)
                  ..add(event.product)));
      } catch (_) {}
    }
  }

  Stream<WishlistState> _mapRemoveWishlistProductToState(
    RemoveWishlistProduct event,
    WishlistState state,
  ) async* {
    if (state is WishlistLoaded) {
      try {
        yield WishlistLoaded(
            wishlist: WishList(
                products: List.from(state.wishlist.products)
                  ..remove(event.product)));
      } catch (_) {}
    }
  }
}
