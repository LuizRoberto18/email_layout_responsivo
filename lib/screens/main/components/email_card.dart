import 'package:flutter/material.dart';
import 'package:whats_fake_responsivo/models/email.dart';

import '../../../constants.dart';
import '../../../extensions.dart';

class EmailCard extends StatelessWidget {
  final bool isActive;
  final Email? email;
  final VoidCallback? press;

  const EmailCard({
    Key? key,
    this.isActive = true,
    this.email,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
      child: InkWell(
        onTap: press,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                color: isActive ? kPrimaryColor : kBgDarkColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 32,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(email!.image!),
                        ),
                      ),
                      SizedBox(width: kDefaultPadding / 2),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: "${email!.name!} \n",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: isActive ? Colors.white : kTextColor,
                            ),
                            children: [
                              TextSpan(
                                text: email!.subject!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      color:
                                          isActive ? Colors.white : kTextColor,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            email!.time!,
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: isActive ? Colors.white70 : null,
                                    ),
                          ),
                          SizedBox(height: 5),
                          if (email!.isAttachmentAvailable!)
                            Icon(
                              Icons.attach_file_sharp,
                              color: isActive ? Colors.white70 : kGrayColor,
                            ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: kDefaultPadding / 2),
                  Text(
                    email!.body!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: isActive ? Colors.white70 : null,
                          height: 1.5,
                        ),
                  ),
                ],
              ),
            ).addNeumorphism(
              borderRadius: 15,
              blurRadius: 15,
              offset: Offset(5, 5),
              topShadowColor: Colors.white60,
              bottomShadowColor: Color(0xFF234395).withOpacity(0.15),
            ),
            if (!email!.isChecked!)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kBadgeColor,
                  ),
                ).addNeumorphism(
                  blurRadius: 4,
                  borderRadius: 8,
                  offset: Offset(2, 2),
                ),
              ),
            if (email!.tagColor! != null)
              Positioned(
                top: 0,
                left: 8,
                child: Icon(
                  Icons.bookmark,
                  color: email!.tagColor!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
