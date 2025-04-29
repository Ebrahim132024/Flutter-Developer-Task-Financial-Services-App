import 'package:financialservicesapp/core/utils/localizations.dart';
import 'package:financialservicesapp/features/submit_complaint/cubit/complaint_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class SubmitComplaintScreen extends StatelessWidget {
  const SubmitComplaintScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ComplaintFormCubit(),
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.submitComplaint)),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<ComplaintFormCubit, ComplaintFormState>(
              builder: (context, state) {
                return Form(
                  key: state.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
          
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        AppLocalizations.of(context)!.name,
                        style: TextStyle(fontSize: 16),
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: AppLocalizations.of(context)!.name),
                        validator: (value) => value?.isEmpty ?? true ? AppLocalizations.of(context)!.allFieldsRequired : null,
                        onChanged: (val) => context.read<ComplaintFormCubit>().updateName(val),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        AppLocalizations.of(context)!.phone,
                        style: TextStyle(fontSize: 16),
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: AppLocalizations.of(context)!.phone),
                        keyboardType: TextInputType.phone,
                        validator: (value) => value?.isEmpty ?? true ? AppLocalizations.of(context)!.allFieldsRequired : null,
                        onChanged: (val) => context.read<ComplaintFormCubit>().updatePhone(val),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        AppLocalizations.of(context)!.complaintType,
                        style: TextStyle(fontSize: 16),
                      ),
                      DropdownButtonFormField<int>(
                        value: state.typeIndex,
                        items: ComplaintType.values.map((type) {
                          return DropdownMenuItem(value: type.index, child: Text(type.toLocalizedString()));
                        }).toList(),
                        onChanged: (val) => context.read<ComplaintFormCubit>().updateType(val!),
          
                      ),
                      const SizedBox(height: 20),
                      Text(
                        AppLocalizations.of(context)!.details,
                        style: TextStyle(fontSize: 16),
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: AppLocalizations.of(context)!.details),
                        maxLines: 4,
                        validator: (value) => value?.isEmpty ?? true ? AppLocalizations.of(context)!.allFieldsRequired : null,
                        onChanged: (val) => context.read<ComplaintFormCubit>().updateDetails(val),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (state.formKey.currentState!.validate()) {
                              context.read<ComplaintFormCubit>().submitForm();
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.thankYou)));
                            }
                          },
                          child: Text(AppLocalizations.of(context)!.submit),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
