class UtilFunctions {
  static String returnRatingText(double starsNumber) {
    if (starsNumber <= 1) {
      return 'Very bad quality';
    } else if (starsNumber <= 2 && starsNumber > 1) {
      return 'Bad quality';
    } else if (starsNumber <= 3 && starsNumber > 2) {
      return 'Good quality';
    } else if (starsNumber <= 4 && starsNumber > 3) {
      return 'Very good quality';
    } else if (starsNumber <= 5 && starsNumber > 4) {
      return 'Excellent quality';
    }
    return '';
  }
}
