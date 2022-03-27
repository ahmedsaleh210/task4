import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:task_4/cubit/cubit.dart';
import 'package:task_4/cubit/states.dart';
import 'package:task_4/models/desserts_model.dart';
import 'package:task_4/models/freedelivery_model.dart';
import 'package:task_4/models/groceries_model.dart';
import 'package:task_4/models/nearest_model.dart';
import 'package:task_4/modules/SettingsScreen.dart';
import 'package:task_4/shared/components.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.height;
    return BlocConsumer<AppCubit,AppLayoutStates>(
      listener: (context,state) {},
      builder: (context,state) {
        return Scaffold(
          drawer: SizedBox(
            width: w*0.42,
            child: Drawer(
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(h*0.02),
                          child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: h*0.028,
                            child: Text('A',style: TextStyle(
                                color: Colors.white,
                                fontSize: h*0.03
                            ),),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Ahmed Saleh',
                              style: TextStyle(
                                  fontSize: h*0.027,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on,color: Colors.grey,size: h*0.026,),
                                SizedBox(width: w*0.005,),
                                Text('Egypt',style: Theme.of(context).textTheme.caption!.copyWith(
                                    fontSize: h*0.02
                                ),),
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              navigateTo(context, const SettingsScreen());
                            },
                            icon: Icon(Icons.settings,color: Colors.grey,size: h*.035,))
                      ],
                    ),
                    SizedBox(height: h*0.04,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: w*0.03),
                      child: Column(
                        children: [
                          customDrawerItem(
                            h, w, 'home'.tr(),
                            Icons.home,
                            onTap: () {},
                          ),
                          customDrawerItem(
                              h, w, 'yourOrders'.tr(),Icons.reorder,
                              onTap: () {}),
                          customDrawerItem(
                              h, w, 'offers'.tr(),Icons.local_offer,
                              onTap: () {}),
                          customDrawerItem(
                              h, w, 'notifications'.tr(),Icons.notifications_none,
                              onTap: () {}),
                          customDrawerItem(h, w, 'gethelp'.tr(),Icons.help, onTap: () {}),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                Icon(Icons.payment,size: h*.035,),
                                SizedBox(width: w*0.03,),
                                Text('talabat'.tr(),style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: h*.022
                                ),),
                                const Spacer(),
                                Text('EGP 0.00',style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w500,
                                    fontSize: h*.020
                                ),),
                                SizedBox(height: h*0.08,),
                              ],
                            ),
                          ),
                          customDrawerItem(
                              h, w, 'about'.tr(),Icons.more,
                              onTap: (){
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon:  Icon(Icons.menu,size: h*0.04,),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            backgroundColor: Colors.white,
            toolbarHeight: h*0.12,
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: h*0.007,),
                  Text('appTitle'.tr(),style: TextStyle(
                    color: Colors.black.withOpacity(0.6)
                  ),),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      dropdownColor: Colors.white,
                      alignment: Alignment.center,
                      style:  TextStyle(
                        color: Colors.deepOrange,
                        fontSize: h*0.023,
                      ),
                      value: AppCubit.get(context).dropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down,color: Colors.deepOrange,),
                      items: AppCubit.get(context).items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        AppCubit.get(context).changeDropValue(newValue);
                      },
                    ),
                  ),
                  // Text('شارع المدينة المنورة - توريل',style: TextStyle(
                  //   color: Colors.deepOrange
                  // ),),
                ],
              ),
            ),
            actions:  [
              IconButton(
                onPressed: () {  },
                icon:  Icon(
                  Icons.search,
                  size: h*0.04,
                ),
              ),
              SizedBox(width: w*0.003,)
            ],
          ),
          body:  SingleChildScrollView(
            child: Padding(
              padding: translator.activeLanguageCode=='en'?EdgeInsets.only(left: w*0.03):EdgeInsets.only(right: w*0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: h*.012,),
                  if(AppCubit.get(context).isNoteVisible)
                  Padding(
                    padding: translator.activeLanguageCode=='en'?EdgeInsets.only(right: w*0.03):EdgeInsets.only(left: w*0.03),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      height: h*.1,
                      width: w,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: w*0.015),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('note_1'.tr(),style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: h*.02
                                ),),
                                const Spacer(),
                                IconButton(onPressed: () {
                                  AppCubit.get(context).hideNote();
                                }, icon: const Icon(
                                  Icons.close
                                ))
                              ],
                            ),
                            SizedBox(height: h*.005,),
                            InkWell(
                              onTap: () {},
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              child: SizedBox(
                                child: Text('note_2'.tr(),style: TextStyle(
                                  color: Colors.orange,
                                    fontWeight: FontWeight.w500,
                                    fontSize: h*.02
                                ),),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: h*0.05),
                  Text(
                    '${'intro'.tr()} \nAhmed',
                    style: TextStyle(
                        fontSize: h*0.03,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: h*0.03),
                  Row(children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),bottomRight: Radius.circular(20),topLeft: Radius.circular(20) ,
                      ),
                      child: Image.network(
                        'https://i.pinimg.com/originals/fa/f4/0a/faf40a284ebf21217e565d588f81e194.jpg',
                        height: h*0.25,
                        width: w*0.22,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(width: w*0.015,),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),bottomRight: Radius.circular(20),topLeft: Radius.circular(20) ,
                      ),
                      child: Image.network(
                        'https://midwestcommunity.org/wp-content/uploads/2018/02/Groceries-ThinkstockPhotos-836782690.jpg',
                        height: h*0.25,
                        width: w*0.22,
                        fit: BoxFit.fill,
                      ),
                    ),


                  ],),
                  SizedBox(height: h*0.05,),
                  Text(
                    'text1'.tr(),
                    style: TextStyle(
                        fontSize: h*0.03,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: h*0.015,),
                    SizedBox(
                      height: h*0.4,
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index) => createGroceryItems(h,w,context,gorceryItems[index]),
                          separatorBuilder: (context,index) => SizedBox(width: w*0.02,),
                          itemCount: gorceryItems.length),
                    ),
                  SizedBox(height: h*0.07,),
                  Text(
                    'text_2'.tr(),
                    style: TextStyle(
                        fontSize: h*0.03,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: h*0.015,),
                  SizedBox(
                    height: h*0.4,
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index) => createDessertItems(h,w,context,dessertItems[index]),
                        separatorBuilder: (context,index) => SizedBox(width: w*0.02,),
                        itemCount: gorceryItems.length),
                  ),
                  SizedBox(height: h*0.07,),
                  Text(
                    'text_3'.tr(),
                    style: TextStyle(
                        fontSize: h*0.03,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: h*0.015,),
                  SizedBox(
                    height: h*0.4,
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index) => createFreeDeliveryItems(h,w,context,freeDeliveryItems[index]),
                        separatorBuilder: (context,index) => SizedBox(width: w*0.02,),
                        itemCount: gorceryItems.length),
                  ),
                  SizedBox(height: h*0.07,),
                  Text(
                    'text_4'.tr(),
                    style: TextStyle(
                        fontSize: h*0.03,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: h*0.015,),
                  SizedBox(
                    height: h*0.4,
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index) => createNearestItems(h,w,context,nearestItems[index]),
                        separatorBuilder: (context,index) => SizedBox(width: w*0.02,),
                        itemCount: nearestItems.length),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget createGroceryItems(h,w,context,GroceriesModel model)
{
  return  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child:
        Image.network(
          model.image,
          width: w*0.4,
          height: h*0.18,
          fit: BoxFit.fill,
        ),
      ),
      SizedBox(height: h*0.034,),
      SizedBox(
        width: w*0.42,
        child: Row(
          children: [
            SizedBox(
              width: w*0.19,
              child: Text(
                model.name,style: TextStyle(
                  fontSize: h*0.025,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis
              ),
                maxLines: 1,
              ),
            ),
            const Spacer(),
            Icon(Icons.delivery_dining,size: h*0.03,),
            SizedBox(width: w*0.005,),
            Text('${'time'.tr()} ${model.deliveryTime} ${translator.activeLanguageCode=='en'?'mins':'دقيقة'}',style: TextStyle(
              fontSize: h*0.023,
            ),),
            SizedBox(width: w*0.01,),
          ],
        ),
      ),
      SizedBox(height: h*0.005,),
      Text('grocery'.tr(),style: Theme.of(context).textTheme.caption?.copyWith(
          fontSize: h*0.023
      ),),
      SizedBox(height: h*0.005,),
      Row(
        children: [
          Icon(Icons.emoji_emotions_outlined,size: h*0.03,),
          SizedBox(width: w*0.005,),
          Text(getRate(model.rate),style: Theme.of(context).textTheme.caption?.copyWith(
              fontSize: h*0.02
          ),),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: w*0.015),
            child: Text('-',style: Theme.of(context).textTheme.caption?.copyWith(
                fontSize: h*0.023
            ),),
          ),
          Text('${'delivery'.tr()} ${'free'.tr()}',style: Theme.of(context).textTheme.caption?.copyWith(
              fontSize: h*0.02
          ),),
        ],
      ),
      SizedBox(height: h*0.005,),
      if(model.special==true)
        Row(
          children: [
            const Icon(Icons.local_offer,color: Colors.redAccent,),
            SizedBox(width: w*0.008,),
            Text('specialoffer'.tr(),style: TextStyle(
                fontSize: h*0.02,
                color: Colors.redAccent
            ),),
          ],
        ),

    ],
  );
}

