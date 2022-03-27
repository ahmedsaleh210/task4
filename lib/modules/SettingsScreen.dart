import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:task_4/cubit/cubit.dart';
import 'package:task_4/cubit/states.dart';
import 'package:task_4/shared/components.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.height;
    return BlocConsumer<AppCubit,AppLayoutStates>(
      listener: (context,state) {},
      builder: (context,state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: Text('secondScreen'.tr()),
          ),
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: w*0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: h*0.05,),
                customButton2('accInfo'.tr(),h),
                customButton2('savedAddresses'.tr(),h),
                customButton2('changeEmail'.tr(),h),
                customButton2('changePass'.tr(),h),
                SizedBox(height: h*0.03,),
                Container(
                  width: w,
                  height: h*0.06,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow:[
                      BoxShadow(
                        color: Colors.grey.withOpacity(.4),
                        blurRadius: 2.0, // soften the shadow
                        spreadRadius: 0.0,
                        offset: const Offset(
                          0.0,
                          2.0,
                        ),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: w*0.025),
                    child: Row(
                      children: [
                        Text('switch_notification'.tr(),style: TextStyle(
                            fontSize: h*0.025,
                            fontWeight: FontWeight.w600
                        ),),
                        const Spacer(),
                        CupertinoSwitch(
                          activeColor: Colors.orange,
                            value: AppCubit.get(context).notificationInit,
                            onChanged: (value) {
                              AppCubit.get(context).changeSwitch();
                            }),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: h*0.03,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w*0.01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          showLang(context);
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: SizedBox(
                          width: w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('lang'.tr(),style: TextStyle(
                                  fontSize: h*0.025,
                                  fontWeight: FontWeight.w600
                              ),),
                              SizedBox(height: h*0.01,),
                              Text(translator.activeLanguageCode=='en'?'English':'عربي',style: TextStyle(
                                  fontSize: h*0.023,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w500
                              ),),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: h*0.03,),
                      Text('country'.tr(),style: TextStyle(
                          fontSize: h*0.025,
                          fontWeight: FontWeight.w600
                      ),),
                      SizedBox(height: h*0.01,),
                      Text(translator.activeLanguageCode=='en'?'Egypt':'مصر',style: TextStyle(
                          fontSize: h*0.023,
                          color: Colors.orange,
                          fontWeight: FontWeight.w500
                      ),),
                      SizedBox(height: h*0.03,),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(right:8.0,top: 8.0,bottom: 8.0),
                          child: Text('logout'.tr(),style: TextStyle(
                              fontSize: h*0.025,
                              fontWeight: FontWeight.w600
                          ),),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Future<dynamic> showLang(context){
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Center(child: Text('Material Dialog')),
          actions: <Widget>[
            ListTile(
              horizontalTitleGap: 1,
              minLeadingWidth: 1.0,
              contentPadding:const EdgeInsets.all(0.0),
              title: const Text('عربي'),
              leading: Radio<Languages>(
                value: Languages.arabic,
                groupValue: AppCubit.get(context).lang,
                onChanged: (value) {
                  if(translator.activeLanguageCode!='ar')
                  {
                    translator.setNewLanguage(
                      context, newLanguage: 'ar', restart: true, remember: true,);
                    dismissDialog(context);
                  }
                  else{
                    dismissDialog(context);
                  }
                },
                activeColor: Colors.orangeAccent,
              ),
            ),
            ListTile(
              horizontalTitleGap: 1,
              minLeadingWidth: 1.0,
              contentPadding:const EdgeInsets.all(0.0),
              title: const Text('English'),
              leading: Radio<Languages>(
                value: Languages.english,
                groupValue: AppCubit.get(context).lang,
                onChanged: (value) {
                  if(translator.activeLanguageCode!='en')
                  {
                    translator.setNewLanguage(
                      context, newLanguage: 'en', restart: true, remember: true,);
                    dismissDialog(context);
                  }
                  else{
                    dismissDialog(context);
                  }
                },
                activeColor: Colors.orangeAccent,
              ),
            ),

          ],
        );
      });
}

dismissDialog(context) {
  Navigator.pop(context);
}

