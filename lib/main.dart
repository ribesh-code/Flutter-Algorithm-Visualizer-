import 'package:flutter/material.dart';
import 'package:flutter_algo_visualizer/providers/search/binary_search_provider.dart';
import 'package:flutter_algo_visualizer/providers/search/linear_search_provider.dart';
import 'package:flutter_algo_visualizer/providers/sort/bubble_sort_provider.dart';
import 'package:flutter_algo_visualizer/providers/sort/insertion_sort_provider.dart';
import 'package:flutter_algo_visualizer/providers/sort/quick_sort_provider.dart';
import 'package:flutter_algo_visualizer/providers/sort/selection_sort_provider.dart';
import 'package:flutter_algo_visualizer/ux/pages/home/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Algorithms',
      debugShowCheckedModeBanner: false,
      // showPerformanceOverlay: true,
      home: Scaffold(
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => LinearSearchProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => BinarySearchProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => BubbleSortProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => InsertionSortProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => QuickSortProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => SelectionSortProvider(),
            )
          ],
          child: Home(),
        ),
      ),
    );
  }
}
