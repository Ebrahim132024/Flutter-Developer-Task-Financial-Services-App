import 'package:financialservicesapp/core/constants/app_colors.dart';
import 'package:financialservicesapp/core/utils/localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutCompanyScreen extends StatelessWidget {
  const AboutCompanyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.aboutCompany)),
      body: ListView(
        padding: const EdgeInsets.all(16),
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
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.companyOverview,
            style: TextStyle(color: AppColors.textPrimary,fontSize: 18,fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          const Text(
            "FinFlex is a leading financial services provider committed to empowering our clients.",
            style: TextStyle(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.mission,
            style: TextStyle(color: AppColors.textPrimary,fontSize: 18,fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          const Text(
            " To provide secure, transparent, and innovative financial solutions.",
            style: TextStyle(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.vision,
            style: TextStyle(color: AppColors.textPrimary,fontSize: 18,fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          const Text(
            "To be a trusted partner in financial success across the region.",
            style: TextStyle(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 30),
          Text(
            AppLocalizations.of(context)!.place,
            style: TextStyle(color: AppColors.textPrimary,fontSize: 18,fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () async {
              final url = "https://maps.app.goo.gl/eeNTXC9iSuDcRRqh7";
              if (await canLaunchUrl(Uri.parse(url)))
                await launchUrl(Uri.parse(url));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                "https://i0.wp.com/www.cssscript.com/wp-content/uploads/2018/03/Simple-Location-Picker.png?fit=561%2C421&ssl=1",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),

        ],
      ),
    );
  }
}