Widget createDessertItems(h,w,context,DessertsModel model)
{
  return  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child:
        Image.network(
          model.image,
          width: w*0.4,
          height: h*0.18,
          fit: BoxFit.fill,
        ),
      ),
      SizedBox(height: h*0.034,),
      SizedBox(
        width: w*0.42,
        child: Row(
          children: [
            SizedBox(
              width: w*0.19,
              child: Text(
                model.name,style: TextStyle(
                  fontSize: h*0.025,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis
              ),
                maxLines: 1,
              ),
            ),
            const Spacer(),
            Icon(Icons.delivery_dining,size: h*0.03,),
            SizedBox(width: w*0.005,),
            Text('${'time'.tr()} ${model.deliveryTime} ${translator.activeLanguageCode=='en'?'mins':'دقيقة'}',style: TextStyle(
              fontSize: h*0.023,
            ),),
            SizedBox(width: w*0.01,),
          ],
        ),
      ),
      SizedBox(height: h*0.005,),
      Text('dessert'.tr(),style: Theme.of(context).textTheme.caption?.copyWith(
          fontSize: h*0.023
      ),),
      SizedBox(height: h*0.005,),
      Row(
        children: [
          Icon(Icons.emoji_emotions_outlined,size: h*0.03,),
          SizedBox(width: w*0.005,),
          Text(getRate(model.rate),style: Theme.of(context).textTheme.caption?.copyWith(
              fontSize: h*0.02
          ),),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: w*0.015),
            child: Text('-',style: Theme.of(context).textTheme.caption?.copyWith(
                fontSize: h*0.023
            ),),
          ),
          Text('${'delivery'.tr()} ${'free'.tr()}',style: Theme.of(context).textTheme.caption?.copyWith(
              fontSize: h*0.02
          ),),
        ],
      ),
      SizedBox(height: h*0.005,),
      if(model.special==true)
        Row(
          children: [
            const Icon(Icons.local_offer,color: Colors.redAccent,),
            SizedBox(width: w*0.008,),
            Text('specialoffer'.tr(),style: TextStyle(
                fontSize: h*0.02,
                color: Colors.redAccent
            ),),
          ],
        ),

    ],
  );
}

