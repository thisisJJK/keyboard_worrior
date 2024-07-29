import 'package:flutter/material.dart';
import 'package:keyboard_warrior/data/model';
import 'package:keyboard_warrior/service/color_service.dart';
import 'package:keyboard_warrior/ui/mode/base/base_view.dart';
import 'package:keyboard_warrior/ui/mode/proverb/proverb_view_model.dart';
import 'package:keyboard_warrior/ui/mode_select/mode_selected_view.dart';

class ProverbView extends StatefulWidget {
  const ProverbView({super.key});

  @override
  State<ProverbView> createState() => _ProverbViewState();
}

class _ProverbViewState extends State<ProverbView> {
  ProverbViewModel proverbViewModel = ProverbViewModel();

  @override
  Widget build(BuildContext context) {
    final ColorService colorService = ColorService();
    return BaseView(
      name: Mode.proverb.name,
      viewModel: proverbViewModel,
      builder: (context, viewModel) {
        return FutureBuilder<List<Proverb>>(
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
              final proverbItems = snapshot.data!;

              return ListView.builder(
                itemBuilder: (context, index) {
                  final proverb = proverbItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Card(
                        color: colorService.cardBackgroundColor,
                        child: ListTile(
                          title: Text(proverb.content),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: proverbItems.length,
              );
            }
          },
        );
      },
    );
  }
}
