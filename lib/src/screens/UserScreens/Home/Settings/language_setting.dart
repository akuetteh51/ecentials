import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../../../Themes/colors.dart';
import '../../../../Themes/ecentials_icons_icons.dart';

class LanguageSettingScreen extends StatefulWidget {
  const LanguageSettingScreen({Key? key}) : super(key: key);

  @override
  _LanguageSettingScreenState createState() => _LanguageSettingScreenState();
}

class _LanguageSettingScreenState extends State<LanguageSettingScreen> {
  var languages = {
    "English (Australia)": "English (Australia)",
    "English (Canada)": "English (Canada)",
    "English (India)": "English (India)",
    "English (Ireland)": "English (Ireland)",
    "English (New Zealand)": "English (New Zealand)",
    "English (Singapore)": "English (Singapore)",
    "English (South Africa)": "English (South Africa)",
    "English (US)": "English (US)",
    "Deustch": "German",
    "Italiano": "Italiano",
    "Nederlands": "Dutch"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1),
              child: const Text(
                "Select Language",
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 20.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.68,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Neumorphic(
                      padding: const EdgeInsets.only(
                        left: 7,
                        right: 5,
                      ),
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(45)),
                        depth: -5,
                        // lightSource: LightSource.top,
                        color: Colors.white.withOpacity(0.1),
                      ),
                      child: TextField(
                        // controller: controller,
                        style: const TextStyle(fontSize: 16),
                        cursorColor: AppColors.primaryDeepColor,
                        decoration: InputDecoration(
                          icon: IconButton(
                            icon: Icon(
                              EcentialsIcons.search,
                              color: AppColors.primaryBlackColor,
                              size: 17.0,
                            ),
                            onPressed: () {},
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              EcentialsIcons.mic,
                              color: AppColors.primaryBlackColor,
                              size: 17.0,
                            ),
                            onPressed: () {},
                          ),
                          hintText: "Search ...",
                          iconColor: AppColors.primaryDeepColor,
                          focusColor: AppColors.primaryDeepColor,
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color.fromRGBO(0, 122, 255, 1)),
                  ),
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.09,
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(242, 242, 247, 1)),
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  top: MediaQuery.of(context).size.height * 0.05),
              child: const Text(
                "LANGUAGES",
                style: TextStyle(
                    color: Color.fromRGBO(109, 109, 113, 1),
                    fontFamily: 'Montserrat'),
              ),
            ),
            for (var language in languages.keys)
              Card(
                child: ListTile(
                  title: Text(languages[language]!),
                  subtitle: Text(language),
                ),
                elevation: 0,
                shape: const Border(
                    bottom:
                        BorderSide(color: Color.fromRGBO(199, 199, 204, 1))),
              ),
          ],
        ),
      ),
    );
  }
}
