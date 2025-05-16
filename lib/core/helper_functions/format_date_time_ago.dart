String formatDateTimeAgo({required String rawDate}) {
  try {
    final dateTime = DateTime.parse(
      rawDate,
    ).add(const Duration(hours: 3)); // ✅ إضافة 3 ساعات
    final Duration diff = DateTime.now().difference(dateTime);

    if (diff.inSeconds < 60) return 'منذ ثواني';
    if (diff.inMinutes < 60) return 'منذ ${diff.inMinutes} دقيقة';
    if (diff.inHours < 24) return 'منذ ${diff.inHours} ساعة';
    if (diff.inDays < 7) return 'منذ ${diff.inDays} يوم';
    if (diff.inDays < 30) return 'منذ ${diff.inDays ~/ 7} أسبوع';
    if (diff.inDays < 365) return 'منذ ${diff.inDays ~/ 30} شهر';
    return 'منذ ${diff.inDays ~/ 365} سنة';
  } catch (e) {
    return 'تاريخ غير صالح';
  }
}
