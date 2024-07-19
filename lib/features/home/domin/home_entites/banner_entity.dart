import 'package:hive/hive.dart';
part 'banner_entity.g.dart';

@HiveType(typeId: 3)
class BannerEntity {
  @HiveField(0)
  final int bannerId;
  @HiveField(1)
  final String bannerImage;
  BannerEntity({required this.bannerId, required this.bannerImage});
}
