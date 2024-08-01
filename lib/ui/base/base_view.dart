import 'package:flutter/material.dart';
import 'package:keyboard_warrior/service/theme_service.dart';
import 'package:keyboard_warrior/ui/base/base_view_model.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseViewModel> extends StatelessWidget {
  const BaseView({
    super.key,
    required this.name,
    required this.viewModel,
    required this.builder,
    required this.icon,
    required this.onPressed,
  });
  final IconData icon;
  final Function() onPressed;
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
        actions: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              size: 30,
            ),
          )
        ],
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
