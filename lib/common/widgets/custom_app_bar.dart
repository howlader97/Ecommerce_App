import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/app_color.dart';

class CustomAppBar extends StatelessWidget {
    CustomAppBar ({
    super.key,this.isBack
  });

  bool ?isBack=false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: (){
          isBack==true ?Navigator.pop(context):null;
          },
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.all(12),
            child: Center(child: Icon(Icons.arrow_back_ios_new_outlined)),
          ),
        ),
        Spacer(),
        Icon(Icons.notification_add_outlined, size: 30,),

        Container(
          margin: EdgeInsets.only(left: 25,right: 12),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.grey,width: 1)
          ),
          padding: EdgeInsets.all(2.5),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage('https://wac-cdn.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg?cdnVersion=2484'),
                    fit: BoxFit.cover
                )
            ),
          ),
        )

      ],
    );
  }
}
