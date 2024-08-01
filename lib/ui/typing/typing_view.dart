import 'package:flutter/material.dart';
import 'package:keyboard_warrior/service/color_service.dart';
import 'package:keyboard_warrior/service/theme_service.dart';
import 'package:keyboard_warrior/ui/base/base_view.dart';
import 'package:keyboard_warrior/ui/typing/typing_view_model.dart';
import 'package:keyboard_warrior/widget/speed_card.dart';

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
  double _speed = 0.0;
  Duration _timer = Duration.zero;
  late TypingViewModel _typingViewModel;
  @override
  void initState() {
    _typingViewModel = TypingViewModel((speed) {
      setState(() {
        _speed = speed;
      });
    }, (timer) {
      setState(() {
        _timer = timer;
      });
    }, content: widget.content);
    _typingViewModel.loadSentence(context, _speed);
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    _typingViewModel.timerDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      name: widget.title,
      viewModel: _typingViewModel,
      builder: (context, viewModel) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 4,
            child: SpeedCard(
              speed: _speed,
              timer: _timer,
            ),
          ),
          Flexible(
            flex: 7,
            child: Card(
              color: context.appTheme.color.modeCardColor,
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _previousSentence(viewModel.previousSentence4),
                    _previousSentence(viewModel.previousSentence3),
                    _previousSentence(viewModel.previousSentence2),
                    _previousSentence(viewModel.previousSentence1),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: RichText(
                        text: TextSpan(
                          children: viewModel.misspelingText(
                            viewModel.currentSentence,
                            textEditingController.text,
                          ),
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: context.appTheme.color.text,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 11),
                      child: Text(
                        viewModel.nextSentence,
                        style: TextStyle(
                            color: context.appTheme.color.nexttext,
                            fontSize: 21,
                            fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: TextStyle(
                                color: ColorService.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                            controller: textEditingController,
                            autofocus: true,
                            onChanged: (value) {
                              viewModel.isStarted
                                  ? null
                                  : viewModel.startTyping();

                              viewModel.isKor
                                  ? viewModel.countJaso(value)
                                  : viewModel.countAlphabet(value);

                              setState(
                                () {
                                  if (viewModel.currentSentence == value) {
                                    viewModel.checkInput(value);
                                    textEditingController.clear();

                                    viewModel.loadSentence(context, _speed);
                                  }
                                },
                              );
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                  borderSide: BorderSide.none),
                              filled: true,
                              fillColor: Colors.grey[300],
                              hintText: viewModel.currentSentence,
                              hintStyle: TextStyle(
                                  color: context.appTheme.color.hinttext),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            textEditingController.clear();
                          },
                          icon: const Icon(Icons.clear),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _previousSentence(String text) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11),
        child: Text(
          text,
          style: TextStyle(
              color: context.appTheme.color.nexttext,
              fontSize: 21,
              fontWeight: FontWeight.w600),
        ),
      );
}
