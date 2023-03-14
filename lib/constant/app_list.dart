import 'package:net_pro_fan/model/about_us_model.dart';
import 'package:net_pro_fan/model/ambassador_model.dart';
import 'package:net_pro_fan/model/association_model.dart';
import 'package:net_pro_fan/model/chapter_activity_model.dart';
import 'package:net_pro_fan/model/chapter_model.dart';
import 'package:net_pro_fan/model/contact_us_model.dart';
import 'package:flutter/material.dart';
import 'package:net_pro_fan/model/content_model.dart';
import 'package:net_pro_fan/model/member_model.dart';
import 'package:net_pro_fan/model/member_activity_performed_model.dart';
import 'package:net_pro_fan/model/profile_model.dart';
import 'package:net_pro_fan/model/top_chapters_model.dart';
import 'package:net_pro_fan/model/top_members_model.dart';

class AppList {
  static const List<String> drawerList = [
    "Dashboard",
    "About Us",
    "Members",
    "Chapter Activity",
    "Resources",
    "Events",
    "Login",
    "Association",
    "Contact Us",
    "Log Out",
  ];
  static const List<String> companyLogoList = [
    "asset/image/companyLogo1.png",
    "asset/image/companyLogo2.png",
    "asset/image/companyLogo3.png",
    "asset/image/companyLogo4.png",
    "asset/image/companyLogo5.png",
    "asset/image/companyLogo6.png",
    "asset/image/companyLogo7.png",
    "asset/image/companyLogo8.png",
  ];
  static const List<String> steeringCommitteeMembersList = [
    "1. Chairperson- CEO, FSSAI",
    "2. Executive Director, SBCD, FSSAI",
    "3. Dr.Shrinivas Joshi, President, AOAC",
    "4. Dr.Jagmeet Madan , President IDA",
    "5. Dr. Sreejith Nandkumar , President, IMA-FSI",
    "6. Dr. Hemalatha, President, NSI",
    "7. Dr. Shrinivas Joshi, President, AoAC",
    "8. Dr. Prabodh Halde, Immediate Past president, AFST (I)",
    "9. Chef Manjit Singh Gill, President, IFCA",
    "10. Dr. Sanjay Rai, President, IPHA",
    "11. Dr. Dinesh Kumar, Vice President, NSI",
    "12. Mr. Manivvannan A, AFSTI representative",
    "13. Dr. Kapil Yadav,  Additional Professor, CCM, AIIMS, New Delhi",
    "14. Dr. Chandrakant Pandav, Regional Coordinator, Iodine Global Network (South Asia), President, ICCIDD, India",
    "15. Ms. Ishi Khosla, Nutrition Expert, Centre for Diet Counselling",
    "16. Ms. Ashi Kathuria, Senior Nutrition Specialist, Health, Nutrition & Population Global Practice, The World Bank",
    "17. Ms. Chandrika Bahadur, President, SDSN Association  ",
    "18. Dr. Biplab K Nandi, International Consultant, FAO",
    "19. Dr. P. C. Vijaya Kumar, President, IAPEN",
    "20. Chef Vijaya Bhaskaran, General Secretary, IFCA",
  ];

  static List<TopMembersModel> topMembersList = [
    TopMembersModel(
      slNo: 1,
      city: 'surat',
      nameOfMember: 'DR. Meenakshi bajaj',
      score: 101,
    ),
    TopMembersModel(
      slNo: 2,
      city: 'bhavnagar',
      nameOfMember: 'DR. Nimali singh',
      score: 102,
    ),
    TopMembersModel(
      slNo: 3,
      city: 'vadodara',
      nameOfMember: 'Prof. Rashmi Poojara	',
      score: 103,
    ),
  ];

  static List<TopChaptersModel> topChaptersList = [
    TopChaptersModel(
      slNo: 11,
      city: 'vadodara',
      score: 201,
    ),
    TopChaptersModel(
      slNo: 12,
      city: 'surat',
      score: 202,
    ),
    TopChaptersModel(
      slNo: 13,
      city: 'bhavnagar',
      score: 203,
    ),
  ];

  static List<AmbassadorModel> ambassadorList = [
    AmbassadorModel(
      slNo: 11,
      name: "Sonam Yadav",
      email: "sonam@gmail.com",
      organization: "STARWIZZ MULTI SERVICES PVT LTD",
    ),
    AmbassadorModel(
      slNo: 12,
      name: "Yogendra Singh	",
      email: "yogendra@gmail.com",
      organization: "BLUECRAFT AGRO PVT. LTD.",
    ),
    AmbassadorModel(
      slNo: 13,
      name: "SURENDER",
      email: "SURENDER@gmail.com",
      organization: "STARWIZZ MULTI SERVICES PVT LTD",
    ),
  ];