Widget createFreeDeliveryItems(h,w,context,FreeDeliveryModel model)
{
  return  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child:
        Image.network(
          model.image,
          width: w*0.4,
          height: h*0.18,
          fit: BoxFit.fill,
        ),
      ),
      SizedBox(height: h*0.034,),
      SizedBox(
        width: w*0.42,
        child: Row(
          children: [
            SizedBox(
              width: w*0.19,
              child: Text(
                model.name,style: TextStyle(
                  fontSize: h*0.025,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis
              ),
                maxLines: 1,
              ),
            ),
            const Spacer(),
            Icon(Icons.delivery_dining,size: h*0.03,),
            SizedBox(width: w*0.005,),
            Text('${'time'.tr()} ${model.deliveryTime} ${translator.activeLanguageCode=='en'?'mins':'دقيقة'}',style: TextStyle(
              fontSize: h*0.023,
            ),),
            SizedBox(width: w*0.01,),
          ],
        ),
      ),
      SizedBox(height: h*0.005,),
      Text('grocery'.tr(),style: Theme.of(context).textTheme.caption?.copyWith(
          fontSize: h*0.023
      ),),
      SizedBox(height: h*0.005,),
      Row(
        children: [
          Icon(Icons.emoji_emotions_outlined,size: h*0.03,),
          SizedBox(width: w*0.005,),
          Text(getRate(model.rate),style: Theme.of(context).textTheme.caption?.copyWith(
              fontSize: h*0.02
          ),),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: w*0.015),
            child: Text('-',style: Theme.of(context).textTheme.caption?.copyWith(
                fontSize: h*0.023
            ),),
          ),
          Text('${'delivery'.tr()} ${'free'.tr()}',style: Theme.of(context).textTheme.caption?.copyWith(
              fontSize: h*0.02
          ),),
        ],
      ),
      SizedBox(height: h*0.005,),
      if(model.special==true)
        Row(
          children: [
            const Icon(Icons.local_offer,color: Colors.redAccent,),
            SizedBox(width: w*0.008,),
            Text('specialoffer'.tr(),style: TextStyle(
                fontSize: h*0.02,
                color: Colors.redAccent
            ),),
          ],
        ),

    ],
  );
}

