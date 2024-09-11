import 'package:blood_donor/controllers/notifications_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../service/donation_service.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});

  final NotificationsController controller = Get.put(NotificationsController(DonationService()));

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.donationRequests.isEmpty) {
          return const Center(child: Text('لا توجد طلبات تبرع حالياً'));
        }
        return ListView.builder(
          itemCount: controller.donationRequests.length,
          reverse: true,
          itemBuilder: (context, index) {
            var request = controller.donationRequests[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: getPresetColorForBloodType(request['bloodType']),
                child: Text(
                    request['bloodType'],
                  style: TextStyle(
                    color: Colors.white
                  ),
                  ),
                ),
              title: Text('حوجة لفصيلة دم ${request['bloodType']}'),
              subtitle: Text('الموقع: ${request['location']}'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to more details if needed
              },
            );
          },
        );
      }),
    );
  }

  // Returns a specific color based on the blood type
  Color getPresetColorForBloodType(String bloodType) {
    switch (bloodType) {
      case 'A+':
        return Colors.red;
      case 'B+':
        return Colors.blue;
      case 'O+':
        return Colors.green;
      case 'AB+':
        return Colors.orange;
    // Add more as needed
      default:
        return Colors.grey;
    }
  }
}
