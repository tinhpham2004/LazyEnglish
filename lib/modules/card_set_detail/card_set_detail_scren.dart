import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazy_english/core/constants/app_color.dart';
import 'package:lazy_english/core/constants/app_icon.dart';
import 'package:lazy_english/core/constants/app_text_theme.dart';
import 'package:lazy_english/core/utils/spaces.dart';
import 'package:lazy_english/core/widgets/appbar/appbar.dart';
import 'package:lazy_english/core/widgets/button/app_button.dart';
import 'package:lazy_english/core/widgets/button/app_outline_button.dart';
import 'package:lazy_english/core/widgets/container/small_app_container.dart';
import 'package:lazy_english/core/widgets/flashcard/models/flashcard_model.dart';
import 'package:lazy_english/router/app_path.dart';

class CardSetDetailScren extends StatefulWidget {
  const CardSetDetailScren({super.key});

  @override
  State<CardSetDetailScren> createState() => _CardSetDetailScrenState();
}

class _CardSetDetailScrenState extends State<CardSetDetailScren> {
  bool _isBookmark = false;

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

  void _onBookmarkToggle() {
    setState(() {
      _isBookmark = !_isBookmark;
    });
  }

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
      backgroundColor: AppColor.white,
      appBar: Appbar(
        actions: [
          InkWell(
            onTap: () => _onBookmarkToggle(),
            child: _isBookmark ? AppIcon.bookmarkSelected : AppIcon.bookmark,
          ),
          spaceW16,
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bộ card Pro Max',
                      style: textTheme.titleLarge,
                    ),
                    spaceH16,
                    SizedBox(
                      height: 200.h,
                      child: ListView.separated(
                        itemBuilder: (context, index) => Container(
                          width: 300.w,
                          decoration: BoxDecoration(
                            color: AppColor.c_FFFBFCFD,
                            border: Border.all(
                              color: AppColor.c_FFE2E8F0,
                            ),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Center(
                            child: Text(
                              flashcard[index].name ?? '',
                              style: textTheme.bodyLarge,
                            ),
                          ),
                        ),
                        separatorBuilder: (context, index) => spaceW8,
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                      ),
                    ),
                    spaceH32,
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Từ vựng',
                                style: textTheme.titleLarge,
                              ),
                              spaceW8,
                              SmallAppContainer(
                                title: '${flashcard.length} từ',
                                titleColor: AppColor.c_FF004EEB,
                                backgroundColor: AppColor.c_FFF5F8FF,
                                borderColor: AppColor.c_FFE0EAFF,
                              ),
                            ],
                          ),
                          spaceH16,
                          SizedBox(
                            height: 250.h,
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColor.c_FFE2E8F0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  padding: EdgeInsets.all(8.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        flashcard[index].name ?? '',
                                        style: textTheme.titleSmall,
                                      ),
                                      spaceH8,
                                      Text(
                                        flashcard[index].meaning ?? '',
                                        style: textTheme.bodyMedium!.copyWith(
                                          color: AppColor.c_FF64748B,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => spaceH16,
                              itemCount: 10,
                              shrinkWrap: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150.h,
              decoration: BoxDecoration(
                color: AppColor.transparent,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.c_FF101828.withOpacity(0.3),
                    offset: Offset(0, 4),
                    blurRadius: 6,
                    spreadRadius: -2,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150.h,
              decoration: BoxDecoration(
                color: AppColor.transparent,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.c_FF101828.withOpacity(0.08),
                    offset: Offset(0, -12),
                    blurRadius: 16,
                    spreadRadius: -4,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150.h,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppOutlineButton(
                    title: 'Xem Flashcards',
                    titleColor: AppColor.c_FF2970FF,
                    borderColor: AppColor.c_FFB2CCFF,
                    onTap: () {
                      GoRouter.of(context).push(AppPath.flashcard);
                    },
                  ),
                  spaceH16,
                  AppButton(
                    title: 'Làm bài test',
                    onTap: () =>
                        GoRouter.of(context).push(AppPath.flashcardTest),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
