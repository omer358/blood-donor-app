import 'package:blood_donor/controllers/notifications_controller.dart';
import 'package:blood_donor/service/donation_service.dart';
import 'package:blood_donor/service/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});

  final NotificationsController controller =
      Get.put(NotificationsController(DonationService(NotificationService())));

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.donationRequests.isEmpty) {
          return emptyState();
        }
        return ListView.separated(
          itemCount: controller.donationRequests.length,
          itemBuilder: (context, index) {
            var request = controller.donationRequests[index];
            bool active = request['active'] ??
                true; // default to true if field is missing

            return ListTile(
              leading: CircleAvatar(
                backgroundColor: getFixedColor(request['bloodType']),
                child: Text(
                  request['bloodType'],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text('حوجة لفصيلة دم ${request['bloodType']}'),
              subtitle: Text('الموقع: ${request['location']}'),
              trailing: Icon(
                active ? Icons.bloodtype : Icons.check_circle,
                color: active ? Colors.red : Colors.green,
              ),
              onTap: () {
                // Navigate to more details if needed
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        );
      }),
    );
  }

  Color getFixedColor(String bloodType) {
    switch (bloodType) {
      case 'A+':
        return Colors.red;
      case 'A-':
        return Colors.blue;
      case 'B+':
        return Colors.green;
      case 'B-':
        return Colors.purple;
      case 'AB+':
        return Colors.orange;
      case 'AB-':
        return Colors.brown;
      case 'O+':
        return Colors.pink;
      case 'O-':
        return Colors.yellow;
      default:
        return Colors.grey;
    }
  }

  Widget emptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/blood_donation.png",
            height: 180,
            width: 180,
          ),
          Text('لا توجد طلبات تبرع حالياً',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24))
        ],
      ),
    );
  }
}
