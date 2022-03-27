import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:task_4/modules/FirstScreen.dart';

String getRate(rate)
{
  if (rate>=4.0){
    return 'verygood'.tr();
  }
  else if (rate>=3.0&&rate<4.0){
    return 'text_good'.tr();
  }
  else {
    return 'bad'.tr();
  }
}

Widget createList(h,w,model){
  return SizedBox(
    height: h*0.4,
    child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index) => createGroceryItems(h,w,context,model[index]),
        separatorBuilder: (context,index) => SizedBox(width: w*0.02,),
        itemCount: model.length),
  );
}

Widget customDrawerItem(h,w,title,IconData icon,{required onTap,}){
  return InkWell(
    onTap: () {
      onTap();
    },
    child: Row(
      children: [
        Icon(icon,size: h*.035,),
        SizedBox(width: w*0.03,),
        Text(title,style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: h*.022
        ),),
        SizedBox(height: h*0.08,),
      ],
    ),
  );
}

customButton2(title,h){
  return InkWell(
    onTap: () {},
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(title,style: TextStyle(
              fontSize: h*0.025,
              fontWeight: FontWeight.w600
          ),),
          Spacer(),
          Icon(Icons.arrow_forward_ios,color: Colors.black.withOpacity(0.6),),
          SizedBox(height: h*0.055,),
        ],
      ),
    ),
  );
}

void navigateTo(context,widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}