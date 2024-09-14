import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../service/notification_service.dart';

class DonationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final NotificationService _notificationService;

  DonationService(this._notificationService);

  // Stream of donation requests for real-time updates, sorted by date
  Stream<List<Map<String, dynamic>>> getDonationRequestsStream() {
    return _firestore
        .collection('donationRequests')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList());
  }

  // Listen for new donation requests and trigger notifications
  void listenToDonationRequests() {
    log("Listening to donation requests");

    _firestore.collection('donationRequests').snapshots().listen((snapshot) {
      for (var change in snapshot.docChanges) {
        if (change.type == DocumentChangeType.added) {
          log("A new donation request was added");
          var request = change.doc.data();
          if (request != null) {
            // Trigger local notification
            _notificationService.showNotification(
              'طلب تبرع جديد!',
              'حوجة لفصيلة دم ${request['bloodType']} في ${request['location']}',
            );
          }
        }
      }
    });
  }
}
