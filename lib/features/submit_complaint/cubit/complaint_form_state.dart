part of 'complaint_form_cubit.dart';



enum ComplaintType { service, billing, technical, other }

extension ComplaintTypeExtension on ComplaintType {
  String toLocalizedString() {
    switch (this) {
      case ComplaintType.service:
        return "Service Issue";
      case ComplaintType.billing:
        return "Billing Problem";
      case ComplaintType.technical:
        return "Technical Error";
      case ComplaintType.other:
        return "Other";
    }
  }
}

class ComplaintFormState extends Equatable {
  final GlobalKey<FormState> formKey;
  final String name;
  final String phone;
  final String details;
  final int typeIndex;
  final String? error;

  const ComplaintFormState({
    required this.formKey,
    required this.name,
    required this.phone,
    required this.details,
    required this.typeIndex,
    this.error,
  });

  ComplaintFormState copyWith({
    GlobalKey<FormState>? formKey,
    String? name,
    String? phone,
    String? details,
    int? typeIndex,
    String? error,
  }) {
    return ComplaintFormState(
      formKey: formKey ?? this.formKey,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      details: details ?? this.details,
      typeIndex: typeIndex ?? this.typeIndex,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [formKey, name, phone, details, typeIndex, error];
}
