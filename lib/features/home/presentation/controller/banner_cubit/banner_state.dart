part of 'banner_cubit.dart';

@immutable
abstract class BannerState {}

class BannerInitial extends BannerState {}

class BannerSuccess extends BannerState {
  final List<BannerEntity> banners;
  BannerSuccess({required this.banners});
}

class BannerFailure extends BannerState {
  final String message;
  BannerFailure({required this.message});
}

class BannerLoadibg extends BannerState {}
