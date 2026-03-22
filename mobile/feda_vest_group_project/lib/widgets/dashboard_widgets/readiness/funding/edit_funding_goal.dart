import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:feda_vest_group_project/constants/asset_images.dart';
import 'package:feda_vest_group_project/global_widgets/app_button.dart';
import 'package:feda_vest_group_project/global_widgets/app_text.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/dashB_Mini_Container.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/progress_bar.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/readiness/funding/fundingdetails.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/readiness/funding/save_changes.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/verifcation/verificationcenter.dart';
import 'package:flutter/material.dart';

class EditFundingGoalScreen extends StatelessWidget {
  const EditFundingGoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          AppHeader(
            title: "Funding Goal",
            subtitle: "Define your funding needs and use of funds",
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Active Funding Goal",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            Image(image: AssetImage(AuthImages.fundingArrow)),
                          ],
                        ),

                        const SizedBox(height: 5),
                        // const ProgressBar(0.45),
                        const SizedBox(height: 8),
                        //const Text("8 investors • 45% funded"),
                        AppText(
                          text: "Greenhouse Expansion Project",
                          textSize: 16,
                          fontWeight: FontWeight.w500,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              text: "\$4.5M",
                              fontWeight: FontWeight.bold,
                              textSize: 24,
                              color: AppColors.dashBoardYellow,
                            ),
                            AppText(
                              text: "of \$10M",
                              fontWeight: FontWeight.w500,
                              textSize: 14,
                            ),
                          ],
                        ),
                        ProgressBar(isBiz: false, value: 0.5),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              text: "8 investors interested",
                              textSize: 16,
                            ),
                            AppText(
                              text: "45% Funded",
                              color: AppColors.dashBoardYellow,
                              textSize: 16,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const SizedBox(width: 4),
                            const Text(
                              'Goal visibility',
                              style: TextStyle(
                                color: Color(0xff525252),
                                fontSize: 16,
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.visibility_outlined,
                              size: 16,
                              color: AppColors.primaryColor,
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              'Public',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildFundingDetailsSection(),
                  const SizedBox(height: 16),
                  _buildUseOfFundsSection(),
                  const SizedBox(height: 16),
                  _buildSupportingDocumentSection(),
                  const SizedBox(height: 24),
                  _buildSaveChangesButton(
                    
                  context),
                  const SizedBox(height: 12),
                  _buildCreateNewFundingGoalButton(),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: const Color(0xFF1A3D2B),
      padding: const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status bar simulation
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '9:41',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.signal_cellular_alt,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Icon(Icons.wifi, color: Colors.white, size: 16),
                  const SizedBox(width: 4),
                  Icon(Icons.battery_full, color: Colors.white, size: 16),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(Icons.chevron_left, color: Colors.white, size: 24),
              const SizedBox(width: 4),
              const Text(
                'Funding Goal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            'Define your funding needs and use of funds',
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildFundingDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            'Funding Details',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.setProfileContainerColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: _buildFundingDetailItem(
                  icon: Icons.attach_money,
                  iconColor: const Color(0xFF1E3DA4),
                  iconBg: const Color(0xFFE8F5E9),
                  title: 'Total Amount',
                  subtitle: '\$10,000,000',
                  actionText: 'Edit Amount',
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.setProfileContainerColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: _buildFundingDetailItem(
                  icon: Icons.calendar_today_outlined,
                  iconColor: const Color(0xFFFFA726),
                  iconBg: const Color(0xFFFFF3E0),
                  title: 'Timeline',
                  subtitle: 'Start: Feb 1, 2026\nTarget End: Feb 27, 2026',
                  actionText: 'Adjust Timeline',
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.setProfileContainerColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: _buildFundingDetailItem(
                  icon: Icons.trending_up,
                  iconColor: const Color(0xFF7E57C2),
                  iconBg: const Color(0xFFEDE7F6),
                  title: 'Investment Type',
                  subtitle: 'Accepting equity and debt financing',
                  actionText: 'Change Preferences',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFundingDetailItem({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String title,
    required String subtitle,
    required String actionText,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: iconBg,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: iconColor, size: 18),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E3DA4),
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    actionText,
                    style: const TextStyle(
                      color: Color(0xFF4CAF50),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 2),
                  const Icon(
                    Icons.arrow_forward,
                    color: Color(0xFF4CAF50),
                    size: 12,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUseOfFundsSection() {
    final items = [
      _FundItem(
        'Greenhouse construction',
        '2 new climate controlled units',
        '\$6.0M',
        '60%',
      ),
      _FundItem(
        'Irrigation System',
        'Automated drip irrigation',
        '\$2.2M',
        '22%',
      ),
      _FundItem(
        'Equipment & Tools',
        'Planting and harvesting equipment',
        '\$1.0M',
        '10%',
      ),
      _FundItem(
        'Working Capital',
        'Seeds, supplies, operations',
        '\$0.5M',
        '5%',
      ),
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Use of Funds',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 16),
          ...items.map((item) => _buildFundItem(item)),
          const SizedBox(height: 12),
          Center(
            child: DashBoardMiniContainer(
              text: "Edit Use of Funds",
              hasIcon: true,
              icon: Icons.arrow_forward,
              color: Color(0xff8235B5),
              iconColor: Color(0xff8235B5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFundItem(_FundItem item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              Text(
                item.amount,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.subtitle,
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
              Text(
                item.percentage,
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }

  Widget _buildSupportingDocumentSection() {
    final docs = [
      _DocItem('Business Plan', 'Updated Feb 13, 2026'),
      _DocItem('Financial projection', 'Updated Feb 13, 2026'),
      _DocItem('Site Plans', 'Updated Feb 13, 2026'),
    ];

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Supporting Document',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 12),
          ...docs.map((doc) => _buildDocItem(doc)),

          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.add, color: AppColors.primaryColor, size: 18),
              const SizedBox(width: 10),
              const Text(
                'Add Document',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDocItem(_DocItem doc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFE3F2FD),
              // borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.description_outlined,
              color: Color(0xFF1565C0),
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doc.name,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                Text(
                  doc.updated,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size(40, 28),
            ),
            child: const Text(
              'View',
              style: TextStyle(
                color: Color(0xFF4CAF50),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
Widget _buildSaveChangesButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: SizedBox(
      width: double.infinity,
      height: 50,
      child: AppButton(
        onTap: () {
          showDialog(
            context: context,
            builder: (_) => const SaveChanges(),
          );
        },
        text: "Save Changes",
      ),
    ),
  );
}

  Widget _buildCreateNewFundingGoalButton() {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Create New Funding Goal',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _FundItem {
  final String title;
  final String subtitle;
  final String amount;
  final String percentage;

  _FundItem(this.title, this.subtitle, this.amount, this.percentage);
}

class _DocItem {
  final String name;
  final String updated;

  _DocItem(this.name, this.updated);
}
