import 'package:assist_landing_page/custom_widgets/contact_us_section.dart';
import 'package:assist_landing_page/custom_widgets/footer_section.dart';
import 'package:assist_landing_page/custom_widgets/home_section.dart';
import 'package:assist_landing_page/custom_widgets/how_work_section.dart';
import 'package:assist_landing_page/custom_widgets/impact_section.dart';
import 'package:assist_landing_page/custom_widgets/our_team.dart';
import 'package:assist_landing_page/custom_widgets/pricing_page.dart';
import 'package:assist_landing_page/screens/landing_page/controller/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/about_us_section.dart';
import '../../custom_widgets/custom_button.dart';
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
            automaticallyImplyLeading: false,
            backgroundColor: kWhiteColor,
            surfaceTintColor: kWhiteColor,
            title: LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 600;

                return Obx(() => Padding(
                  padding: EdgeInsets.symmetric(horizontal: isMobile ? 12.w : 50.w),
                  child: isMobile
                      ? (controller.selectedIndex.value == 0
                  // Home Screen Mobile Layout
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Builder(
                            builder: (context) => GestureDetector(
                              onTap: () => Scaffold.of(context).openDrawer(),
                              child: Container(
                                height: 42,
                                width: 42,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(Icons.menu, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Image.asset(
                            kLogo,
                            height: 60,
                            width: 90,
                            color: kBlackColor,
                          ),
                        ],
                      ),
                      CustomButton(
                        title: "Donate now",
                        width: 100,
                        height: 39,
                        textSize: 14,
                        borderRadius: 60,
                        color: kBlackColor,
                        textColor: Colors.white,
                        onTap: () {
                          controller.selectedIndex.value = -1;
                          controller.isDonateSelected.value = true;
                        },
                      ),
                    ],
                  )
                  // Other screens Mobile Layout
                      : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Builder(
                        builder: (context) => GestureDetector(
                          onTap: () => Scaffold.of(context).openDrawer(),
                          child: Container(
                            height: 42,
                            width: 42,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(Icons.menu, color: Colors.white),
                          ),
                        ),
                      ),
                      Image.asset(
                        kLogo,
                        height: 60,
                        width: 90,
                        color: kBlackColor,
                      ),
                    ],
                  ))
                      : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Desktop Logo
                      Image.asset(
                        kLogo,
                        height: 100,
                        width: 106,
                        color: kBlackColor,
                      ),
                      // Desktop Navigation
                      Obx(() {
                        List<String> titles = ['Home', 'How It Works', 'About Us', 'Impact', 'Our Team', 'FAQs', 'Contact'];
                        return Row(
                          children: List.generate(titles.length, (index) {
                            final isSelected = controller.selectedIndex.value == index;
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () => controller.changeIndex(index),
                                  child: Text(
                                    titles[index],
                                    style: AppStyles.blackTextStyle().copyWith(
                                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                                      fontSize: 16.sp,
                                      color: isSelected ? kPrimaryColor : kBlackColor,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      }),
                      // Desktop Donate Button
                      Padding(
                        padding: EdgeInsets.only(right: 88.0.w),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: CustomButton(
                            textSize: 16,
                            fontWeight: FontWeight.w500,
                            title: "Donate Now",
                            width: 121,
                            height: 42.h,
                            onTap: () {
                              controller.selectedIndex.value = -1;
                              controller.isDonateSelected.value = true;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
              },
            ),
            centerTitle: false,
            toolbarHeight: 120,
          ),

          drawer: SizedBox(
            width: 240,
            child: Drawer(
              backgroundColor: kWhiteColor,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: BorderSide(
                  color: kWhiteColor
                )
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
                child: Obx(() {
                  final titles = ['Home', 'How It Works', 'About Us', 'Impact', 'Our Team', 'FAQs', 'Contact'];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(kLogo, height: 120),
                      SizedBox(height: 40.h),
                      ...List.generate(titles.length, (index) {
                        final isSelected = controller.selectedIndex.value == index;
                        return ListTile(
                          title: Text(
                            titles[index],
                            style: AppStyles.blackTextStyle().copyWith(
                              fontSize: 16,
                              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                              color: isSelected ? kPrimaryColor : kBlackColor,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            controller.changeIndex(index);
                          },
                        );
                      }),
                    ],
                  );
                }),
              ),
            ),
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
                  SizedBox(height: 142.h,),
                ],
                if(controller.selectedIndex.value == 1)
                  HowWorkSection(),
                if(controller.selectedIndex.value == 2)
                  AboutUsSection(),
                if(controller.selectedIndex.value == 3)
                  ImpactSection(),
                if(controller.selectedIndex.value == 4)
                  OurTeamSection(),
                if(controller.selectedIndex.value == 5)
                  FaqSection(),
                if(controller.selectedIndex.value == 6)
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
