import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/color manager.dart';
import '../../../../core/resources/font weight manager.dart';
import '../../../../core/resources/style manager.dart';
import '../../../../core/utils/constants.dart';
import '../widgets/auth button.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(kAuthImage),
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to',
                  style: StyleManager.bigTextStyle(
                    fontSize: 20,
                    fontWeight: FontWeightManager.normalWeight,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Dribbox',
                  style: StyleManager.bigTextStyle(),
                ),
                const SizedBox(height: 14),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Congue bibendum pellentesque mauris, nibh senectus dignissim euismod diam. Sed arcu eget et, id arcu ultricies scelerisque nisl.',
                  style: StyleManager.smallTextStyle(),
                ),
                const SizedBox(height: 23),
                Text(
                  'Join for free.',
                  style: StyleManager.smallTextStyle(),
                ),
                const SizedBox(height: 46),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AuthButton(
                      icon: Icons.fingerprint,
                      text: 'Signup',
                      textColor: ColorManager.blueColor,
                      color: const Color.fromRGBO(236, 240, 252, 1.0),
                      onPressed: (){},
                    ),
                    const SizedBox(width: 14),
                    AuthButton(
                      icon: Icons.arrow_forward_ios,
                      text: 'Login ',
                      textColor: ColorManager.whiteColor,
                      color: ColorManager.blueColor,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
