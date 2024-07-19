import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'language_state.dart';

class LanguageCubitCubit extends Cubit<Locale> {
  LanguageCubitCubit() : super(const Locale('ar', ''));

  static const _languageEn = Locale('en', '');
  static const _languageAr = Locale('ar', '');

  void changeLangEn(context) async {
    emit(_languageEn);
  }

  void changeLangAr(context) async {
    emit(_languageAr);
  }
}
