import 'package:assist_landing_page/screens/landing_page/controller/landing_controller.dart';
import 'package:assist_landing_page/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../utils/app_images.dart';
import '../utils/app_styles.dart';


class TermsSection extends StatefulWidget {
  const TermsSection({super.key});

  @override
  State<TermsSection> createState() => _TermsSectionState();
}

class _TermsSectionState extends State<TermsSection> {
  LandingController controller = Get.put(LandingController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 42.h,horizontal: 87.w),
      child: Obx(() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              spacing: 12,
              children: [
                SvgPicture.asset(kDotsImage,height: 21,width: 155.w,),
                Text("The Assist App – Terms of Use & Privacy Policy",style: AppStyles.blackTextStyle().copyWith(fontSize: 55.sp,fontWeight: FontWeight.w500),),
              ],
            ),
          ),
          SizedBox(height: 72.h,),
          Obx(() => Row(
            spacing: 36.w,
            children: [
              GestureDetector(
                onTap: () => controller.selectedTabIndex.value = 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "TERMS OF USE",
                      style: AppStyles.blackTextStyle().copyWith(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600,
                          color: controller.selectedTabIndex.value == 0
                              ? kBlackColor
                              : kBlackColor.withOpacity(0.6),
                          decoration: controller.selectedTabIndex.value == 0 ? TextDecoration.underline : null
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => controller.selectedTabIndex.value = 1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "PRIVACY POLICY",
                      style: AppStyles.blackTextStyle().copyWith(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600,
                          color: controller.selectedTabIndex.value == 1
                              ? kBlackColor
                              : kBlackColor.withOpacity(0.6),
                          decoration: controller.selectedTabIndex.value == 1 ? TextDecoration.underline : null
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
          SizedBox(height: 30.h,),

          if(controller.selectedTabIndex.value == 0) ...[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16.h,
              children: [
                customQuestion("1. Acceptance of Terms", "By downloading or using The Assist App, you agree to these Terms. If you do not agree, do not use the app."),
                customQuestion("2. Purpose of the App", "The Assist App is a nonprofit platform that allows users to: \n- Donate funds directly through the app \n- Subscribe to ongoing relief support tiers \n- Apply for financial assistance \n- View public or anonymized applicant stories \n- Track giving impact or application status"),
                customQuestion("3. In-App Payments", "All donations and subscriptions made through The Assist App on iOS and Android are processed using: \n- Apple In-App Purchase (IAP) \n- Google Play Billing\nBy making a payment, you also agree to: \n- Apple Media Services Terms \n- Google Play Terms of Service \nNote: Apple and Google retain a percentage of each donation or subscription (typically 15–30%)."),
                customQuestion("4. Donor Subscriptions", "You may subscribe monthly to support ongoing relief. Subscription levels and benefits are informational only and do not influence applicant selection. \nYou may cancel your subscription anytime through:  \n- Apple ID settings (iOS)  \n- Google Play Subscriptions (Android)"),
                customQuestion("5. Use of Funds", "All in-app contributions go toward: \n- Funding verified applicants selected randomly from our internal pool \n- Supporting nationwide emergency relief needs \n- Covering platform processing, security, verification, and essential operational costs, including staffing, technology, and compliance \nWe do not issue refunds unless legally required."),
                customQuestion("6. Application Process", "Submitting a request for assistance does not guarantee funding. Applicants must meet verification criteria. Selection is randomized based on available funds."),
                customQuestion("7. Media Use & Likeness", "By submitting an application, message, testimonial, video, or image through the platform, you grant The Assist App permission to: \n- Use your likeness (image, voice, or written words) \n- Share your story (anonymized or identified) \n- Feature your content on our app, website, social media, and press campaigns \nThis applies solely to stories shared with consent or posted voluntarily."),
                customQuestion("8. Account Suspension", "You may be suspended or removed for: \n- Fraudulent submissions \n- Misuse of the platform \n- Violations of community trust")
              ],
            )
          ],
          if(controller.selectedTabIndex.value == 1) ...[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16.h,
              children: [
                customQuestion("1. Information We Collect", "We may collect: \n- Personal identifiers (e.g., name, date of birth, phone, email, SSN) \n- Contact information \n- Financial verification documents (e.g., income, bills, identification)\n- Application and story submissions \n- Subscription/payment status \n- Device and usage data (IP address, OS, app interactions)"),
                customQuestion("2. How We Use It", "We use your data to:\n- Process donations and subscriptions\n- Match applicants to relief funding\n- Send updates or receipts\n- Prevent fraud and misuse\n- Improve the platform experience"),
                customQuestion("3. Data Sharing", "We do not sell or rent your personal data.\nWe may share limited data with: \n- Apple/Google for billing and refunds \n- Payment platforms (only as required) \n- Trusted vendors (e.g., Twilio for SMS) \n- Law enforcement (if required)"),
                customQuestion("4. Security", "We follow industry best practices:\n- Secure server infrastructure\n- Role-based access controls\n- SSL encryption\n- Periodic security audits\nHowever, no system is 100% secure, and users accept inherent risk."),
                customQuestion("5. Data Rights", "You may request to:\n- View your data\n- Update or correct info\n- Delete your account\nContact us: info@theassistapp.org"),
                customQuestion("6. Application Process", "Submitting a request for assistance does not guarantee funding. Applicants must meet verification criteria. Selection is randomized based on available funds"),
                customQuestion("7. Media Use & Likeness", "By submitting an application, message, testimonial, video, or image through the platform, you grant The Assist App permission to: \n- Use your likeness (image, voice, or written words)\n- Share your story (anonymized or identified)\n- Feature your content on our app, website, social media, and press campaigns\nThis applies solely to stories shared with consent or posted voluntarily.")
              ],
            )

          ],
          SizedBox(height: 80,)
        ],
      ),),
    );
  }

  Widget customQuestion (question,answer){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question,style: AppStyles.blackTextStyle().copyWith(fontSize: 28.sp,fontWeight: FontWeight.w600),),
        SizedBox(height: 7.h,),
        Text(answer,style: AppStyles.blackTextStyle().copyWith(fontSize: 20.sp,fontWeight: FontWeight.w400),),
      ],
    );
  }

}

