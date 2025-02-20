import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myapp/colors.dart';
import 'package:myapp/dimensions.dart';
import 'package:myapp/pages/home/tech_page_body.dart';
import 'package:myapp/widgets/big_text.dart';
import 'package:myapp/widgets/small_text.dart';

import '../search_page/search_page.dart';

class MainFoodPage extends StatelessWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 2, top: 40, right: 2, bottom: 40),
        padding: EdgeInsets.only(left: 2, right: 2),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(
                      color: Color(0xFF123650),
                      text: '  Cousine      ',
                      size: 24,
                    ),
                    Row(
                      children: [
                        SmallText(
                          color: Color(0xFF123650),
                          text: 'USA',
                          size: 15,
                        ),
                        Icon(
                          Icons.arrow_drop_down_rounded,
                          size: 30,
                          color: Color(0xFF123650),
                        ),
                      ],
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    child: InkWell(
                      onTap: (){
                        Get.to(SearchPage());
                      },
                      child: Icon(
                        Icons.search_sharp,
                        color: Color(0xFF123650),
                      ),
                    ),
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFFC1C4C7),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(child: SingleChildScrollView(
               child: TechPPageBody(),
            ))
          ],
        ),
      ),
    );
  }
}
