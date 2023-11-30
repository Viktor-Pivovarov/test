import 'package:jojo_ui_kit/jojo_ui_kit.dart';

enum OfferStatus {
  youAreLiked, // Ты нравишься
  waitingForCandidate, // Ждем ответа кандидата
  mutualAttraction; // Взаимная симпатия

  CandidateCardType toCandidateCardType() {
    switch (this) {
      case youAreLiked:
        return CandidateCardType.liked;
      case waitingForCandidate:
        return CandidateCardType.waiting;
      case mutualAttraction:
        return CandidateCardType.mutual;
    }
  }
}
