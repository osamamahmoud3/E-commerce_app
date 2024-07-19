import '../../../domin/home_entites/category_entity.dart';
import '../../models/categories.model.dart';

List<CategoryEntity> mappingCategoryReposnse(Map<String, dynamic> response) {
  List<CategoryEntity> categories = [];
  for (var category in response['data']['data']) {
    categories.add(Categories.fromJson(category));
  }
  return categories;
}
