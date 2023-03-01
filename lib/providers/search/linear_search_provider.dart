import 'package:flutter_algo_visualizer/models/search_model.dart';
import 'package:flutter_algo_visualizer/providers/search/search_provider.dart';

class LinearSearchProvider extends SearchProvider {
  @override
  void search({int value = 34}) {
    super.search(value: value);
    _statSearch(numbers, value);
  }

  Future _statSearch(List<SearchModel> list, int target) async {
    for (var index = 0; index < list.length; index++) {
      potentialNode(index);
      await pause();
      if (numbers[index].value == target) {
        foundNode(index);
        return;
      } else {
        discardNode(index);
      }
    }
    nodeNotFound();
  }
}