  static List<ChapterModel> chapterList = [
    ChapterModel(
      slNo: 11,
      nameOfMember: "Yogendra Patel",
      association: "STARWIZZ MULTI SERVICES PVT LTD",
      score: 111,
      chapterName: "Abc",
      contact: 6598748596,
    ),
    ChapterModel(
      slNo: 12,
      nameOfMember: "Akshay",
      association: "STARWIZZ MULTI SERVICES PVT LTD",
      score: 112,
      chapterName: "Xyz",
      contact: 9874859632,
    ),
    ChapterModel(
      slNo: 13,
      nameOfMember: "Mahendra",
      association: "STARWIZZ MULTI SERVICES PVT LTD",
      score: 113,
      chapterName: "Pqr",
      contact: 8956234174,
    ),
  ];

  static List<MemberModel> memberList = [
    MemberModel(
      slNo: 11,
      name: "Palak",
      organization: "QUALITY",
      email: "lovelychhabra07@gmail.com",
      professionalAssociation: '',
    ),
    MemberModel(
      slNo: 12,
      name: "Rashi Batra",
      organization: "HARYANA TEST HOUSE AND CONSULTANCY SERVICES	",
      email: "rashibatra10@gmail.com",
      professionalAssociation: 'INDIAN DIETETIC ASSOCIATION',
    ),
    MemberModel(
      slNo: 13,
      name: "Ankita Gupta",
      organization: "MDH",
      email: "ankitagupta888@gmail.com",
      professionalAssociation: 'INDIAN DIETETIC ASSOCIATION',
    ),
    MemberModel(
      slNo: 13,
      name: "Monika Bharti",
      organization: "KABITA FOODHOUSE INDIA PRIVATE LIMITED	",
      email: "monika.bharti22@gmail.com",
      professionalAssociation:
          'ASSOCIATION OF FOOD SCIENTISTS & TECHNOLOGISTS(INDIA)',
    ),
  ];

  static List<ProfileModel> profileList = [
    ProfileModel(
        name: "KIRUPA RAJALAKSHMI .S	",
        organization: "BIOSOME LIFESCIENCE PVT LTD	",
        email: "kirupamb1993@gmail.com",
        totalScore: 123),
  ];

  static List<MemberActivityPerformedModel> memberActivityPerformedList = [
    MemberActivityPerformedModel(
      activityName: "KIRUPA RAJALAKSHMI .S",
      activityCategory: "Abc",
      eventDate: "12-2-2021",
      slNo: 1,
      status: "Done",
    ),
    MemberActivityPerformedModel(
      activityName: "ISHA RAJALAKSHMI .S",
      activityCategory: "Pqr",
      eventDate: "2-12-2021",
      slNo: 2,
      status: "Pending",
    ),
    MemberActivityPerformedModel(
      activityName: "AKSH DIVYESH .S",
      activityCategory: "Xyz",
      eventDate: "12-2-2021",
      slNo: 3,
      status: "Done",
    ),
  ];
  static List<AssociationChapterModel> associationChapterList = [
    AssociationChapterModel(
      slNo: 1,
      chapterName: "Abc",
      chapterCity: "Surat",
      chapterState: "Gujarat",
      chapterStatus: "Pending",
      chapterCreatedBy: "Ansh Association",
      yourParticipationStatus: "Yes",
      action: "A",
    ),
    AssociationChapterModel(
      slNo: 2,
      chapterName: "Pqr",
      chapterCity: "Mumbai",
      chapterState: "Maharashtra",
      chapterCreatedBy: "Aksh Association",
      yourParticipationStatus: "No",
      chapterStatus: "Done",
      action: "B",
    ),
  ];

  static List<ContentModel> eventsYear2019List = [
    ContentModel(title: 'AFSTI', image: 'asset/image/afsti.png'),
    ContentModel(title: 'IMA', image: 'asset/image/ima.png'),
    ContentModel(title: 'IDA', image: 'asset/image/ida.png'),
    ContentModel(title: 'NSI', image: 'asset/image/nsi.png'),
    ContentModel(title: 'IFCA', image: 'asset/image/ifca.png'),
  ];

  static List<ContentModel> eventsYear2020List = [
    ContentModel(
      title:
          'Interactive session to discuss the role of NetProFaN amid COVID-19, 15th May, 2020',
      link:
          'https://eatrightindia.gov.in/NetProFaN/assets/netpro/events/NetProFaN%20COVID%20session.pdf',
    ),
  ];

