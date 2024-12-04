import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazy_english/core/constants/app_color.dart';
import 'package:lazy_english/core/constants/app_text_theme.dart';
import 'package:lazy_english/core/utils/spaces.dart';
import 'package:lazy_english/core/widgets/flashcard/models/flashcard_model.dart';

class Flashcard extends StatefulWidget {
  final List<FlashcardModel> flashcards;
  final Function(int)? onSwipeLeftComplete;
  final Function(int)? onSwipeRightComplete;
  const Flashcard(
      {super.key,
      required this.flashcards,
      this.onSwipeLeftComplete,
      this.onSwipeRightComplete});

  @override
  State<Flashcard> createState() => _FlashcardState();
}

class _FlashcardState extends State<Flashcard> {
  int currentIndex = 0;
  bool isFlipped = false;
  double dx = 0;
  double dy = 0;
  double rotation = 0;
  bool isSwipingLeft = false;
  bool isSwipingRight = false;

  void _updateSwipingDirection() {
    if (dx > 0) {
      isSwipingRight = true;
      isSwipingLeft = false;
    } else if (dx < 0) {
      isSwipingRight = false;
      isSwipingLeft = true;
    } else {
      isSwipingRight = false;
      isSwipingLeft = false;
    }
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _updateSwipingDirection();
      dx += details.delta.dx;
      dy += details.delta.dy;
      rotation = dx / 400;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    if (dx > 70) {
      _swipeRight();
    } else if (dx < -70) {
      _swipeLeft();
    } else {
      _resetPosition();
    }
  }

  void _swipeRight() {
    setState(() {
      dx = 500;
      dy = 0;
    });
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        // currentIndex = (currentIndex + 1) % widget.flashcards.length;
        currentIndex++;
        dx = 0;
        dy = 0;
        rotation = 0;
        isFlipped = false;
        isSwipingLeft = false;
        isSwipingRight = false;
        if (widget.onSwipeRightComplete != null) {
          widget.onSwipeRightComplete!(currentIndex);
        }
      });
    });
  }

  void _swipeLeft() {
    setState(() {
      dx = -500;
      dy = 0;
    });
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        // currentIndex = (currentIndex - 1 + widget.flashcards.length) %
        //     widget.flashcards.length;
        currentIndex++;
        dx = 0;
        dy = 0;
        rotation = 0;
        isFlipped = false;
        isSwipingLeft = false;
        isSwipingRight = false;
        if (widget.onSwipeLeftComplete != null) {
          widget.onSwipeLeftComplete!(currentIndex);
        }
      });
    });
  }

  void _resetPosition() {
    setState(() {
      dx = 0;
      dy = 0;
      rotation = 0;
      isSwipingLeft = false;
      isSwipingRight = false;
    });
  }

  void _toggleFlip() {
    setState(() {
      isFlipped = !isFlipped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return currentIndex < widget.flashcards.length
        ? Stack(
            children: [
              // Background cards
              if (currentIndex + 1 < widget.flashcards.length)
                Positioned(
                  left: 0,
                  top: 10,
                  child: Transform.scale(
                    scale: 0.95,
                    child: _buildFrontCard(
                        widget.flashcards[currentIndex + 1], currentIndex + 1),
                  ),
                ),
              // Top card (current card)
              Positioned(
                left: dx,
                top: dy,
                child: Transform.rotate(
                  angle: rotation,
                  child: GestureDetector(
                    onPanUpdate: _onPanUpdate,
                    onPanEnd: _onPanEnd,
                    onTap: _toggleFlip,
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 500),
                      transitionBuilder: (child, animation) {
                        final rotate =
                            Tween(begin: pi, end: 0.0).animate(animation);
                        return AnimatedBuilder(
                          animation: rotate,
                          builder: (context, child) {
                            final angle =
                                isFlipped ? pi - rotate.value : rotate.value;
                            return Transform(
                              transform: Matrix4.rotationY(angle),
                              alignment: Alignment.center,
                              child: child,
                            );
                          },
                          child: child,
                        );
                      },
                      child: isFlipped
                          ? Transform(
                              transform: Matrix4.identity()..rotateY(pi),
                              alignment: Alignment.center,
                              child: _buildBackCard(
                                  widget.flashcards[currentIndex],
                                  currentIndex))
                          : _buildFrontCard(
                              widget.flashcards[currentIndex], currentIndex),
                    ),
                  ),
                ),
              ),
            ],
          )
        : Text(
            'No more cards!',
            style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w400),
          );
  }

  Widget _buildFrontCard(FlashcardModel card, int cardIndex) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      height: 0.7.sh,
      width: 0.9.sw,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColor.c_FFFBFCFD,
        border: Border.all(
          color: isSwipingLeft && currentIndex == cardIndex
              ? AppColor.c_FFD92D20
              : isSwipingRight && currentIndex == cardIndex
                  ? AppColor.c_FF16A34A
                  : AppColor.c_FFE2E8F0,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        card.name ?? '',
        style: textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildBackCard(FlashcardModel card, int cardIndex) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 0.7.sh,
      width: 0.9.sw,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColor.c_FFFBFCFD,
        border: Border.all(
          color: isSwipingLeft && currentIndex == cardIndex
              ? AppColor.c_FFD92D20
              : isSwipingRight && currentIndex == cardIndex
                  ? AppColor.c_FF16A34A
                  : AppColor.c_FFE2E8F0,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Meaning:',
            style: textTheme.titleMedium,
          ),
          spaceH8,
          Text(
            card.meaning ?? '',
            textAlign: TextAlign.center,
            style: textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400),
          ),
          spaceH32,
          Text(
            'IPA:',
            style: textTheme.titleMedium,
          ),
          spaceH8,
          Text(
            card.ipa ?? '',
            style: textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400),
          ),
          spaceH32,
          Text(
            'Example:',
            style: textTheme.titleMedium,
          ),
          spaceH8,
          Text(
            card.example ?? '',
            style: textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
