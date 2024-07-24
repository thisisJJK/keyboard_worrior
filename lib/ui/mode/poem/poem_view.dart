import 'package:flutter/material.dart';
import 'package:keyboard_warrior/service/color_service.dart';
import 'package:keyboard_warrior/ui/mode/base/base_view.dart';
import 'package:keyboard_warrior/ui/mode/poem/poem_view_model.dart';
import 'package:keyboard_warrior/ui/mode_select/mode_selected_view.dart';

class PoemView extends StatefulWidget {
  const PoemView({super.key});

  @override
  State<PoemView> createState() => _PoemViewState();
}

class _PoemViewState extends State<PoemView> {
  final PoemViewModel poemViewModel = PoemViewModel();

  @override
  Widget build(BuildContext context) {
    final ColorService colorService = ColorService();
    return BaseView(
      name: Mode.poem.name,
      viewModel: poemViewModel,
      builder: (context, viewModel) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GestureDetector(
                onTap: () {},
                child: Card(
                  color: colorService.cardBackgroundColor,
                  child: const ListTile(
                    title: Text('제목'),
                    subtitle: Text('작가'),
                  ),
                ),
              ),
            );
          },
          itemCount: 3,
        );
      },
    );
  }
}
