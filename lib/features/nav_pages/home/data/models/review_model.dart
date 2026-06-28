class ReviewModel {
  final String reviewerName;
  final String date;
  final double rating;
  final String reviewText;

  const ReviewModel({
    required this.reviewerName,
    required this.date,
    required this.rating,
    required this.reviewText,
  });
}
