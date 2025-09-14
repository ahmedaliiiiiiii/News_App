class DateUtilsHelper {
  static String formatNewsDate(String? isoDate) {
    if (isoDate == null || isoDate.isEmpty) return '';

    try {
      final date = DateTime.parse(isoDate);
      final now = DateTime.now();
      final diff = now.difference(date);

      if (diff.inMinutes < 60) {
        return '${diff.inMinutes} minutes ago';
      } else if (diff.inHours < 24) {
        return '${diff.inHours} hours ago';
      } else if (diff.inDays < 7) {
        return '${diff.inDays} days ago';
      } else {
        // fallback -> dd/MM/yyyy
        return '${date.day.toString().padLeft(2, '0')}/'
            '${date.month.toString().padLeft(2, '0')}/'
            '${date.year}';
      }
    } catch (e) {
      return '';
    }
  }
}
