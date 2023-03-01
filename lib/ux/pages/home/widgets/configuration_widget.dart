import 'package:flutter/material.dart';
import 'package:flutter_algo_visualizer/utils/screen_size.dart';
import 'package:flutter_algo_visualizer/ux/providers/page_provider.dart';
import 'package:provider/provider.dart';

class ConfigurationWidget extends StatelessWidget {
  const ConfigurationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return deviceScreenType(MediaQuery.of(context).size.width) ==
            DeviceScreenType.desktop
        ? const _ConfigurationWidgetDesktop()
        : const _ConfigurationWidgetMobile();
  }
}

class _ConfigurationWidgetMobile extends StatelessWidget {
  const _ConfigurationWidgetMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CategorySelector();
  }
}

class _ConfigurationWidgetDesktop extends StatelessWidget {
  const _ConfigurationWidgetDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Configuration',
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(
          height: 32,
        ),
        const CategorySelector(),
      ],
    );
  }
}

class CategorySelector extends StatelessWidget {
  const CategorySelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PagesProvider>(
      builder: (_, categoryProvider, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Text('Category:', style: Theme.of(context).textTheme.caption),
            ),
            DropdownButton<String>(
              hint: const Text('Category'),
              value: categoryProvider.categoryKey,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              underline: Container(
                height: 2,
                color: Colors.black87,
              ),
              onChanged: (String? newValue) {
                categoryProvider.changeKey(newValue ?? '');
              },
              items: <String>[
                'Search',
                'Sort',
              ].map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            ),
          ],
        );
      },
    );
  }
}
