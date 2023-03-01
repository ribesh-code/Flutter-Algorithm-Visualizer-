import 'package:flutter/material.dart';
import 'package:flutter_algo_visualizer/utils/screen_size.dart';
import 'package:flutter_algo_visualizer/ux/providers/page_provider.dart';
import 'package:provider/provider.dart';

import 'widgets/category_switcher.dart';
import 'widgets/configuration_widget.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PagesProvider(),
      child: deviceScreenType(MediaQuery.of(context).size.width) ==
              DeviceScreenType.desktop
          ? const HomeDesktop()
          : const HomeMobile(),
    );
  }
}

class HomeMobile extends StatelessWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        ConfigurationWidget(),
        Expanded(
          child: CategorySwitcher(),
        )
      ],
    );
  }
}

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: const <Widget>[
          Expanded(
            child: ConfigurationWidget(),
          ),
          Expanded(
            child: CategorySwitcher(),
          ),
        ],
      ),
    );
  }
}
