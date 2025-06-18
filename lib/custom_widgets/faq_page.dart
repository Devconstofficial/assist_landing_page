import 'package:assist_landing_page/custom_widgets/underline_text.dart';
import 'package:assist_landing_page/screens/landing_page/controller/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_styles.dart';
import 'custom_button.dart';
import 'custom_textfield.dart';

class FaqSection extends StatefulWidget {

  const FaqSection({super.key});

  @override
  State<FaqSection> createState() => _FaqSectionState();
}

class _FaqSectionState extends State<FaqSection> {
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
                Text("The Assist App_Freqently Asked Questions",style: AppStyles.blackTextStyle().copyWith(fontSize: 55.sp,fontWeight: FontWeight.w500),),
              ],
            ),
          ),
          customQuestion("Who can apply for assistance?", "Anyone  in  the  U.S.  who  is  facing  financial  hardship  and  at  risk  of  disconnection,  eviction,  or  service interruption can apply through The Assist App. We help with rent, utilities, or any essential household bills  as long as your situation is urgent and verifiable."),
          customQuestion("How do I apply?", "Applications are accepted only through The Assist App. Download the app, create your account, and follow the steps to submit your request. You'll need to upload valid identification and a current bill showing proof of urgency (e.g., disconnection notice, past-due balance, eviction threat)."),
          customQuestion("How does the app choose who receives help?", "Recipients  are  randomly  selected  from  the  pool  of  verified  applicants.  If  selected,  your  submission  is re-reviewed for accuracy and urgency before funds are sent directly to the biller."),
          customQuestion("Can I apply more than once?", "Yes.  You  can  apply  as  many  times  as  needed,  as  long  as  each  application  is  for  a  new  and  different  bill. Duplicate requests or already-paid bills will not be accepted."),
          customQuestion("How do subscriptions work?", "Subscribers choose a monthly contribution inside the app. These funds are pooled and used to assist verified applicants. Subscribers can see how their support is making an impact directly in the app."),
          customQuestion("Can I track where my money goes?", "Yes. Subscribers receive updates on how their contributions are used. Many recipients also leave thank-you messages, photos, or updates once their bills are paid."),
          customQuestion("Can I cancel my subscription?", "Yes. You can cancel, pause, or adjust your monthly contribution anytime through the app settings."),
          customQuestion("Is my donation tax-deductible?", "Yes.  The  Assist  App  is  a  registered  501(c)(3)  nonprofit  organization.  Receipts  are  automatically  emailed  to you after each contribution for your records or tax purposes."),
          customQuestion("Why cant I apply or subscribe on the website?", "To  keep  your  information  secure  and  ensure  proper  verification,  all  applications  and  subscriptions  are processed through the app only. This website exists to inform, not to collect sensitive data."),
          SizedBox(height: 80,)
        ],
      ),
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

