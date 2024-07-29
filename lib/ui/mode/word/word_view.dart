import 'package:flutter/material.dart';
import 'package:keyboard_warrior/data/model';
import 'package:keyboard_warrior/service/theme_service.dart';
import 'package:keyboard_warrior/ui/detail/detail_bottom_sheet.dart';
import 'package:keyboard_warrior/ui/mode/base/base_view.dart';
import 'package:keyboard_warrior/ui/mode/word/word_view_model.dart';
import 'package:keyboard_warrior/ui/mode_select/mode_selected_view.dart';

class WordView extends StatefulWidget {
  const WordView({super.key});

  @override
  State<WordView> createState() => _ProverbViewState();
}

class _ProverbViewState extends State<WordView> {
  WordViewModel wordViewModel = WordViewModel();

  @override
  Widget build(BuildContext context) {
    return BaseView(
      name: Mode.word.name,
      viewModel: wordViewModel,
      builder: (context, viewModel) {
        return FutureBuilder<List<Word>>(
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
              final wordItems = snapshot.data!;

              return ListView.builder(
                itemBuilder: (context, index) {
                  final word = wordItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return DetailBottomSheet(
                              title: word.title,
                              content: word.content,
                            );
                          },
                        );
                      },
                      child: Card(
                        color: context.color.modeCardColor,
                        child: ListTile(
                          title: Text(word.content),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: wordItems.length,
              );
            }
          },
        );
      },
    );
  }
}
