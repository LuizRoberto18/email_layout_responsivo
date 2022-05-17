import 'package:flutter/material.dart';

class Email {
  final String? image, name, subject, body, time;
  final bool? isAttachmentAvailable, isChecked;
  final Color? tagColor;

  Email({
    this.image,
    this.name,
    this.subject,
    this.body,
    this.time,
    this.isAttachmentAvailable,
    this.isChecked,
    this.tagColor,
  });
}

List<Email> emails = List.generate(
  demo_data.length,
  (index) => Email(
    name: demo_data[index]['name'],
    image: demo_data[index]['image'],
    subject: demo_data[index]['subject'],
    isAttachmentAvailable: demo_data[index]['isAttachmentAvailable'],
    isChecked: demo_data[index]['isChecked'],
    tagColor: demo_data[index]['tagColor'],
    time: demo_data[index]['time'],
    body: emailDemoText,
  ),
);

List<dynamic> demo_data = [
  {
    "name": "Elvia Atkins",
    "image": "assets/images/user_2.png",
    "subject": "Youy project has been evaluated",
    "isAttachmentAvailable": false,
    "isChecked": false,
    "tagColor": Color.fromARGB(255, 255, 6, 81),
    "time": "15:32"
  },
  {
    "name": "Lorena",
    "image": "assets/images/user_model.jpg",
    "subject": "Inspiration for our new home",
    "isAttachmentAvailable": false,
    "isChecked": false,
    "tagColor": Color.fromARGB(255, 136, 0, 113),
    "time": "9:58"
  },
  {
    "name": "Marvin Kiehn",
    "image": "assets/images/user_3.png",
    "subject": "Business-focused empowering the world",
    "isAttachmentAvailable": true,
    "isChecked": false,
    "tagColor": Color.fromARGB(255, 29, 5, 243),
    "time": "14:27",
  },
  {
    "name": "Domenic Bosco",
    "image": "assets/images/user_4.png",
    "subject": "The fastest way to Design",
    "isAttachmentAvailable": false,
    "isChecked": true,
    "tagColor": Color(0xFF23CF91),
    "time": "10:43"
  },
  {
    "name": "Apple",
    "image": "assets/images/user_1.png",
    "subject": "New job opportunities",
    "isAttachmentAvailable": true,
    "isChecked": false,
    "tagColor": Color.fromARGB(255, 250, 171, 0),
    "time": "9:58"
  },
  {
    "name": "Cuca beludo Bauch",
    "image": "assets/images/user_5.png",
    "subject": "New job opportunities",
    "isAttachmentAvailable": false,
    "isChecked": true,
    "tagColor": Color(0xFF3A6FF7),
    "time": "9:58"
  }
];

String emailDemoText =
    "Corporis illo provident. Sunt omnis neque et aperiam. Nemo ut dolorum fugit eum sed. Corporis illo provident. Sunt omnis neque et aperiam. Nemo ut dolorum fugit eum sed. Corporis illo provident. Sunt omnis neque et aperiam. Nemo ut dolorum fugit eum sed";
