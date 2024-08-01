import 'package:design_app/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;

    var d = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          d!.foodTitle,
          style: TextStyle(fontFamily: "Pacifico", color: textColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(screenHeight / 44),
            child: Image.asset("images/et_sote.jpg"),
          ),
          SizedBox(height: screenHeight / 14),
          Padding(
            padding: EdgeInsets.all(screenHeight / 44),
            child: Row(
              children: [
                Text(
                  d.foodName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth / 18,
                    color: textColor2,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth / 25),
            child: Row(
              children: [
                Text(
                  d.foodType,
                  style: TextStyle(
                    fontSize: screenWidth / 22,
                    color: textColor2,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: screenWidth / 25, top: screenHeight / 88),
            child: Row(
              children: [
                Text(
                  d.foodPrice,
                  style: TextStyle(
                    fontSize: screenWidth / 22,
                    color: textColor2,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: screenWidth / 25, top: screenHeight / 88),
            child: Row(
              children: [
                Text(
                  d.foodDescription,
                  style: TextStyle(
                    fontSize: screenWidth / 22,
                    color: textColor3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight / 28),
          Padding(
            padding:
                EdgeInsets.only(left: screenWidth / 25, top: screenHeight / 88),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    fixedSize: Size(screenWidth - 32, screenHeight / 14),
                    backgroundColor: mainColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  child: Text(
                    d.buttonText,
                    style: TextStyle(color: textColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}