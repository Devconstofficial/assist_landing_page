import 'package:assist_landing_page/screens/landing_page/controller/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../utils/app_images.dart';
import '../utils/app_styles.dart';

class AboutUsSection extends StatefulWidget {
  const AboutUsSection({super.key});

  @override
  State<AboutUsSection> createState() => _AboutUsSectionState();
}

class _AboutUsSectionState extends State<AboutUsSection> {
  LandingController controller = Get.put(LandingController());

  @override
  Widget build(BuildContext context) {
    final isMobile = Get.width < 600;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 0 : 42.h,horizontal: 87.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 53.h,
        children: [
          Center(
            child: Column(
              spacing: 12,
              children: [
                SvgPicture.asset(kDotsImage,height: 21,width: 155.w,),
                Text("About Us",style: AppStyles.blackTextStyle().copyWith(fontSize: 55.sp,fontWeight: FontWeight.w500),),
              ],
            ),
          ),
          SizedBox(height: isMobile ? 0 :38,),
          Text("The Assist App was built to deliver real help, right when it's needed most. "
              "We're not here for vague causes or slow, complicated processes. "
              "We focus on urgent and essential needs-the kind that can't wait. "
              "Whether it's keeping the lights on, covering a critical bill, or showing up in a moment of crisis, our platform connects people with direct support through secure, community-powered donations \n",
            style: AppStyles.blackTextStyle().copyWith(fontSize: 28.sp,fontWeight: FontWeight.w400),),
          Text("While many organizations do incredible work on a global scale, we felt called to focus where we live, in the communities around us. "
              "The struggles happening right next door deserve just as much attention. That's why our mission starts locally, making sure the help we give is personal, timely, and rooted in real life."
              "Powered by everyday generosity. Guided by urgency. When life hits hard, help should show up fast done",
            style: AppStyles.blackTextStyle().copyWith(fontSize: 28.sp,fontWeight: FontWeight.w400),),
          if(isMobile)
          SizedBox(height: 78,),

        ],
      ),
    );
  }
}

