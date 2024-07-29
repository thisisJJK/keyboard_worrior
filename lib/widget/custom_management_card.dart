import 'package:flutter/material.dart';
import 'package:keyboard_warrior/service/color_service.dart';

class CustomManagementCard extends StatelessWidget {
  const CustomManagementCard({super.key});

  @override
  Widget build(BuildContext context) {
    ColorService colorService = ColorService();
    final size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {
          //목록뷰로 이동
        },
        child: SizedBox(
          height: size.height * 0.09,
          width: size.width * 0.8,
          child: Card(
            color: colorService.customBackgroundColor,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.add),
                  Text(
                    '추가/편집',
                    style: TextStyle(
                      color: colorService.cardTextColor,
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
