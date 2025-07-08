import 'package:assist_landing_page/screens/landing_page/controller/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_styles.dart';
import 'custom_button.dart';

class HowWorkSection extends StatefulWidget {
  const HowWorkSection({super.key});

  @override
  State<HowWorkSection> createState() => _HowWorkSectionState();
}

class _HowWorkSectionState extends State<HowWorkSection> {
  LandingController controller = Get.put(LandingController());

  Widget subscriberTab(
      String title1,
      String detail1,
      String title2,
      String detail2,
      String title3,
      String detail3,
      String title4,
      String detail4, {
        bool isApplicant = false,
        String? title5,
        String? detail5,
      }) {
    final isMobile = Get.width < 600;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 88.w),
      child: isMobile
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20.h),
          Container(
            height: 404.h,
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
              child: Image.asset(
                kMobileImage2,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 38.h),
          reviewContainer(title1, detail1, width: double.infinity),
          SizedBox(height: 20.h),
          reviewContainer(title2, detail2, width: double.infinity),
          SizedBox(height: 20.h),
          reviewContainer(title3, detail3, width: double.infinity),
          SizedBox(height: 20.h),
          reviewContainer(title4, detail4, width: double.infinity),
          if (isApplicant) ...[
            SizedBox(height: 20.h),
            reviewContainer(title5, detail5, width: double.infinity),
          ],
        ],
      )
          : SizedBox(
        height: 480.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 480.h,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),
                  child: Image.asset(
                    kMobileImage2,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(top: isApplicant ? 0 : 69.h),
                child: Column(
                  mainAxisAlignment: isApplicant
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: reviewContainer(title1, detail1)),
                        SizedBox(width: 26.w),
                        Expanded(child: reviewContainer(title2, detail2)),
                      ],
                    ),
                    if (!isApplicant) SizedBox(height: 32.h),
                    Row(
                      children: [
                        Expanded(child: reviewContainer(title3, detail3)),
                        SizedBox(width: 26.w),
                        Expanded(child: reviewContainer(title4, detail4)),
                      ],
                    ),
                    if (isApplicant)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          reviewContainer(title5, detail5, width: 370.w),
                        ],
                      ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    final isMobile = Get.width < 600;

    return Padding(
      padding: EdgeInsets.only(bottom: 111.h,top: 27.h),
      child: Column(
        children: [
          SvgPicture.asset(kDotsImage,height: 21,width: 155.w,),
          Text("How It’s Work",style: AppStyles.blackTextStyle().copyWith(fontSize: 55.sp,),),
          Text("Select your role to see how the process works.",style: AppStyles.blackTextStyle().copyWith(fontSize: 24.sp,color: kGreyShade6Color),),
          SizedBox(height: 11.h,),
          Container(
            width: isMobile ? 179 : 320,
            height: isMobile ? 33 : 62,
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: kBlackColor),
            ),
            child: Padding(
              padding: EdgeInsets.all(isMobile ? 5 : 11),
              child: Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SelectableToggleButton(
                      title: "Subscriber",
                      isSelected: controller.selectedType.value == 0,
                      onTap: () => controller.setSelected(0),
                      isLeft: true,
                    ),
                    SelectableToggleButton(
                      title: "Applicant",
                      isSelected: controller.selectedType.value == 1,
                      onTap: () => controller.setSelected(1),
                      isLeft: false,
                    ),
                  ],
                );
              })
            ),
          ),
          SizedBox(height: isMobile ? 57.h : 90.h,),
          Obx(
                () {
              return controller.selectedType.value == 0 ? subscriberTab("Subscription Plan", "Choose a subscription plan that suits you.", "Impact Feed", "Can post on impact feed.", "Contribution Stats", "Can view the overall donation impact.", "Contact The Admin", "Can contact the admin for assistance.", ) :
              subscriberTab("Select Bill Category", "Choose the type of bill you want to submit.", "Upload Bill", "Submit clear photo PDF of your Recent Bill For verification.", "Share Your Reason", "Tell us why you are applying.", "Submit Application", "Review your details submit your application  for consideration.",isApplicant: true,title5: "Random Applicant Choosen",detail5: "Applicant is choosen randomly from the list.");
          },)
        ],
      ),
    );
  }
}

 Widget reviewContainer(title,detail,{double? width}){
   final isMobile = Get.width < 600;

  return Container(
    height: 131.h,
    width: width,
    decoration: BoxDecoration(
      color: kGreyShade5Color.withOpacity(0.22),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 33.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(kCheckImage,height: 45,),
          SizedBox(width: 6.w,),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title,style: AppStyles.blackTextStyle().copyWith(fontSize: isMobile ? 18 : 19.sp,),),
                Text(detail,style: AppStyles.blackTextStyle().copyWith(fontSize: isMobile ? 12 : 14.sp,fontWeight: FontWeight.w400),),
              ],
            ),
          ),
        ],
      ),
    ),
  );

}


 class SelectableToggleButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final bool isLeft;
  final String title;

  const SelectableToggleButton({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.title,
    this.isLeft = true,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Get.width < 600;

    final bgColor = isSelected ? kBlackColor : kWhiteColor;
    final textColor = isSelected ? kWhiteColor : kBlackColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: isMobile ? 24 : 40,
        width: isMobile ? 80 : 146,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(100),
        ),
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 5 : 7),
        child: Row(
          mainAxisAlignment: isLeft ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: isLeft
              ? [
            CircleAvatar(radius: isMobile ? 6 : 10, backgroundColor: kWhiteColor),
            SizedBox(width: isMobile ? 4 : 12),
            Text(
              title,
              style: AppStyles.blackTextStyle().copyWith(color: textColor, fontSize: isMobile ? 10 : 18),
            ),
          ]
              : [
            Text(
              title,
              style: AppStyles.blackTextStyle().copyWith(color: textColor, fontSize: isMobile ? 10 : 18),
            ),
            SizedBox(width: 12),
            CircleAvatar(radius: isMobile ? 6 : 10, backgroundColor: kWhiteColor),
          ],
        ),
      ),
    );
  }
}