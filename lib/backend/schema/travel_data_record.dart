import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class TravelDataRecord extends FirestoreRecord {
  TravelDataRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "json_data" field.
  String? _jsonData;
  String get jsonData => _jsonData ?? '';
  bool hasJsonData() => _jsonData != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _startDate = snapshotData['start_date'] as DateTime?;
    _endDate = snapshotData['end_date'] as DateTime?;
    _imageUrl = snapshotData['image_url'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _jsonData = snapshotData['json_data'] as String?;
    _city = snapshotData['city'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('travel_data');

  static Stream<TravelDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TravelDataRecord.fromSnapshot(s));

  static Future<TravelDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TravelDataRecord.fromSnapshot(s));

  static TravelDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TravelDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TravelDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TravelDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TravelDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TravelDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTravelDataRecordData({
  DateTime? startDate,
  DateTime? endDate,
  String? imageUrl,
  DocumentReference? userRef,
  String? jsonData,
  String? city,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'start_date': startDate,
      'end_date': endDate,
      'image_url': imageUrl,
      'userRef': userRef,
      'json_data': jsonData,
      'city': city,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class TravelDataRecordDocumentEquality implements Equality<TravelDataRecord> {
  const TravelDataRecordDocumentEquality();

  @override
  bool equals(TravelDataRecord? e1, TravelDataRecord? e2) {
    return e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.userRef == e2?.userRef &&
        e1?.jsonData == e2?.jsonData &&
        e1?.city == e2?.city &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(TravelDataRecord? e) => const ListEquality().hash([
        e?.startDate,
        e?.endDate,
        e?.imageUrl,
        e?.userRef,
        e?.jsonData,
        e?.city,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is TravelDataRecord;
}
