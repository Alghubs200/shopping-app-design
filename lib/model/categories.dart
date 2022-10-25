import 'package:mvc_design/model/app_constant.dart';
import 'package:mvc_design/view/screens/home_screen.dart';

class ListCategory {
  ListCategory({
    required this.category,
  });

  final String category;

  static List<ListCategory> getListCategory() {
    return [
      ListCategory(
        category: AppConstant.electronic,
      ),
      ListCategory(
        category: AppConstant.mobile,
      ),
      ListCategory(
        category: AppConstant.headphone,
      ),
      ListCategory(
        category: AppConstant.mom_and_baby,
      ),
      ListCategory(
        category: AppConstant.laptop,
      ),
      ListCategory(
        category: AppConstant.fashion,
      ),
      ListCategory(
        category: AppConstant.smart_watch,
      ),
    ];
  }
}
