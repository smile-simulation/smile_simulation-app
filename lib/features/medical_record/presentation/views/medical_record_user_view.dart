import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';

import '../../../../core/widgets/custom_body_screen.dart';
import '../../../../generated/assets.dart';



class MedicalRecordView extends StatelessWidget {
  const MedicalRecordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context,title: 'السجل الطبي'),
      body: CustomBodyScreen(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue.shade100,
                          child: Icon(Icons.person, color: Colors.blue),
                        ),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Text(
                            'محمد فوزي محمود',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Text(
                          '#34251',
                          style: TextStyle(color: Colors.lightBlue),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.blue.shade50,
                            child: Icon(Icons.person, color: Colors.blue, size: 30),
                          ),
                          const SizedBox(height: 8),
                          const Text('البيانات الشخصية'),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.red.shade50,
                            child: Icon(Icons.favorite, color: Colors.red, size: 30),
                          ),
                          const SizedBox(height: 8),
                          const Text('الحالة الصحية'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.lightBlue.shade50,
                            child: Icon(Icons.assignment, color: Colors.lightBlue, size: 30),
                          ),
                          const SizedBox(height: 8),
                          const Text('السجل العلاجي'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    Assets.imagesMedicalRecordImage, // You should add the tooth image to your assets
                    height: 100,
                  ),
                  const SizedBox(height: 20),
        
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
