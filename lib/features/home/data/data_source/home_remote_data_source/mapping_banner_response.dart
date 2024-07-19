import '../../../domin/home_entites/banner_entity.dart';
import '../../models/banner.model.dart';

List<BannerEntity> mappingBannerResponse(Map<String, dynamic> response) {
  List<BannerEntity> banners = [];
  for (var banner in response['data']) {
    banners.add(BannerModel.fromJson(banner));
  }
  return banners;
}
