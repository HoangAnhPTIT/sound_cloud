class ConvertTrackDudations {
  static String formatedTime({required int timeInSecond}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? "$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute:$second";
  }
}

class ConvertPlaybackCount {
  static String handler(num playBackCount) {
    return playBackCount >= 1000000
        ? "${(playBackCount / 1000000).toStringAsFixed(2)}M"
        : "${(playBackCount / 1000).toStringAsFixed(3)}M";
  }
}

class ConvertDateDiffToDynamicDate {
  static String handler(int days) {
    if (days < 7) {
      return '${days}d';
    } else if (days < 30) {
      return '${(days / 7).floor()}w';
    } else if (days < 365) {
      return '${(days / 30).floor()}mo';
    } else {
      return '${(days / 365).floor()}y';
    }
  }
}
