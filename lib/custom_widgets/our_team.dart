import 'package:assist_landing_page/screens/landing_page/controller/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../utils/app_images.dart';
import '../utils/app_styles.dart';

class OurTeamSection extends StatefulWidget {
  const OurTeamSection({super.key});

  @override
  State<OurTeamSection> createState() => _OurTeamSectionState();
}

class _OurTeamSectionState extends State<OurTeamSection> {
  LandingController controller = Get.put(LandingController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 42.h,horizontal: 87.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 53.h,
        children: [
          Center(
            child: Column(
              spacing: 12,
              children: [
                SvgPicture.asset(kDotsImage,height: 21,width: 155.w,),
                Text("Our Team",style: AppStyles.blackTextStyle().copyWith(fontSize: 55.sp,fontWeight: FontWeight.w500),),
              ],
            ),
          ),
          SizedBox(height: 68,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              memberWidget(kMember1, "Hubert L Thompson Jr\nPresident and Founder", "University of Maine at Presque Isle – Alumni (BA & MA)",160.w),
              memberWidget(kMember2, "Jonard Harden\nBoard Member", "Co-Owner, Jeaux’s Jumps University of Maine at Presque Isle – Alumni (BA)",160.w),
              memberWidget(kMember3, "William Videau\nDirector & Board Member CEO of WL TRUCKING", "University of Maine at Presque Isle – Alumni (BA)",185.w),
              memberWidget(kMember4, "Marcus Lorenzo Hayes\nDirector & Board Member", "University of Maine at Presque Isle – Alumni (BA)",163.w),
              ],
          ),
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              memberWidget(kMember5, "Raymond Smith\nBoard Member\n(Veteran, United States Military Law Enforcement Officer)", "University of Maine at Presque Isle – Alumni (BA)",220.w),
              memberWidget(kMember6, "Darnell Dante Griffin\nBoard Member\n(Marketing Strategist / Event Coordinator)", "University of Maine at Presque Isle – Alumni (BA)",200.w),
              memberWidget(kMember7, "Winnie Taiwo\nBoard Member\n(Analytics)", "Georgia Institute of Technology – Alumni (MS)",165.w),
              memberWidget(kMember7, "Kevin Dufauchard\nBoard Member \n(Mechanical Engineer)", "Rose-Hulman Institute of Technology – Alumni (BA)",165.w),
            ],
          ),
          SizedBox(height: 80,),
        ],
      ),
    );
  }

  memberWidget(image,title,detail,double width){
    return Row(
      children: [
        Container(
          height: 110,
          width: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
              child: Image.asset(image,fit: BoxFit.cover,)),
        ),
        SizedBox(width: 5.w,),
        SizedBox(
          width: width,
          child: Column(
            spacing: 3,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: AppStyles.blackTextStyle().copyWith(fontSize: 15.sp,fontWeight: FontWeight.w600),),
              Text(detail,style: AppStyles.blackTextStyle().copyWith(fontSize: 12.sp,fontWeight: FontWeight.w400),),
            ],
          ),
        )
      ],
    );
  }

}

