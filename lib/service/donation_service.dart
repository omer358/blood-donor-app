import 'package:cloud_firestore/cloud_firestore.dart';

class DonationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Stream of donation requests for real-time updates, sorted by date
  Stream<List<Map<String, dynamic>>> getDonationRequestsStream() {
    return _firestore
        .collection('donationRequests')
        .orderBy('createdAt', descending: true) // Sort by 'createdAt' field in descending order
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList());
  }
}
