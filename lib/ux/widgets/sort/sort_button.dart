import 'package:flutter/material.dart';
import 'package:flutter_algo_visualizer/providers/sort/sort_provider.dart';
import 'package:provider/provider.dart';

class SortButton<T extends SortProvider> extends StatelessWidget {
  const SortButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Selector<T, bool>(
        selector: (_, provider) => provider.isSorting,
        builder: (_, isSorting, child) {
          return ElevatedButton(
            child: child,
            onPressed: isSorting
                ? null
                : () {
                    Provider.of<T>(context, listen: false).sort();
                  },
          );
        },
        child: const Text('Sort', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
