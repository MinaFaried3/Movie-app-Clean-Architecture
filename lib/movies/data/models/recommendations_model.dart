import '../../domain/entities/recommendation.dart';

class RecommendationsModel extends Recommendations {
  const RecommendationsModel({super.backdropPath, required super.id});

  factory RecommendationsModel.fromJson(Map<String, dynamic> json) {
    return RecommendationsModel(
        backdropPath:
            json["backdrop_path"] ?? "/p1F51Lvj3sMopG948F5HsBbl43C.jpg",
        id: json["id"]);
  }
}
