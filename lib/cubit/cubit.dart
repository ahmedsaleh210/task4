import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:task_4/cubit/states.dart';
enum Languages {arabic,english}
class AppCubit extends Cubit<AppLayoutStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  Languages lang = translator.activeLanguageCode=='en'?Languages.english:Languages.arabic;
  final items = [
    'شارع المدينة المنورة - توريل',
    'شارع محمد عبد العزيز - قناة السويس',
  ];
  String dropdownvalue = 'شارع المدينة المنورة - توريل';

  bool isNoteVisible = true;

  void changeDropValue(value)
  {
    dropdownvalue = value;
    emit(ChangeItem());
  }
  bool notificationInit = true;

  void changeSwitch()
  {
    notificationInit = !notificationInit;
    emit(ChangeSwitch());
  }
  void hideNote()
  {
    isNoteVisible = !isNoteVisible;
    emit(HideNote());
  }
}

