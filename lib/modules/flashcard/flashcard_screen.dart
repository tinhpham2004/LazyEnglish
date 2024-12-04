import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazy_english/core/constants/app_color.dart';
import 'package:lazy_english/core/constants/app_icon.dart';
import 'package:lazy_english/core/constants/app_text_theme.dart';
import 'package:lazy_english/core/utils/spaces.dart';
import 'package:lazy_english/core/widgets/appbar/appbar.dart';
import 'package:lazy_english/core/widgets/container/small_app_container.dart';
import 'package:lazy_english/core/widgets/flashcard/flashcard.dart';
import 'package:lazy_english/core/widgets/flashcard/models/flashcard_model.dart';
import 'package:lazy_english/gen/assets.gen.dart';

class FlashcardScreen extends StatefulWidget {
  FlashcardScreen({super.key});

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  int numSwipeLeft = 0;

  int numSwipeRight = 0;

  String jsonString = '''
  {
    "words": [
        {
            "name": "laconic",
            "ipa": "/ləˈkɒnɪk/",
            "meaning": "using very few words.",
            "example": "His laconic reply made it clear that he was uninterested in the conversation."
        },
        {
            "name": "gregarious",
            "ipa": "/ɡrɪˈɡɛəɹɪəs/",
            "meaning": "friendly, sociable, and outgoing.",
            "example": "She was a gregarious person, always the life of the party."
        },
        {
            "name": "esoteric",
            "ipa": "/ˌiːsəˈtɛrɪk/",
            "meaning": "secretive or intended for a small group of people with specialized knowledge.",
            "example": "The philosopher's ideas were so esoteric that only a few scholars truly understood them."
        },
        {
            "name": "magnanimous",
            "ipa": "/mæɡˈnænɪməs/",
            "meaning": "generous or forgiving, especially toward a rival or less powerful person.",
            "example": "Despite their rivalry, he was magnanimous in victory, praising his opponent's effort."
        },
        {
            "name": "malevolent",
            "ipa": "/məˈlɛvələnt/",
            "meaning": "having or showing a wish to do evil to others.",
            "example": "The villain's malevolent actions caused great harm to the community."
        },
        {
            "name": "abhorrent",
            "ipa": "/əbˈhɔːrənt/",
            "meaning": "extremely unpleasant or disgusting.",
            "example": "His abhorrent behavior made everyone in the room uncomfortable."
        },
        {
            "name": "quixotic",
            "ipa": "/kwɪkˈsɒtɪk/",
            "meaning": "exceedingly idealistic; unrealistic and impractical.",
            "example": "His quixotic plans for world peace were admirable, but not very practical."
        },
        {
            "name": "intermittent",
            "ipa": "/ˌɪntəˈmɪtənt/",
            "meaning": "occurring at irregular intervals; not continuous or steady.",
            "example": "The intermittent rain made it difficult to plan outdoor activities."
        },
        {
            "name": "impetuous",
            "ipa": "/ɪmˈpɛtjʊəs/",
            "meaning": "acting or done quickly and without thought or care.",
            "example": "His impetuous decision to quit his job without a backup plan caused him a lot of stress."
        },
        {
            "name": "banal",
            "ipa": "/bəˈnæl/",
            "meaning": "lacking originality or freshness; dull on account of overuse.",
            "example": "The movie was criticized for its banal plot, which had been seen many times before."
        },
        {
            "name": "blithe",
            "ipa": "/blaɪð/",
            "meaning": "showing a casual and cheerful indifference considered to be improper.",
            "example": "Her blithe disregard for the rules shocked everyone in the meeting."
        },
        {
            "name": "sanctimonious",
            "ipa": "/ˌsæntɪˈməʊnɪəs/",
            "meaning": "making a show of being morally superior to others.",
            "example": "His sanctimonious speech on the importance of honesty was hypocritical, as he had lied in the past."
        },
        {
            "name": "arduous",
            "ipa": "/ˈɑːdjuəs/",
            "meaning": "involving or requiring strenuous effort; difficult and tiring.",
            "example": "Climbing Mount Everest is an arduous task that requires great endurance."
        },
        {
            "name": "bovine",
            "ipa": "/ˈboʊvaɪn/",
            "meaning": "relating to or affecting cattle.",
            "example": "The veterinarian specialized in bovine diseases, often working with farmers."
        },
        {
            "name": "derisive",
            "ipa": "/dɪˈraɪsɪv/",
            "meaning": "expressing contempt or ridicule.",
            "example": "The comedian's derisive remarks about politicians made the audience laugh, but also think."
        }
    ]
}
  ''';

  List<FlashcardModel> flashcard = [];

  @override
  void initState() {
    flashcard = (jsonDecode(jsonString)['words'] as List<dynamic>)
        .map((word) => FlashcardModel.fromJson(word))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        title: Text(
          '${numSwipeLeft + numSwipeRight}/${flashcard.length}',
          style: textTheme.titleMedium,
        ),
      ),
      backgroundColor: AppColor.white,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmallAppContainer(
                title: numSwipeLeft.toString(),
                titleColor: AppColor.c_FFD92D20,
                backgroundColor: AppColor.c_FFFEF3F2,
                borderColor: AppColor.c_FFFEE4E2,
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                margin: EdgeInsets.only(left: 16.w),
              ),
              SmallAppContainer(
                title: numSwipeRight.toString(),
                titleColor: AppColor.c_FF16A34A,
                backgroundColor: AppColor.c_FFDCFCE7,
                borderColor: AppColor.c_FFF0FDF4,
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                margin: EdgeInsets.only(right: 16.w),
              ),
            ],
          ),
          spaceH16,
          Expanded(
            child: Flashcard(
              flashcards: flashcard,
              onSwipeLeftComplete: (p0) {
                setState(() {
                  numSwipeLeft++;
                });
              },
              onSwipeRightComplete: (p0) {
                setState(() {
                  numSwipeRight++;
                });
              },
            ),
          ),
          spaceH16,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              spaceW16,
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.c_FFE2E8F0),
                ),
                padding: EdgeInsets.all(8.w),
                child: AppIcon.arrowUpLeft,
              ),
              spaceW16,
              Text(
                'Quẹt bên trái để dánh dấu chưa thuộc',
                style: textTheme.bodyMedium!.copyWith(
                  color: AppColor.c_FF64748B,
                ),
              ),
              spaceW16,
            ],
          ),
          spaceH16,
        ],
      ),
    );
  }
}
