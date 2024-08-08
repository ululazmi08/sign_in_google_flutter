import 'package:flutter/material.dart';
import 'package:test_hi_bank/constant/colors.dart';
import 'package:test_hi_bank/constant/typography.dart';
import 'package:test_hi_bank/models/posts_model.dart';

class CardListWidget extends StatelessWidget {
  CardListWidget({
    required this.data,
    Key? key,
  }) : super(key: key);

  PostsModels data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: kColorMainLine,
            ),
            color: kColorWhite,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: 8,
                ),
                child: Center(
                  child: Text(
                    data.title,
                    textAlign: TextAlign.center,
                    style: TStyle.title,
                  ),
                ),
              ),
              const Divider(
                color: kColorMainLine,
                thickness: 1,
                height: 0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 8,
                  bottom: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID : ${data.id}', style: TStyle.regText),

                    Text(
                      data.body,
                      style: TStyle.regText.copyWith(color: kColorRegTxtGrey),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
