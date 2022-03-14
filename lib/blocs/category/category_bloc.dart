import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:ecommerece_app/blocs/repositories/category/category_repo.dart';
import 'package:ecommerece_app/model/model.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _streamSubscription;
  CategoryBloc(
    this._categoryRepository,
  ) : super(CategoryLoading()) {
    on<LoadCategories>(_onLoadCategories);
    on<UpdateCategories>(_onUpdateCategories);
  }

  void _onLoadCategories(event, Emitter<CategoryState> emit) {
    _streamSubscription?.cancel();
    _streamSubscription = _categoryRepository
        .getAllCategories()
        .listen((categories) => add(UpdateCategories(categories: categories)));
  }

  void _onUpdateCategories(event, Emitter<CategoryState> emit) {
    emit(CategoryLoaded(categories: event.categories));
  }
}
