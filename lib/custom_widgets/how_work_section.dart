import 'package:assist_landing_page/custom_widgets/subscription_graph.dart';
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

  Widget subscriberTab(title1, detail1, title2, detail2, title3, detail3, title4, detail4,{bool isSubscription = false, String? title5, String? detail5}){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 88.w),
      child: SizedBox(
        height: 480.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
                child: SizedBox(
                    height: 480.h,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45)
                        ),
                        child: Image.asset(kMobileImage2,fit: BoxFit.contain,)))),
            SizedBox(width: 16.w,),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(top: isSubscription == true ? 0 : 69.h),
                child: Column(
                  mainAxisAlignment: isSubscription == true ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: reviewContainer(title1, detail1)),
                        SizedBox(width: 26.w,),
                        Expanded(child: reviewContainer(title2, detail2)),
                      ],
                    ),
                    SizedBox(height: isSubscription == true ? 0 : 32.h,),
                    Row(
                      children: [
                        Expanded(child: reviewContainer(title3, detail3)),
                        SizedBox(width: 26.w,),
                        Expanded(child: reviewContainer(title4, detail4)),
                      ],
                    ),
                    if(isSubscription == true)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        reviewContainer(title5, detail5,width: 334.w),
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
    return Padding(
      padding: EdgeInsets.only(bottom: 111.h,top: 27.h),
      child: Column(
        children: [
          SvgPicture.asset(kDotsImage,height: 21,width: 155.w,),
          Text("How It’s Work",style: AppStyles.blackTextStyle().copyWith(fontSize: 55.sp,),),
          Text("Select your role to see how the process works.",style: AppStyles.blackTextStyle().copyWith(fontSize: 24.sp,color: kGreyShade6Color),),
          SizedBox(height: 11.h,),
          Container(
            width: 320,
            height: 62,
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: kBlackColor),
            ),
            child: Padding(
              padding: const EdgeInsets.all(11),
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
          SizedBox(height: 90.h,),
          Obx(
                () {
              return controller.selectedType.value == 0 ? subscriberTab("Subscription Plan", "Choose a subscription plan that suits you.", "Impact Feed", "Can post on impact feed.", "Contribution Stats", "Can view the overall donation impact.", "Contact The Admin", "Can contact the admin for assistance.", isSubscription: true,title5: "Pick a Random Address",detail5: "Select address to complete your submission.") :
              subscriberTab("Select Bill Category", "Choose the type of bill you want to submit.", "Upload Bill", "Submit clear photo PDF of your Recent Bill For verification.", "Share Your Reason", "Tell us why you are applying.", "Submit Application", "Review your details submit your application  for consideration.");
          },)
        ],
      ),
    );
  }
}

 Widget reviewContainer(title,detail,{double? width}){
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
                Text(title,style: AppStyles.blackTextStyle().copyWith(fontSize: 20.sp,),),
                Text(detail,style: AppStyles.blackTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w400),),
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
    final bgColor = isSelected ? kBlackColor : kWhiteColor;
    final textColor = isSelected ? kWhiteColor : kBlackColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 146,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(100),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: Row(
          mainAxisAlignment: isLeft ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: isLeft
              ? [
            CircleAvatar(radius: 10, backgroundColor: kWhiteColor),
            SizedBox(width: 12),
            Text(
              title,
              style: AppStyles.blackTextStyle().copyWith(color: textColor, fontSize: 18),
            ),
          ]
              : [
            Text(
              title,
              style: AppStyles.blackTextStyle().copyWith(color: textColor, fontSize: 18),
            ),
            SizedBox(width: 12),
            CircleAvatar(radius: 10, backgroundColor: kWhiteColor),
          ],
        ),
      ),
    );
  }
}