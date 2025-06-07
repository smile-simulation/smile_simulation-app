import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});
  static const routeName = 'AboutUsView';

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(s.aboutUs),
        foregroundColor: AppColors.whiteColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              s.appName,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(s.aboutUsDescription1, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Text(s.aboutUsDescription2, style: const TextStyle(fontSize: 16)),

            const Divider(height: 32),
            Text(
              s.aboutUsWarningTitle,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 8),
            Text(s.aboutUsWarningText, style: const TextStyle(fontSize: 16)),

            const Divider(height: 32),
            Text(
              s.aboutUsDevelopedBy,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '${s.aboutUsFaculty}\n${s.aboutUsGraduationYear}\n${s.aboutUsSupervisor}',
              style: const TextStyle(fontSize: 16),
            ),

            const Divider(height: 32),
            Text(
              s.aboutUsTeamTitle,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            _buildTeamMember(s.teamMahmoud, s.teamMahmoudRole),
            _buildTeamMember(s.teamHanan, s.teamHananRole),
            _buildTeamMember(s.teamMohamedRoshdy, s.teamFrontendRole),
            _buildTeamMember(s.teamMohamedHamed, s.teamFrontendRole),
            _buildTeamMember(s.teamMostafa, s.teamBackendRole),
            _buildTeamMember(s.teamFatma, s.teamBackendRole),
            _buildTeamMember(s.teamBaher, s.teamAIChatRole),
            _buildTeamMember(s.teamAsmaa, s.teamAIChatRole),

            const Divider(height: 32),
            Text(
              s.aboutUsContact,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () async {
                final uri = Uri(scheme: 'mailto', path: s.aboutUsEmail);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                }
              },
              child: Text(
                s.aboutUsEmail,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamMember(String name, String role) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
          Text(role),
        ],
      ),
    );
  }
}
