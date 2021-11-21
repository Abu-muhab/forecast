String getTimeDifference(DateTime notificationTime) {
  DateTime now = DateTime.now();
  Duration difference = now.difference(notificationTime);
  if (difference.inMinutes < 60) {
    return "${difference.inMinutes} minutes ago";
  } else if (difference.inHours < 24) {
    return "${difference.inHours} hours ago";
  } else {
    return "${difference.inDays} days ago";
  }
}
