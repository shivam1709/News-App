class Constants {
  static String TOP_HEADLINES_URL =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=8056694444d14962bad453d20667bcc2";

  static String headlinesfor(String keyword) {
    return "https://newsapi.org/v2/everything?q=$keyword&apiKey=8056694444d14962bad453d20667bcc2";
  }
}
