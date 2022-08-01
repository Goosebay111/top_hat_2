class ProcessURL {
  static String? convertURL(String? youTubeUrl) {
    try {
      if (youTubeUrl == null) {
        return null;
      }
      if (youTubeUrl.substring(0, 17) == 'https://youtu.be/') {
        return _convertYoutubeAbbreviatedUrlToVideoUrl(youTubeUrl);
      } else if (youTubeUrl.substring(0, 27) == 'https://youtube.com/shorts/') {
        return _convertYoutubeShortsUrlToVideoUrl(youTubeUrl);
      } else if (youTubeUrl.substring(0, 32) ==
          'https://www.youtube.com/watch?v=') {
        return youTubeUrl;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  static String? _convertYoutubeShortsUrlToVideoUrl(String? youtubeUrl) {
    if (youtubeUrl == null) {
      return null;
    }
    final regExp = RegExp(r'^.*(youtube.com\/|shorts\/)([^#\&\?]*).*');
    final match = regExp.firstMatch(youtubeUrl);
    return match != null ? 'https://www.youtube.com/watch?v=${match[2]}' : null;
  }

  static String? _convertYoutubeAbbreviatedUrlToVideoUrl(String youtubeUrl) {
    final regExp = RegExp(
        r'^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*');
    final match = regExp.firstMatch(youtubeUrl);
    return match != null ? 'https://www.youtube.com/watch?v=${match[2]}' : null;
  }
}
