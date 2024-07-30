import 'package:flutter/material.dart';
import 'package:keyboard_warrior/data/model';
import 'package:keyboard_warrior/service/lang_service.dart';
import 'package:keyboard_warrior/service/theme_service.dart';
import 'package:keyboard_warrior/ui/detail/detail_bottom_sheet.dart';
import 'package:keyboard_warrior/ui/base/base_view.dart';
import 'package:keyboard_warrior/ui/mode/custom/custom_view_model.dart';
import 'package:keyboard_warrior/ui/mode_select/mode_selected_view.dart';
import 'package:keyboard_warrior/widget/custom_management_btn.dart';
import 'package:provider/provider.dart';

class CustomView extends StatefulWidget {
  const CustomView({super.key});

  @override
  State<CustomView> createState() => _ProverbViewState();
}

class _ProverbViewState extends State<CustomView> {
  CustomViewModel customViewModel = CustomViewModel();

  @override
  Widget build(BuildContext context) {
    LangService langService = context.watch<LangService>();
    return BaseView(
      name: langService.isKor ? Mode.korCustom.name : Mode.engCustom.name,
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
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return DetailBottomSheet(
                                        title: custom.title,
                                        content: custom.content);
                                  },
                                );
                              },
                              child: Card(
                                color: context.color.modeCardColor,
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
              const CustomManagementBtn(),
            ],
          ),
        );
      },
    );
  }
}
