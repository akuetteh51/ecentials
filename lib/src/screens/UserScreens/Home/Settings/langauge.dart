import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/lang.dart';
import 'package:ecentialsclone/src/Widgets/search.dart';
import 'package:flutter/material.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    final languages = [
      {
        "language": "English (Australia)",
        "country": "English (Australia)",
      },
      {
        "language": "English (Canada)",
        "country": "English (Canada)",
      },
      {
        "language": "English (India)",
        "country": "English (India)",
      },
      {
        "language": "English (Ireland)",
        "country": "English (Ireland)",
      },
      {
        "language": "English (New Zeeland)",
        "country": "English (New Zeeland)",
      },
      {
        "language": "English (Singapore)",
        "country": "English (Singapore)",
      },
      {
        "language": "English (South Africa)",
        "country": "English (South Africa)",
      },
      {
        "language": "English (US)",
        "country": "English (US)",
      },
      {
        "language": "Deutch",
        "country": "German",
      },
      {
        "language": "Italiano",
        "country": "Italiano",
      },
      {
        "language": "Nederlands",
        "country": "Dutch",
      },
    ];
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhiteColor,
        elevation: 0,
        foregroundColor: AppColors.primaryBlackColor,
        title: Text("Select Language"),
        centerTitle: true,
        bottom: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: AppColors.primaryWhiteColor,
          foregroundColor: AppColors.primaryBlackColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Search(
                height: 40,
                radius: 10,
                width: MediaQuery.of(context).size.width - 100,
                searchPressed: () {},
                micPressed: () {},
              ),
              TextButton(
                onPressed: () {},
                child: Text("Cancel"),
              )
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryGreyColor.withOpacity(.90),
              border: Border(
                top: BorderSide(
                  color: AppColors.primaryBlackColor.withOpacity(.10),
                  width: 1,
                  style: BorderStyle.solid,
                ),
                bottom: BorderSide(
                  color: AppColors.primaryBlackColor.withOpacity(.10),
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Text("LANGUAGES"),
          ),
          Column(
            children: List.generate(
              languages.length,
              (index) => Lang(
                onTap: () {},
                language: languages[index]['language'],
                country: languages[index]['country'],
              ),
              growable: true,
            ),
          )
        ],
      ),
    );
  }
}
