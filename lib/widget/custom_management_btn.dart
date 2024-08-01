import 'package:flutter/material.dart';
import 'package:keyboard_warrior/service/color_service.dart';
import 'package:keyboard_warrior/service/lang_service.dart';
import 'package:keyboard_warrior/service/theme_service.dart';
import 'package:provider/provider.dart';

class CustomManagementBtn extends StatelessWidget {
  const CustomManagementBtn({super.key});

  @override
  Widget build(BuildContext context) {
    LangService langService = context.watch<LangService>();
    final size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {
          //목록뷰로 이동
        },
        child: SizedBox(
          height: size.height * 0.09,
          width: size.width * 0.85,
          child: Card(
            color: ColorService.viridian,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.add),
                  Text(
                    langService.isKor ? '추가 & 편집' : 'Add & Edit',
                    style: TextStyle(
                      color: context.appTheme.color.powerTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
