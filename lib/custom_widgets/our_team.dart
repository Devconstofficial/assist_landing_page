import 'package:assist_landing_page/screens/landing_page/controller/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../utils/app_images.dart';
import '../utils/app_styles.dart';

class OurTeamSection extends StatefulWidget {
  const OurTeamSection({super.key});

  @override
  State<OurTeamSection> createState() => _OurTeamSectionState();
}

class _OurTeamSectionState extends State<OurTeamSection> {
  final LandingController controller = Get.put(LandingController());

  @override
  Widget build(BuildContext context) {
    final isMobile = Get.width < 600;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 0 : 42.h, horizontal: 87.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                SvgPicture.asset(kDotsImage, height: 21, width: 155.w),
                SizedBox(height: 12.h),
                Text(
                  "Our Team",
                  style: AppStyles.blackTextStyle().copyWith(
                    fontSize: 55.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 68.h),
          isMobile
              ? Column(
            children: [
              memberWidget(kMember1, "Hubert L Thompson Jr\nPresident and Founder",
                  "University of Maine at Presque Isle – Alumni (BA & MA)"),
              SizedBox(height: 30.h),
              memberWidget(kMember2, "Jonard Harden\nBoard Member",
                  "Co-Owner, Jeaux’s Jumps\nUniversity of Maine at Presque Isle – Alumni (BA)"),
              SizedBox(height: 30.h),
              memberWidget(kMember3,
                  "William Videau\nDirector & Board Member\nCEO of WL TRUCKING",
                  "University of Maine at Presque Isle – Alumni (BA)"),
              SizedBox(height: 30.h),
              memberWidget(kMember4, "Marcus Lorenzo Hayes\nDirector & Board Member",
                  "University of Maine at Presque Isle – Alumni (BA)"),
            ],
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 300.w,
                  child: memberWidget(kMember1, "Hubert L Thompson Jr\nPresident and Founder",
                      "University of Maine at Presque Isle – Alumni (BA & MA)")),
              SizedBox(
                  width: 300.w,
                  child: memberWidget(kMember2, "Jonard Harden\nBoard Member",
                      "Co-Owner, Jeaux’s Jumps\nUniversity of Maine at Presque Isle – Alumni (BA)")),
              SizedBox(
                  width: 320.w,
                  child: memberWidget(kMember3,
                      "William Videau\nDirector & Board Member\nCEO of WL TRUCKING",
                      "University of Maine at Presque Isle – Alumni (BA)")),
              SizedBox(
                  width: 300.w,
                  child: memberWidget(kMember4, "Marcus Lorenzo Hayes\nDirector & Board Member",
                      "University of Maine at Presque Isle – Alumni (BA)")),
            ],
          ),
          SizedBox(height: isMobile ? 40.h : 50.h),
          isMobile
              ? Column(
            children: [
              memberWidget(kMember5,
                  "Raymond Smith\nBoard Member\n(Veteran, United States Military Law Enforcement Officer)",
                  "University of Maine at Presque Isle – Alumni (BA)"),
              SizedBox(height: 30.h),
              memberWidget(kMember6,
                  "Darnell Dante Griffin\nBoard Member\n(Marketing Strategist / Event Coordinator)",
                  "University of Maine at Presque Isle – Alumni (BA)"),
              SizedBox(height: 30.h),
              memberWidget(kMember7,
                  "Winnie Taiwo\nBoard Member\n(Analytics)",
                  "Georgia Institute of Technology – Alumni (MS)"),
              SizedBox(height: 30.h),
              memberWidget(kMember8,
                  "Kevin Dufauchard\nBoard Member \n(Mechanical Engineer)",
                  "Rose-Hulman Institute of Technology – Alumni (BA)"),
            ],
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 340.w,
                  child: memberWidget(kMember5,
                      "Raymond Smith\nBoard Member\n(Veteran, United States Military Law Enforcement Officer)",
                      "University of Maine at Presque Isle – Alumni (BA)")),
              SizedBox(
                  width: 320.w,
                  child: memberWidget(kMember6,
                      "Darnell Dante Griffin\nBoard Member\n(Marketing Strategist / Event Coordinator)",
                      "University of Maine at Presque Isle – Alumni (BA)")),
              SizedBox(
                  width: 300.w,
                  child: memberWidget(kMember7,
                      "Winnie Taiwo\nBoard Member\n(Analytics)",
                      "Georgia Institute of Technology – Alumni (MS)")),
              SizedBox(
                  width: 300.w,
                  child: memberWidget(kMember8,
                      "Kevin Dufauchard\nBoard Member \n(Mechanical Engineer)",
                      "Rose-Hulman Institute of Technology – Alumni (BA)")),
            ],
          ),

          SizedBox(height: 80.h),
        ],
      ),
    );
  }

  Widget memberWidget(String image, String title, String detail) {
    final isMobile = Get.width < 600;

    return Row(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center :CrossAxisAlignment.start,
      children: [
        Container(
          height: isMobile ? 80 : 110,
          width: isMobile ? 80 : 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(image, fit: BoxFit.cover),
          ),
        ),
        SizedBox(width: isMobile ? 20 : 12.w),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppStyles.blackTextStyle().copyWith(
                  fontSize: isMobile ? 15 : 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                detail,
                style: AppStyles.blackTextStyle().copyWith(
                  fontSize: isMobile ? 12 : 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
