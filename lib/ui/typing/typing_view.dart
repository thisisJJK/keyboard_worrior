import 'package:flutter/material.dart';
import 'package:keyboard_warrior/service/theme_service.dart';
import 'package:keyboard_warrior/ui/base/base_view.dart';
import 'package:keyboard_warrior/ui/typing/typing_view_model.dart';

class TypingView extends StatefulWidget {
  final String title;
  final String content;
  const TypingView({
    super.key,
    required this.content,
    required this.title,
  });

  @override
  State<TypingView> createState() => _TypingViewState();
}

class _TypingViewState extends State<TypingView> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TypingViewModel typingViewModel =
        TypingViewModel(content: widget.content);
    typingViewModel.loadSentence(context);

    return BaseView(
      name: widget.title,
      viewModel: typingViewModel,
      builder: (context, viewModel) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              flex: 1,
              child: Card(
                color: context.appTheme.color.powerCardColor,
                child: const Center(
                  child: Text('timer & point'),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Card(
                color: context.appTheme.color.modeCardColor,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: viewModel.misspelingText(
                            viewModel.currentSentence,
                            textEditingController.text,
                          ),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: context.appTheme.color.text,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      TextField(
                        controller: textEditingController,
                        autofocus: true,
                        onChanged: (value) {
                          setState(
                            () {
                              if (viewModel.currentSentence == value) {
                                viewModel.checkInput(value);
                                viewModel.loadSentence(context);
                                textEditingController.clear();
                              }
                            },
                          );
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: viewModel.currentSentence,
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        viewModel.nextSentence,
                        style: TextStyle(
                          color: context.appTheme.color.text,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
