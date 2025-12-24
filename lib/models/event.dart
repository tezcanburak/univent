import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String? title;
  final String? community;
  final String? dateTimeText;
  final String? imageAsset;
  final String? cost;

  const Event({required this.title, required this.community, required this.dateTimeText, required this.imageAsset, required this.cost});

  Event copyWith({String? title, String? community, String? dateTimeText, String? imageAsset, String? cost}) {
    return Event(
      title: title ?? this.title,
      community: community ?? this.community,
      imageAsset: imageAsset ?? this.imageAsset,
      dateTimeText: dateTimeText ?? this.dateTimeText,
      cost: cost ?? this.cost,
    );
  }

  Map<String, dynamic> toJson() => {'uid': title, 'subject': community, 'dateTimeText': dateTimeText, 'imageAsset': imageAsset, 'cost': cost};

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      title: json['uid'],
      community: json['subject'],
      dateTimeText: json['dateTimeText'],
      imageAsset: json['imageAsset'],
      cost: json['cost'],
    );
  }

  factory Event.fromFirestore(DocumentSnapshot doc) {
    if (!doc.exists) {
      return const Event(title: '', community: '', dateTimeText: '', imageAsset: '', cost: '');
    }
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Event(
      title: data['uid'],
      community: data['subject'],
      dateTimeText: data['dateTimeText'],
      imageAsset: data['imageAsset'],
      cost: data['cost'],
    );
  }

  const Event.empty() : title = null, community = null, imageAsset = null, dateTimeText = null, cost = null;
}
