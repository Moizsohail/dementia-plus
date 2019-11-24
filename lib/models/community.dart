import 'package:cloud_firestore/cloud_firestore.dart';

class AnswerModel {
  String answer;
  int score;
  AnswerModel(this.answer, {this.score:0});
}

class CommunityModel {
  String subject;
  String description;
  List<AnswerModel> answer = [];
  String docId;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {"subject": subject,"description":description};
    data["answer"] = List<String>();
    data["score"] = List<int>();
    for (var i = 0; i < answer.length; i++) {
      data["answer"].add(answer[i].answer);
      data["score"].add(answer[i].score);
    }
    return data;
  }

  void fromMap(DocumentSnapshot data) {
    docId = data.documentID;
    subject = data['subject'];
    description = data['description'];
    for (int i = 0; i < data['answer'].length; i++) {
      answer.add(AnswerModel(data['answer'][i], score:data['score'][i]));
    }
  }
}
