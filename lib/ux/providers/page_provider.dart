import 'package:flutter/material.dart';
import 'package:flutter_algo_visualizer/providers/search/binary_search_provider.dart';
import 'package:flutter_algo_visualizer/providers/search/linear_search_provider.dart';
import 'package:flutter_algo_visualizer/providers/sort/bubble_sort_provider.dart';
import 'package:flutter_algo_visualizer/providers/sort/insertion_sort_provider.dart';
import 'package:flutter_algo_visualizer/providers/sort/quick_sort_provider.dart';
import 'package:flutter_algo_visualizer/providers/sort/selection_sort_provider.dart';
import 'package:flutter_algo_visualizer/ux/pages/search_page.dart';
import 'package:flutter_algo_visualizer/ux/pages/sort_page.dart';

class PagesProvider extends ChangeNotifier {
  String categoryKey = 'Search';

  final _searchPages = [
    const SearchPage<LinearSearchProvider>(title: 'Linear Search'),
    const SearchPage<BinarySearchProvider>(title: 'Binary Search'),
  ];
  final _sortPages = [
    const SortPage<SelectionSortProvider>(title: 'Selection Sort'),
    const SortPage<QuickSortProvider>(
      title: 'Quick Sort',
      blockSize: 70,
    ),
    const SortPage<BubbleSortProvider>(title: 'Bubble Sort'),
    const SortPage<InsertionSortProvider>(
      title: 'Insertion Sort',
    ),
  ];

  void changeKey(String key) {
    categoryKey = key;
    notifyListeners();
  }

  List<StatelessWidget> get pages {
    // if (categoryKey == 'Search') {
    //   return
    // }
    switch (categoryKey) {
      case 'Search':
        return _searchPages;

      case 'Sort':
        return _sortPages;

      default:
        return _searchPages;
    }
  }
}