  static List<ContentModel> eventsYear2021List = [
    ContentModel(
      title: 'Indi-Genius Food Challenge - Winners announced',
      link:
          'https://eatrightindia.gov.in/NetProFaN/assets/netpro/events/Winners%20List_Indi-Genius%20Food%20Challenge.pdf',
    ),
    ContentModel(
      title: 'Plant Protein Breakfast Recipe Competition - Winners announced',
      link:
          'https://eatrightindia.gov.in/NetProFaN/assets/netpro/events/List%20Winners%20Protein%20Competition.pdf',
    ),
    ContentModel(
      title: 'Plant Protein Breakfast Recipe Competition !',
      link:
          'https://eatrightindia.gov.in/NetProFaN/assets/netpro/events/World%20Protein%20Day.png',
    ),
    ContentModel(
      title:
          'Registrations for the National Low Salt Cooking Challenge starts from 27th January, 2021. Submit your ',
      link: 'https://eatrightindia.gov.in/hfss/nlscc/',
    ),
    ContentModel(
      title:
          'Participate in Indi Genius Food Challenge and get a chance to win exciting prizes !',
      link:
          'https://docs.google.com/forms/d/e/1FAIpQLSdU-ZZut6ja9NPv9c0mUkZV3QQfH_iGS058z2ab8HS7cMgVcw/viewform',
    ),
  ];

  static List<ContentModel> eventsYear2022List = [
    ContentModel(
      title: "Nature's Sweetness in Every Bite-Sweet Dish Challenge Award",
      link:
          'https://eatrightindia.gov.in/NetProFaN/assets/netpro/events/List%20of%20Winners_Final%20dessert%20challenge.pdf',
    ),
  ];

  static List<ContentModel> netProFanResourcesList = [
    ContentModel(
        title: 'NETPROFAN NEWSLETTER OCTOBER, 2020',
        link:
            'https://eatrightindia.gov.in/NetProFaN/assets/netpro/events/newsletter20_Oct2020.pdf'),
    ContentModel(
        title: 'NETPROFAN MANIFESTO, 2022',
        link:
            'https://eatrightindia.gov.in/NetProFaN/assets/netpro/events/NetProFaN-Manifesto-2022.pdf'),
  ];
  static List<ContentModel> fssaiResourcesBooksList = [
    ContentModel(
        title: 'The Yellow Books',
        link:
            'https://eatrightindia.gov.in/NetProFaN/assets/netpro/events/NetProFaN%20COVID%20session.pdf'),
    ContentModel(
        title: 'The Orange Books',
        link:
            'https://eatrightindia.gov.in/NetProFaN/assets/netpro/events/NetProFaN%20COVID%20session.pdf'),
    ContentModel(
        title: 'The Dart Books',
        link:
            'https://eatrightindia.gov.in/NetProFaN/assets/netpro/events/NetProFaN%20COVID%20session.pdf'),
    ContentModel(
        title: 'The Purple Books',
        link:
            'https://eatrightindia.gov.in/NetProFaN/assets/netpro/events/NetProFaN%20COVID%20session.pdf'),
    ContentModel(
        title: 'The Eat Right Playbook',
        link:
            'https://eatrightindia.gov.in/NetProFaN/assets/netpro/events/NetProFaN%20COVID%20session.pdf'),
    ContentModel(
        title: 'Grade wise Food Safety Magic box booklets',
        link:
            'https://eatrightindia.gov.in/NetProFaN/assets/netpro/events/NetProFaN%20COVID%20session.pdf'),
    ContentModel(
        title: 'Eat Right Mela guidance toolkit',
        link:
            'https://eatrightindia.gov.in/NetProFaN/assets/netpro/events/NetProFaN%20COVID%20session.pdf'),
  ];
  static List<ContentModel> fssaiResourcesPosterList = [
    ContentModel(image: 'asset/image/ima.png'),
    ContentModel(image: 'asset/image/afsti.png'),
    ContentModel(image: 'asset/image/ida.png'),
  ];

  static List<ChapterActivityModel> contentCreationList = [
    ChapterActivityModel(
      slNo: 1,
      personName: "N/A",
      email: "supreethasrini@gmail.com	",
      activityPerformed:
          "Contribute scientific articles for mass dissemination",
    ),
    ChapterActivityModel(
      slNo: 2,
      personName: "N/A",
      email: "rcmainde@gmail.com	",
      activityPerformed:
          "Develop new resource material such as books, video, posters etc.",
    ),
    ChapterActivityModel(
      slNo: 3,
      personName: "N/A",
      email: "deepasfsn@gmail.com	",
      activityPerformed:
          "Contribute scientific articles for mass dissemination",
    ),
  ];

