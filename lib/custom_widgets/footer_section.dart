import 'package:assist_landing_page/custom_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../screens/landing_page/controller/landing_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_styles.dart';

class FooterSection extends StatelessWidget {
  final LandingController controller;

  const FooterSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final isMobile = Get.width < 600;

    return Container(
      color: kPrimaryColor,
      child: Padding(
        padding: EdgeInsets.only(
            top: isMobile ? 50.h : 88.h, bottom: isMobile ? 50.h : 15.h, left: 88.w, right: 88.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isMobile
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildLeftContent(),
                SizedBox(height: 40.h),
                buildRightContent(isMobile: true),
              ],
            )
                : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildLeftContent(),
                buildRightContent(),
              ],
            ),
            SizedBox(height: isMobile ? 33.h : 95.h),
            Column(
              children: [
                Text(
                  "WE DON'T DO CAUSES. WE SOLVE NEEDS",
                  style: AppStyles.promptTextStyle().copyWith(
                    fontSize: 60.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: isMobile ? 15.h : 30.h),
                Divider(
                  color: kWhiteColor,
                  thickness: 4,
                  height: 4,
                  endIndent: 0,
                  indent: 0,
                ),
                SizedBox(height: isMobile ? 15.h : 30.h),
                Text(
                  " NOTE : All donations and applications are processed through the app only.",
                  style: AppStyles.promptTextStyle().copyWith(
                    fontSize: isMobile ? 7 : 20.sp,
                    fontWeight: FontWeight.w200,
                    color: kWhiteColor.withOpacity(0.8),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildLeftContent() {
    final isMobile = Get.width < 600;

    return SizedBox(
      width: isMobile ? 480 : 487.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            width: 105,
            child: Image.asset(kLogo, fit: BoxFit.cover, color: kWhiteColor),
          ),
          SizedBox(height: 24.h),
          Text(
            "The Assist App is a registered 501(c)(3) nonprofit. EIN: 39-2153324",
            style: AppStyles.promptTextStyle().copyWith(
              fontSize: isMobile ? 14 : 20.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: isMobile ? 40.h : 24.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Subscribe to our newsletter",
                style: AppStyles.promptTextStyle().copyWith(
                  fontSize: isMobile ? 12 : 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 14.h),
              Container(
                height: 59.h,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 21.w),
                            border: InputBorder.none,
                            hintText: "Enter your email address",
                            hintStyle: AppStyles.blackTextStyle()
                                .copyWith(fontSize: isMobile ? 12 : 15.sp),
                          ),
                          style: AppStyles.blackTextStyle()
                              .copyWith(fontSize: isMobile ? 15 : 15.sp),
                        ),
                      ),
                      SizedBox(width: 20),
                      CustomButton(
                        title: "Subscribe",
                        onTap: () {},
                        width: 80,
                        height: 35.h,
                        textSize: isMobile ? 10 : 13,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildRightContent({bool isMobile = false}) {
    return isMobile
        ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildLinkColumn([
          "Home",
          "How it’s work",
          "Impact",
          "Terms & privacy policy",
        ]),
        // SizedBox(height: 30.h),
        buildLinkColumn([
          "About Us",
          "FAQS",
          "Contact Us",
        ]),
      ],
    )
        : SizedBox(
      width: 357.w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildLinkColumn([
            "Home",
            "How it’s work",
            "Impact",
            "Terms & privacy policy",
          ]),
          buildLinkColumn([
            "About Us",
            "FAQS",
            "Contact Us",
          ]),
        ],
      ),
    );
  }

  Widget buildLinkColumn(List<String> texts) {
    final isMobile = Get.width < 600;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: texts
          .map((text) => Padding(
        padding: EdgeInsets.only(bottom: 40.h),
        child: GestureDetector(
          onTap: (){
            final indexMap = {
              "Home": 0,
              "How it’s work": 1,
              "About Us": 2,
              "Impact": 3,
              "Our Team": 4,
              "FAQS": 5,
              "Contact Us": 6,
              "Terms & privacy policy": 7,
            };

            if (indexMap.containsKey(text)) {
              controller.changeIndex(indexMap[text]!);
            }

          },
          child: Text(
            text,
            style: AppStyles.whiteTextStyle().copyWith(
              fontSize: isMobile ? 16 : 20.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ))
          .toList(),
    );
  }
}

