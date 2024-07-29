import 'package:flutter/material.dart';
import 'package:keyboard_warrior/service/theme_service.dart';
import 'package:keyboard_warrior/ui/mode/base/base_view_model.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseViewModel> extends StatelessWidget {
  const BaseView({
    super.key,
    required this.name,
    required this.viewModel,
    required this.builder,
  });
  final String name;
  final T viewModel;
  final Widget Function(
    BuildContext context,
    T viewModel,
  ) builder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.background,
      appBar: AppBar(
        backgroundColor: context.color.background,
        title: Text(name),
      ),
      body: ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<T>(
          builder: (context, viewModel, child) {
            return builder(
              context,
              viewModel,
            );
          },
        ),
      ),
    );
  }
}
