import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:whats_fake_responsivo/components/side_menu_item.dart';
import 'package:whats_fake_responsivo/components/tags.dart';
import 'package:whats_fake_responsivo/constants.dart';
import 'package:whats_fake_responsivo/responsive.dart';
import '../extensions.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
      color: kBgLightColor,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/Logo Outlook.png",
                    width: 36,
                  ),
                  Spacer(),
                  if (!Responsive.isDesktop(context)) CloseButton(),
                ],
              ),
              SizedBox(height: kDefaultPadding),
              //trocar o tipo de butão
              FlatButton.icon(
                minWidth: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: kDefaultPadding,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: kPrimaryColor,
                onPressed: () {},
                icon: Icon(Icons.edit_sharp, color: Colors.white),
                label: Text(
                  "New message",
                  style: TextStyle(color: Colors.white),
                ),
              ).addNeumorphism(
                topShadowColor: Colors.white,
                bottomShadowColor: Color(0xFF234395).withOpacity(0.2),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              FlatButton.icon(
                      minWidth: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: kBgDarkColor,
                      onPressed: () {},
                      label: Text(
                        "Get Messages",
                        style: TextStyle(color: kTextColor),
                      ),
                      icon: Icon(Icons.file_download_outlined))
                  .addNeumorphism(),
              SizedBox(height: kDefaultPadding * 2),
              //Menu Item
              SideMenuItem(
                iconSrc: Icons.move_to_inbox_rounded,
                title: "inbox",
                press: () {},
                isActive: true,
                itemCount: 3,
              ),
              SideMenuItem(
                press: () {},
                title: "Sent",
                iconSrc: Icons.send_sharp,
                isActive: false,
              ),
              SideMenuItem(
                press: () {},
                title: "Drafts",
                iconSrc: Icons.file_copy_sharp,
                isActive: false,
              ),
              SideMenuItem(
                press: () {},
                title: "Deleted",
                iconSrc: Icons.delete_sharp,
                isActive: false,
                showBorder: false,
              ),
              SizedBox(height: kDefaultPadding),
              // Tags
              Tags(),
            ],
          ),
        ),
      ),
    );
  }
}
