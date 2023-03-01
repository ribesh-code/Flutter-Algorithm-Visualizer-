import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_algo_visualizer/providers/search/search_provider.dart';
import 'package:provider/provider.dart';

class Search<T extends SearchProvider> extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search<T>> createState() => _SearchState<T>();
}

class _SearchState<T extends SearchProvider> extends State<Search<T>> {
  final searchController = TextEditingController();

  void _search() {
    try {
      final val = int.parse(searchController.text);
      Provider.of<T>(context, listen: false).search(value: val);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: TextField(
            controller: searchController,
            decoration: const InputDecoration(labelText: 'Value'),
            keyboardType: TextInputType.number,
          ),
        ),
        Selector<T, bool>(
          selector: (_, provider) => provider.isSearching,
          builder: (_, isSearching, child) {
            return ElevatedButton(
              onPressed: isSearching ? null : _search,
              child: child,
              style: const ButtonStyle(),
            );
          },
          child: const Text(
            'Search',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
