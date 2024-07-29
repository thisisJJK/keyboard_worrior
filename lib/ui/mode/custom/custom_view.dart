import 'package:flutter/material.dart';
import 'package:keyboard_warrior/data/model';
import 'package:keyboard_warrior/service/color_service.dart';
import 'package:keyboard_warrior/ui/mode/base/base_view.dart';
import 'package:keyboard_warrior/ui/mode/custom/custom_view_model.dart';
import 'package:keyboard_warrior/ui/mode_select/mode_selected_view.dart';
import 'package:keyboard_warrior/widget/custom_management_card.dart';

class CustomView extends StatefulWidget {
  const CustomView({super.key});

  @override
  State<CustomView> createState() => _ProverbViewState();
}

class _ProverbViewState extends State<CustomView> {
  CustomViewModel customViewModel = CustomViewModel();

  @override
  Widget build(BuildContext context) {
    final ColorService colorService = ColorService();
    return BaseView(
      name: Mode.custom.name,
      viewModel: customViewModel,
      builder: (context, viewModel) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Column(
            children: [
              FutureBuilder<List<Custom>>(
                future: viewModel.loadPoem(),
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
                    final customItems = snapshot.data!;

                    return Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          final custom = customItems[index];
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: GestureDetector(
                              onTap: () {},
                              child: Card(
                                color: colorService.cardBackgroundColor,
                                child: ListTile(
                                  title: Text(custom.title),
                                  subtitle: Text(custom.content),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: customItems.length,
                      ),
                    );
                  }
                },
              ),
              const CustomManagementCard(),
            ],
          ),
        );
      },
    );
  }
}
