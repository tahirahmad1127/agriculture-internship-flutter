import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internship_task_1/models/questions_model.dart';

class QuestionsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<QuestionsModel>> getQuestionsStream() {
    return _firestore.collection('questions')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      print("Fetched documents: ${snapshot.docs.length}");
      return snapshot.docs.map((doc) {
        print("Doc: ${doc.data()}");
        return QuestionsModel.fromJson(doc.data(), doc.id);
      }).toList();
    });
  }
  Future<void> submitAnswer(String docId, String answer) async {
    await FirebaseFirestore.instance.collection('questions').doc(docId).update({
      'answer': answer,
      'status': 'Answered',
    });
  }

}