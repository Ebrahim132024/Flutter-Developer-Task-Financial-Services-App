part of 'contact_us_cubit.dart';

class ContactFormState extends Equatable {
  final String name;
  final String phone;
  final String message;
  final bool isValid;
  final String? error;

  const ContactFormState({
    this.name = '',
    this.phone = '',
    this.message = '',
    this.isValid = false,
    this.error,
  });

  ContactFormState copyWith({String? name, String? phone, String? message, bool? isValid, String? error}) {
    return ContactFormState(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      message: message ?? this.message,
      isValid: isValid ?? this.isValid,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [name, phone, message, isValid, error];
}
