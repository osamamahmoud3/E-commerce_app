part of 'category_cubit.dart';

@immutable
abstract class CategoryCubitState {}

class CategoryCubitInitial extends CategoryCubitState {}

class CategoryCubitLoading extends CategoryCubitState {}

class CategoryCubitSucess extends CategoryCubitState {
  final List<CategoryEntity> categories;
  CategoryCubitSucess({required this.categories});
}

class CategoryCubitFailure extends CategoryCubitState {
  final String message;
  CategoryCubitFailure({required this.message});
}
