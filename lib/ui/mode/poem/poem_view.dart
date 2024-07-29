import 'package:flutter/material.dart';
import 'package:keyboard_warrior/data/model';
import 'package:keyboard_warrior/service/theme_service.dart';
import 'package:keyboard_warrior/ui/detail/detail_bottom_sheet.dart';
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
    return BaseView(
      name: Mode.poem.name,
      viewModel: poemViewModel,
      builder: (context, viewModel) {
        return FutureBuilder<List<Poem>>(
          future: viewModel.loadPoem('kor'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data == null || !snapshot.hasData) {
              return const Center(
                child: Text('No data'),
              );
            } else {
              final poemItems = snapshot.data!;

              return ListView.builder(
                itemBuilder: (context, index) {
                  final poem = poemItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return DetailBottomSheet(
                                title: poem.title,
                                content: poem.content,
                              );
                            });
                      },
                      child: Card(
                        color: context.color.modeCardColor,
                        child: ListTile(
                          title: Text(poem.title),
                          subtitle: Text(poem.writer),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: poemItems.length,
              );
            }
          },
        );
      },
    );
  }
}
