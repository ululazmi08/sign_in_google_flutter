import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:test_hi_bank/constant/colors.dart';
import 'package:test_hi_bank/constant/component.dart';
import 'package:test_hi_bank/controller/auth_controller.dart';
import 'package:test_hi_bank/controller/posts_controller.dart';
import 'package:test_hi_bank/page/widget/card_list_widget.dart';
import 'package:test_hi_bank/page/widget/logout_dialog.dart';
import 'package:test_hi_bank/page/widget/shimmer_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  PostsController postsController = Get.put(PostsController());
  AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      body: Obx(() {
        return SafeArea(
          child: Column(
            children: [
              appBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      postsController.loadingFecth.value
                          ? ListView.builder(
                              itemCount: 6,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: ShimmerWidget(
                                      width: Get.width, height: Get.height / 5),
                                );
                              },
                            )
                          : ListView.builder(
                              itemCount: postsController.listPosts.length,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var data = postsController.listPosts[index];
                                return CardListWidget(data: data);
                              },
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
        // }
      }),
    );
  }

  Widget appBar() {
    return Container(
      decoration: BoxDecoration(
        color: kColorWhite,
        boxShadow: [
          BoxShadow(
            color: kColorBlack.withOpacity(0.25),
            blurRadius: 4,
            spreadRadius: 0,
            offset: const Offset(0, 0),
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: kDecorationForm.copyWith(
                labelText: 'Enter Posts ID',
                alignLabelWithHint: true,
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: (value) => postsController.onSearchChanged(value),
              controller: postsController.searchController.value,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Get.dialog(
                barrierDismissible: false,
                LogoutDialog(
                  tapYes: () {
                    authController.signOut();
                  },
                  tapBack: () {
                    Get.back();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
