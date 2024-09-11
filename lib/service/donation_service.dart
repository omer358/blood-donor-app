import 'package:cloud_firestore/cloud_firestore.dart';

class DonationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch donation requests from Firestore
  Future<List<Map<String, dynamic>>> fetchDonationRequests() async {
    QuerySnapshot snapshot =
    await _firestore.collection('donationRequests').get();
    return snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }
}
