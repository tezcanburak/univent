
import 'package:cloud_firestore/cloud_firestore.dart';

class Event{
  final String? uid;
  final String? subject;
  final String? textFromAi;
  final DateTime? createdAt;

  const Event({
    required this.uid,
    required this.subject,
    required this.createdAt,
    required this.textFromAi,
  });

  Event copyWith({
    String? uid,
    String? subject,
    String? textFromAi,
    DateTime? createdAt,
  }) {
    return Event(
      uid: uid ?? this.uid,
      subject: subject ?? this.subject,
      createdAt: createdAt ?? this.createdAt,
      textFromAi: textFromAi ?? this.textFromAi,
    );
  }

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'subject': subject,
    'textFromAi': textFromAi,
    'createdAt': DateTime.now(),
  };

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      uid: json['uid'],
      subject: json['subject'],
      textFromAi: json['textFromAi'],
      createdAt: json['createdAt'].toDate(),
    );
  }

  factory Event.fromFirestore(DocumentSnapshot doc) {
    if (!doc.exists) {
      return const Event(
        uid: '',
        subject: '',
        textFromAi: '',
        createdAt: null,
      );
    }
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Event(
      uid: data['uid'],
      subject: data['subject'],
      textFromAi: data['textFromAi'],
      createdAt: data['createdAt'].toDate(),
    );
  }

  const Event.empty()
      : uid = null,
        subject = null,
        createdAt = null,
        textFromAi = null;
}
