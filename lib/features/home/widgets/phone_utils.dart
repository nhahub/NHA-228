String normalizePhone(String? raw) {
  if (raw == null) return '';

  const arabic = [
    '\u0660',
    '\u0661',
    '\u0662',
    '\u0663',
    '\u0664',
    '\u0665',
    '\u0666',
    '\u0667',
    '\u0668',
    '\u0669',
  ];
  String s = raw;
  for (int i = 0; i < arabic.length; i++) {
    s = s.replaceAll(arabic[i], i.toString());
  }

  s = s.replaceAll(RegExp(r'[\u200B-\u200D\uFEFF]'), '');

  s = s.trim();
  s = s.replaceAll(RegExp(r'[^0-9+]'), '');
  String phone = s.replaceAll('+', '');

  if (phone.startsWith('00')) phone = phone.substring(2);

  if (phone.startsWith('0')) phone = '20' + phone.substring(1);

  if (phone.length < 8 || phone.length > 15) return '';

  return phone;
}

Uri? buildWhatsAppUri(String? rawNumber) {
  final normalized = normalizePhone(rawNumber);
  if (normalized.isEmpty) return null;
  return Uri.parse('https://wa.me/$normalized');
}
