String getDaysAgo(String pastDate) {
  DateTime pastDateFormatted = DateTime.parse(pastDate);
  DateTime now = DateTime.now();

  final differenceInDays = now.difference(pastDateFormatted).inDays;
  if (differenceInDays > 0) {
    String dayOrDays = differenceInDays > 1 ? "days" : "day";
    return "$differenceInDays $dayOrDays ago";
  }

  final differenceInHours = now.difference(pastDateFormatted).inHours;
  if (differenceInHours >= 1) {
    String hourOrHours = differenceInHours > 1 ? "hours" : "hour";
    return "$differenceInHours $hourOrHours ago";
  }

  final differenceInMinutes = now.difference(pastDateFormatted).inMinutes;
  if (differenceInMinutes <= 60) {
    String minOrMins = differenceInMinutes > 1 ? "min" : "mins";
    return "$differenceInMinutes $minOrMins ago";
  }

  return '';
}
