import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zetah_cv/data/dev_data.dart';
import 'package:zetah_cv/utils/app_strings.dart';
import 'package:zetah_cv/view/cv_view.dart';
import 'package:zetah_cv/widget/contact_card.dart';

class SecondView extends StatelessWidget {
  SecondView({super.key, required this.onNextPage});

    final VoidCallback onNextPage;
    final Uri _whatsappLaunchUri = Uri.parse("https://wa.me/3186110790");
    final Uri _githubLaunchUri = Uri.parse('https://github.com/${DevData.devData.github}');
    final Uri _emailLaunchUri = Uri.parse(DevData.devData.email);


  @override
  Widget build(BuildContext context) {
    // For Size responsive
    Size size = MediaQuery.of(context).size;

    // For Theme Data (Light/Dark)
    ThemeData theme = Theme.of(context);

    return SafeArea(
      child: Column(
        children: [

          /// Empty Space
          SizedBox(height: size.height * 0.04),

           /// Bio
          Container(
            margin: EdgeInsets.all(size.height * .01),
            padding: EdgeInsets.symmetric(
              horizontal: size.width * .03,
              vertical: size.height * .02,
            ),
            width: size.width,
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.secondScreenBio,
                  style: theme.textTheme.bodyLarge,
                ),
                Text(
                  DevData.devBio,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),

 /// Hobbies
          Container(
            margin: EdgeInsets.all(size.height * .01),
            padding: EdgeInsets.symmetric(
              horizontal: size.width * .03,
              vertical: size.height * .02,
            ),
            width: size.width,
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.secondScreenHobbies,
                  style: theme.textTheme.bodyLarge,
                ),
                SizedBox(
                  height: size.height * .01,
                ),
                SizedBox(
                    width: size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        DevData.devData.hobbies.length,
                        (index) => Text(
                          "$index. ${DevData.devData.hobbies[index]}",
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ))
              ],
            ),
          ),

          /// Contact
          Container(
            margin: EdgeInsets.all(size.height * .01),
            padding: EdgeInsets.symmetric(
              horizontal: size.width * .03,
              vertical: size.height * .02,
            ),
            width: size.width,
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.secondScreenContact,
                  style: theme.textTheme.bodyLarge,
                ),
                SizedBox(
                  height: size.height * .01,
                ),
                GestureDetector(
                  onTap: (() async {
                    launchUrl(_whatsappLaunchUri);
                  }),
                  child: const ContactCard(title: 'WhatsApp', icon: FontAwesomeIcons.whatsapp,)),
                
                GestureDetector(
                  onTap: (() async {
                    Uri(
                      scheme: 'mailto',
                      path: _emailLaunchUri.toString(),
                      queryParameters: {'subject': 'Hello from Flutter!'},
                    );
                  }),
                  child: ContactCard(title: DevData.devData.email, icon: Icons.mail,)),

                GestureDetector(
                  onTap: (() async {
                    launchUrl(_githubLaunchUri);
                  }),
                  child: ContactCard(title: DevData.devData.github, icon: FontAwesomeIcons.github,)),
                GestureDetector(
                  onTap:() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CvView()),
    );
  },
                  child: const ContactCard(title: 'Descargar CV', icon: FontAwesomeIcons.download,)),
              ],
            ),
          ),

          /// Empty Space
          Expanded(child: Container()),

          /// Next Page
          IconButton(
              color: theme.canvasColor,
              onPressed: onNextPage,
              icon: const Icon(Icons.arrow_upward_outlined)),

          // /// Empty Space
          SizedBox(
            height: size.height * 0.05,
          ),
        ],
      ),
    );
  }
}