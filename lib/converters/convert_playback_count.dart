class ConvertPlaybackCount {
  static String handler(num playBackCount) {
    return playBackCount >= 1000000
        ? "${(playBackCount / 1000000).toStringAsFixed(2)}M"
        : "${(playBackCount / 1000).toStringAsFixed(3)}M";
  }
}
