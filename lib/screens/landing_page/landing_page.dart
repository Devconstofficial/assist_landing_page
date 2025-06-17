import 'package:assist_landing_page/custom_widgets/contact_us_section.dart';
import 'package:assist_landing_page/custom_widgets/footer_section.dart';
import 'package:assist_landing_page/custom_widgets/home_section.dart';
import 'package:assist_landing_page/custom_widgets/how_work_section.dart';
import 'package:assist_landing_page/custom_widgets/impact_section.dart';
import 'package:assist_landing_page/custom_widgets/pricing_page.dart';
import 'package:assist_landing_page/screens/landing_page/controller/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/custom_button.dart';
import '../../custom_widgets/custom_textfield.dart';
import '../../custom_widgets/faq_page.dart';

class LandingPage extends GetView<LandingController> {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        // CommonCode.unFocus(context);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kWhiteColor,
          surfaceTintColor: kWhiteColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                kLogo,
                height: 180.h,
                width: 180.w,
              ),
              Obx(() {
                List<String> titles = ['Home', 'How It Works', 'Impact', 'FAQs', 'Contact',];

                return Row(
                  children: List.generate(titles.length, (index) {
                    final isSelected = controller.selectedIndex.value == index;

                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => controller.changeIndex(index),
                          child: Column(
                            children: [
                              Text(
                                titles[index],
                                style: AppStyles.blackTextStyle().copyWith(
                                  fontWeight: (isSelected)
                                      ? FontWeight.w700
                                      : FontWeight.w500,
                                  fontSize: 34.sp,
                                  color: isSelected ? kPrimaryColor : kBlackColor,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              if (isSelected)
                                Builder(
                                  builder: (context) {
                                    final text = titles[index];
                                    final textPainter = TextPainter(
                                      text: TextSpan(
                                        text: text,
                                        style: AppStyles.blackTextStyle().copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 34.sp,
                                        ),
                                      ),
                                      maxLines: 1,
                                      textDirection: TextDirection.ltr,
                                    )..layout();

                                    return Image.asset(
                                      kUnderlineIcon,
                                      height: 12,
                                      width: textPainter.width,
                                      fit: BoxFit.fill,
                                    );
                                  },
                                )
                              else
                                SizedBox(height: 12),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                );
              }),
              Padding(
                padding: EdgeInsets.only(right: 60.0.w),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: CustomButton(
                    textSize: 28.sp,
                    fontWeight: FontWeight.w600,
                    title: "Donate Now",
                    width: 251.w,
                    height: 72.h,
                    onTap: () {
                      controller.selectedIndex.value = -1;
                      controller.isDonateSelected.value = true;
                    },
                  ),
                ),
              ),
            ],
          ),
          centerTitle: false,
          toolbarHeight: 120,
        ),
        body: SingleChildScrollView(
          child: Obx(() {
            if (controller.isDonateSelected.value) {
              return Column(
                children: [
                  PricingPage(),
                  FooterSection()

                ],
              );
            }

            return Column(
              children: [
                if(controller.selectedIndex.value != 0 || controller.selectedIndex.value != 3)
                  SizedBox(height: 70.h,),
                if(controller.selectedIndex.value == 0) ...[
                  HomeSection(),
                ],
                if(controller.selectedIndex.value == 1)
                  HowWorkSection(),
                if(controller.selectedIndex.value == 2)
                  ImpactSection(),
                if(controller.selectedIndex.value == 3)
                  FaqSection(),
                if(controller.selectedIndex.value == 4)
                  ContactUsSection(),
                FooterSection()
              ],
            );
          }),

        )
      ),
    );
  }
}
