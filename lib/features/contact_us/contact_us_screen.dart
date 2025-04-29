import 'package:financialservicesapp/core/utils/localizations.dart';
import 'package:financialservicesapp/features/contact_us/cubit/contact_us_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';



class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactFormCubit(),
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.contactUs)),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                "https://hapijournal.com/wp-content/uploads/2024/09/000-1.jpg",
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.phone, color: Colors.red),
                      const SizedBox(width: 8),
                      Text("+1 234 567 8900", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.email, color: Colors.red),
                      const SizedBox(width: 8),
                      Text("info@example.com", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration: InputDecoration(labelText: AppLocalizations.of(context)!.name),
                    validator: (value) => value?.isEmpty ?? true ? AppLocalizations.of(context)!.allFieldsRequired : null,
                    onChanged: (val) => context.read<ContactFormCubit>().updateName(val),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(labelText: AppLocalizations.of(context)!.phone),
                    keyboardType: TextInputType.phone,
                    validator: (value) => value?.isEmpty ?? true ? AppLocalizations.of(context)!.allFieldsRequired : null,
                    onChanged: (val) => context.read<ContactFormCubit>().updatePhone(val),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(labelText: AppLocalizations.of(context)!.message),
                    maxLines: 4,
                    validator: (value) => value?.isEmpty ?? true ? AppLocalizations.of(context)!.allFieldsRequired : null,
                    onChanged: (val) => context.read<ContactFormCubit>().updateMessage(val),
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<ContactFormCubit, ContactFormState>(
                    builder: (context, state) {
                      if (state.error != null) {
                        return Text(state.error!, style: TextStyle(color: Colors.red));
                      }
                      return Container();
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<ContactFormCubit>().submitForm();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.thankYou)));
                      }
                    },
                    child: Text(AppLocalizations.of(context)!.send),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () async {
                          final url = "https://wa.me/1234567890?text=Hello";
                          if (await canLaunchUrl(Uri.parse(url))) await launchUrl(Uri.parse(url));
                        },
                        icon: Icon(Icons.call_made_outlined),
                        label: Text(AppLocalizations.of(context)!.whatsapp),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      ),
                      ElevatedButton.icon(
                        onPressed: () async {
                          final Uri emailLaunchUri = Uri(
                            scheme: 'mailto',
                            path: 'email@example.com',
                            queryParameters: {'subject': 'Support Request', 'body': ''},
                          );
                          if (await canLaunchUrl(emailLaunchUri)) await launchUrl(emailLaunchUri);
                        },
                        icon: Icon(Icons.email),
                        label: Text(AppLocalizations.of(context)!.email),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}