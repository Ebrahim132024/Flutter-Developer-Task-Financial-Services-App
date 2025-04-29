import 'package:financialservicesapp/core/constants/app_colors.dart';
import 'package:financialservicesapp/core/constants/app_strings.dart';
import 'package:financialservicesapp/core/lang/language_cubit.dart';
import 'package:financialservicesapp/core/utils/localizations.dart';
import 'package:financialservicesapp/features/about_company/about_company_screen.dart';
import 'package:financialservicesapp/features/contact_us/contact_us_screen.dart';
import 'package:financialservicesapp/features/products/products_screen.dart';
import 'package:financialservicesapp/features/submit_complaint/submit_complaint_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttons = [
      {
        'title': AppLocalizations.of(context)!.contactUs,
        'icon': Icons.call,
        'screen': ContactUsScreen()
      },
      {
        'title': AppLocalizations.of(context)!.products,
        'icon': Icons.shopping_cart,
        'screen': const ProductsScreen()
      },
      {
        'title': AppLocalizations.of(context)!.submitComplaint,
        'icon': Icons.reviews,
        'screen': const SubmitComplaintScreen()
      },
      {
        'title': AppLocalizations.of(context)!.aboutCompany,
        'icon': Icons.question_mark,
        'screen': const AboutCompanyScreen()
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appName),
        actions: [
          IconButton(
            icon: Icon(Icons.translate),
            onPressed: () {
              context.read<LanguageCubit>().toggleLanguage();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  "https://hapijournal.com/wp-content/uploads/2024/09/000-1.jpg",
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 30),
              ListView.separated(
                itemCount: buttons.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => buttons[index]['screen'] as Widget)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.background,
                      foregroundColor: AppColors.primary,
                      minimumSize:
                          Size(MediaQuery.of(context).size.width / 2 - 50, 50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(buttons[index]["icon"] as IconData),
                        SizedBox(
                          width: 8,
                        ),
                        Text(buttons[index]["title"] as String),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