  static List<ChapterActivityModel> trainingCapacityList = [
    ChapterActivityModel(
      slNo: 1,
      personName: "N/A",
      email: "tihsco@hotmail.com",
      activityPerformed:
          "Faculty development workshop for faculty, practicing professionals on Eat Right messages",
    ),
    ChapterActivityModel(
      slNo: 2,
      personName: "N/A",
      email: "FoSTaC training",
      activityPerformed:
          "Develop new resource material such as books, video, posters etc.",
    ),
  ];

  static List<ChapterActivityModel> massDessiminationList = [
    ChapterActivityModel(
      slNo: 1,
      personName: "N/A",
      email: "dhanupriya@gmail.com	",
      activityPerformed:
          "Contribute scientific articles for mass dissemination",
    ),
    ChapterActivityModel(
      slNo: 2,
      personName: "N/A",
      email: "namitapanagaria@gmail.com	",
      activityPerformed:
          "Develop new resource material such as books, video, posters etc.",
    ),
  ];

  static List<ChapterActivityModel> outReachActivityList = [
    ChapterActivityModel(
      slNo: 1,
      personName: "N/A",
      email: "rcmainde@gmail.com	",
      activityPerformed:
          "Contribute scientific articles for mass dissemination",
    ),
    ChapterActivityModel(
      slNo: 2,
      personName: "N/A",
      email: "tihsco@hotmail.com	",
      activityPerformed:
          "Develop new resource material such as books, video, posters etc.",
    ),
    ChapterActivityModel(
      slNo: 3,
      personName: "N/A",
      email: "tihsco@hotmail.com	",
      activityPerformed:
          "Develop new resource material such as books, video, posters etc.",
    ),
  ];

  static List<ContactUsModel> contactUsList = [
    ContactUsModel(
        icon: Icons.location_on_outlined,
        subTitle:
            'FDA Bhawan, Kotla Marg, near Bal Bhavan, ITO metro, New Delhi 110002.',
        title: 'Address Information',
        link:
            "https://www.google.com/maps/place/Food+Safety+and+Standards+Authority+of+India+(FSSAI)/@28.7880505,77.1382348,9.54z/data=!4m5!3m4!1s0x0:0xf036137df7286cd7!8m2!3d28.6324315!4d77.2353096?hl=en"),
    ContactUsModel(
        icon: Icons.call_outlined,
        subTitle: '+1800 11 2100',
        title: 'Phone number',
        link: 'tel:+1800 11 2100'),
    ContactUsModel(
        icon: Icons.email_outlined,
        subTitle: 'netprofan.eri@gmail.com',
        title: 'Mail',
        link: 'mailto:netprofan.eri@gmail.com.in?subject%20plugin'),
    ContactUsModel(
        icon: Icons.share_outlined,
        title: 'Stay In Touch',
        link:
            'https://www.facebook.com/groups/477946699616638/,https://twitter.com/netprofan'),
  ];

  static const List<String> aboutUsList = [
    "About",
    "Why NetProFaN",
    "Objectives",
    "Themes",
    "Rewards",
    "Pledges ",
    "Structure",
    "FAQ",
  ];

  static List<ContentModel> themeActionList = [
    ContentModel(title: 'Safe Food', image: 'asset/image/themes1.png'),
    ContentModel(
        title: 'Combat Food Adulteration', image: 'asset/image/themes2.png'),
    ContentModel(title: 'Healthy Diets', image: 'asset/image/themes3.png'),
    ContentModel(title: 'Food Fortification', image: 'asset/image/themes4.png'),
    ContentModel(
        title: 'Nutrition During First 1000 Days',
        image: 'asset/image/themes5.png'),
    ContentModel(title: 'No Food Waste', image: 'asset/image/themes6.png'),
  ];

