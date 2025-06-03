import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/generated/l10n.dart';
import 'package:smile_simulation/main.dart'; // هذا المسار حسب gen-l10n

import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key});

  @override
  _NoInternetScreenState createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  bool _isChecking = false;

  Future<bool> _checkConnectivity() async {
    // Step 1: Check network interface availability
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }

    // Step 2: Verify actual internet access
    try {
      final response = await http.get(Uri.parse('https://www.google.com')).timeout(
        const Duration(seconds: 5),
        onTimeout: () => http.Response('Timeout', 408),
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final local = S.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/splash_android12_logo.png',
                height: 100,
              ),
              const SizedBox(height: 30),
              Icon(
                Icons.wifi_off,
                color: AppColors.primaryColor,
                size: 80,
              ),
              const SizedBox(height: 20),
              Text(
                local.no_internet_title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                local.no_internet_description,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.lightBlackColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _isChecking
                    ? null
                    : () async {
                        setState(() {
                          _isChecking = true;
                        });
                        final hasInternet = await _checkConnectivity();
                        setState(() {
                          _isChecking = false;
                        });
                        if (hasInternet) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SmileSimulation(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(local.no_internet_description),
                              backgroundColor: AppColors.primaryColor,
                            ),
                          );
                        }
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: _isChecking
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(
                        local.retry,
                        style: const TextStyle(fontSize: 16),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}