Widget createNearestItems(h,w,context,NearestModel model)
{
  return  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child:
        Image.network(
          model.image,
          width: w*0.4,
          height: h*0.18,
          fit: BoxFit.fill,
        ),
      ),
      SizedBox(height: h*0.034,),
      SizedBox(
        width: w*0.42,
        child: Row(
          children: [
            SizedBox(
              width: w*0.19,
              child: Text(
                model.name,style: TextStyle(
                  fontSize: h*0.025,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis
              ),
                maxLines: 1,
              ),
            ),
            const Spacer(),
            Icon(Icons.delivery_dining,size: h*0.03,),
            SizedBox(width: w*0.005,),
            Text('${'time'.tr()} ${model.deliveryTime} ${translator.activeLanguageCode=='en'?'mins':'دقيقة'}',style: TextStyle(
              fontSize: h*0.023,
            ),),
            SizedBox(width: w*0.01,),
          ],
        ),
      ),
      SizedBox(height: h*0.005,),
      Text('grocery'.tr(),style: Theme.of(context).textTheme.caption?.copyWith(
          fontSize: h*0.023
      ),),
      SizedBox(height: h*0.005,),
      Row(
        children: [
          Icon(Icons.emoji_emotions_outlined,size: h*0.03,),
          SizedBox(width: w*0.005,),
          Text(getRate(model.rate),style: Theme.of(context).textTheme.caption?.copyWith(
              fontSize: h*0.02
          ),),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: w*0.015),
            child: Text('-',style: Theme.of(context).textTheme.caption?.copyWith(
                fontSize: h*0.023
            ),),
          ),
          Text('${'delivery'.tr()} ${'free'.tr()}',style: Theme.of(context).textTheme.caption?.copyWith(
              fontSize: h*0.02
          ),),
        ],
      ),
      SizedBox(height: h*0.005,),
      if(model.special==true)
        Row(
          children: [
            const Icon(Icons.local_offer,color: Colors.redAccent,),
            SizedBox(width: w*0.008,),
            Text('specialoffer'.tr(),style: TextStyle(
                fontSize: h*0.02,
                color: Colors.redAccent
            ),),
          ],
        ),

    ],
  );
}