  static List<AboutUsModel> pledgesList = [
    AboutUsModel(
        title: "IMA / IPHONE Member's",
        subTitle:
            'As a member of Indian Medical Association, will educate and counsel my patients, accompanying relatives, my staff & colleagues...',
        content: [
          'on hygiene and food safety.',
          'on ill-effects of consuming adlterated food and direct them to resources to check these food adulterants at home.',
          'on the importance of reducing fat, salt and sugar in diet and eating a balanced diet for good health.',
          'on the importance of including ingredients in the diet to reduce micronutrient.',
          'on the importance of eating healthy food and breastfeeding infants upto 2 years.',
          'on reducing food waste at home and share surplus food with those in need.',
        ]),
    AboutUsModel(
        title: "IDA / NSI Member's",
        subTitle:
            'The member of Indian Dietetic Association / Nutrition Society of India, will',
        content: [
          'stress on the importance of maintaining personal and surrounding hygiene to my clients & colleagues.',
          'demonstrate ways of checking common food adulterants using resources developed by FSSAI.',
          'educate people about healthy diets, encourage the adoption of healthy habits through behaviour change techniques and disseminate/create resources for the same.',
          'encourage people to buy for food products available in the market.',
          'educate pregnant and lactating mothers regarding healthy foods and locally made complementary food for infants;',
          'educate people on behaviour change strategies to reduce food waste such as portion control, best buying, storing and cooking practices.',
        ]),
    AboutUsModel(
        title: "AFST(I) Member's",
        subTitle:
            'The member of Association of Food Technologists and Scientists, will',
        content: [
          'on hygiene and food safety.',
          'on ill-effects of consuming adlterated food and direct them to resources to check these food adulterants at home.',
          'on the importance of reducing fat, salt and sugar in diet and eating a balanced diet for good health.',
          'on the importance of including ingredients in the diet to reduce micronutrient.',
          'on the importance of eating healthy food and breastfeeding infants upto 2 years.',
          'on reducing food waste at home and share surplus food with those in need.',
        ]),
    AboutUsModel(
        title: "AoAC Member's",
        subTitle:
            'The member of Association of Analytical Chemists, India Chapter will',
        content: [
          'stress on the importance of maintaining personal and surrounding hygiene to my clients & colleagues.',
          'demonstrate ways of checking common food adulterants using resources developed by FSSAI.',
          'educate people about healthy diets, encourage the adoption of healthy habits through behaviour change techniques and disseminate/create resources for the same.',
          'encourage people to buy for food products available in the market.',
          'educate pregnant and lactating mothers regarding healthy foods and locally made complementary food for infants;',
          'educate people on behaviour change strategies to reduce food waste such as portion control, best buying, storing and cooking practices.',
        ]),
    AboutUsModel(
        title: "Researchers / Professors Member's",
        subTitle: 'As a Researcher / Professor, will',
        content: [
          'As a member of Indian Medical Association, will educate and counsel my patients, accompanying relatives, my staff & colleagues...',
          'on hygiene and food safety.',
          'on ill-effects of consuming adlterated food and direct them to resources to check these food adulterants at home.',
          'on the importance of reducing fat, salt and sugar in diet and eating a balanced diet for good health.',
          'on the importance of including ingredients in the diet to reduce micronutrient.',
          'on the importance of eating healthy food and breastfeeding infants upto 2 years.',
          'on reducing food waste at home and share surplus food with those in need.',
        ]),
    AboutUsModel(
        title: "IFCA Member's",
        subTitle:
            'The member of Indian Federation of Culinary Associations, will',
        content: [
          'The member of Indian Dietetic Association / Nutrition Society of India, will',
          'stress on the importance of maintaining personal and surrounding hygiene to my clients & colleagues.',
          'demonstrate ways of checking common food adulterants using resources developed by FSSAI.',
          'educate people about healthy diets, encourage the adoption of healthy habits through behaviour change techniques and disseminate/create resources for the same.',
          'encourage people to buy for food products available in the market.',
          'educate pregnant and lactating mothers regarding healthy foods and locally made complementary food for infants;',
          'educate people on behaviour change strategies to reduce food waste such as portion control, best buying, storing and cooking practices.',
        ]),
  ];
  static List<AboutUsModel> aboutList = [
    AboutUsModel(title: 'Vision', content: [
      'To enable and empower 130 cr. citizens to have safe, nutritious and wholesome food . A healthy country is a prosperous country',
      'This is possible only when the entire food ecosystem rallies behind this cause – and not through only government directives and policing but definitely within a framework.',
      'It is a journey of inclusiveness, where every stakeholder has a role.',
      'To put a structure and shape to this thought, it is planned to create a platform of professional bodies associated with food and nutrition with FSSAI as the fulcrum.'
    ]),
    AboutUsModel(title: 'Mission', content: [
      'Provide technical inputs towards various food and nutrition efforts in the country.',
      'Outreach and engagement – direct to consumers, support government programmes.',
      'Professional development of members.'
    ]),
    AboutUsModel(title: 'Objective', content: [
      'Communicate scientific knowledge in the most appropriate manner with the citizens of all strata of the country.',
      'Document and disseminate the recent scientific knowledge and developments in the field of food and nutrition amongst its members.',
      'Develop and train a body of professionals in the field of food and nutrition.'
    ]),
  ];
}
