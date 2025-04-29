// lib/core/utils/localizations.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;


class AppLocalizations {
  final Locale locale;
  final Map<String, String> _localizedValues;

  AppLocalizations(this.locale, this._localizedValues);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  // === All Translation Keys Below === //

  String get appName => _localizedValues['appName'] ?? '';
  String get more  => _localizedValues['more'] ?? '';
  String get contactUs => _localizedValues['contactUs'] ?? '';
  String get products => _localizedValues['products'] ?? '';
  String get submitComplaint => _localizedValues['submitComplaint'] ?? '';
  String get aboutCompany => _localizedValues['aboutCompany'] ?? '';
  String get name => _localizedValues['name'] ?? '';
  String get phone => _localizedValues['phone'] ?? '';
  String get companyOverview => _localizedValues['companyOverview'] ?? '';
  String get mission => _localizedValues['mission'] ?? '';
  String get vision => _localizedValues['vision'] ?? '';
  String get place => _localizedValues['place'] ?? '';
  String get message => _localizedValues['message'] ?? '';
  String get send => _localizedValues['send'] ?? '';
  String get whatsapp => _localizedValues['whatsapp'] ?? '';
  String get email => _localizedValues['email'] ?? '';
  String get complaintType => _localizedValues['complaintType'] ?? '';
  String get details => _localizedValues['details'] ?? '';
  String get submit => _localizedValues['submit'] ?? '';
  String get serviceIssue => _localizedValues['serviceIssue'] ?? '';
  String get billingProblem => _localizedValues['billingProblem'] ?? '';
  String get technicalError => _localizedValues['technicalError'] ?? '';
  String get other => _localizedValues['other'] ?? '';
  String get allFieldsRequired => _localizedValues['allFieldsRequired'] ?? '';
  String get thankYou => _localizedValues['thankYou'] ?? '';
  String get successMessage => _localizedValues['successMessage'] ?? '';
  String get errorMessage => _localizedValues['errorMessage'] ?? '';
  String get settings => _localizedValues['settings'] ?? '';
  String get language => _localizedValues['language'] ?? '';
  String get english => _localizedValues['english'] ?? '';
  String get arabic => _localizedValues['arabic'] ?? '';
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final String jsonContent = await rootBundle.loadString('assets/translations/${locale.languageCode}.json');
    final Map<String, dynamic> map = json.decode(jsonContent);
    final localizedMap = map.map((key, value) => MapEntry(key, value.toString()));
    return AppLocalizations(locale, localizedMap);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}