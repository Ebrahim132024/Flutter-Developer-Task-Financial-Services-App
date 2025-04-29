// lib/features/submit_complaint/models/complaint_type.dart

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