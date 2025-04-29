import 'package:financialservicesapp/core/lang/language_cubit.dart';
import 'package:financialservicesapp/features/about_company/about_company_screen.dart';
import 'package:financialservicesapp/features/contact_us/contact_us_screen.dart';
import 'package:financialservicesapp/features/products/products_screen.dart';
import 'package:financialservicesapp/features/submit_complaint/submit_complaint_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/localizations.dart';
import 'features/home/home_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'features/products/models/product_model.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Init Hive if used
  await Hive.initFlutter();
  await Hive.openBox<ProductModel>('products');

  // Init SharedPrefs
  final prefs = await SharedPreferences.getInstance();
  final langCode = prefs.getString('app_locale') ?? 'en';

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LanguageCubit()),
      ],
      child: MyApp(savedLocale: Locale(langCode)),
    ),
  );
}
class MyApp extends StatelessWidget {
  final Locale savedLocale;
  const MyApp({Key? key, required this.savedLocale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, locale) {
        return MaterialApp(
          locale: locale, // fallback to savedLocale if needed
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
          home: const HomeScreen(),
          theme: AppTheme.lightTheme,
        );
      },
    );
  }
}

