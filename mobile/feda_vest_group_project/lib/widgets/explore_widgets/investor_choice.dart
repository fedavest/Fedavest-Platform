import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InvestorInterestScreen(),
    );
  }
}

class InvestorInterestScreen extends StatelessWidget {
  const InvestorInterestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// TITLE
              const Text(
                "Investor Interest",
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text(
                "Track who’s viewing your profile",
                style: TextStyle(color: Colors.black54),
              ),

              const SizedBox(height: 20),

              /// STATS ROW
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: const [
                  StatCard(
                    icon: Icons.remove_red_eye_outlined,
                    value: "124",
                    label: "Profile Views",
                    color: AppColors.primaryColor,
                  ),
                  StatCard(
                    icon: Icons.check_circle_outline,
                    value: "8",
                    label: "Interested",
                    color: Colors.blue,
                  ),
                  StatCard(
                    icon: Icons.trending_up,
                    value: "85",
                    label: "Visibility",
                    color: Colors.purple,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// VISIBILITY CARD (REUSABLE)
              const AppCard(
                child: VisibilitySection(),
              ),

              const SizedBox(height: 20),

              /// IMPROVEMENT SECTION
              const Text(
                "Improve Your Chances",
                style:
                    TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              const AppCard(
                bordered: true,
                child: ImprovementList(),
              ),

              const Spacer(),

              /// BUTTONS
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding:
                            const EdgeInsets.symmetric(
                                vertical: 16),
                        side: const BorderSide(
                            color: Color(0xFF0F3D2E)),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "View Investors",
                        style: TextStyle(
                            color: Color(0xFF0F3D2E)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF0F3D2E),
                        padding:
                            const EdgeInsets.symmetric(
                                vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("View other SMEs"),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// ONE REUSABLE CONTAINER
////////////////////////////////////////////////////////////

class AppCard extends StatelessWidget {
  final Widget child;
  final bool bordered;

  const AppCard({
    super.key,
    required this.child,
    this.bordered = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: bordered
            ? Border.all(color: const Color(0xFF0F3D2E))
            : null,
      ),
      child: child,
    );
  }
}

////////////////////////////////////////////////////////////
/// STAT CARD
////////////////////////////////////////////////////////////

class StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const StatCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppCard(
        child: Column(
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 8),
            Text(value,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            const SizedBox(height: 4),
            Text(label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// VISIBILITY SECTION
////////////////////////////////////////////////////////////

class VisibilitySection extends StatelessWidget {
  const VisibilitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                "Profile Visibility",
                style: TextStyle(
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Text(
                "Your profile is visible to verified investors.\nYou can hide it",
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
        Column(
          children: [
            const Text("Public"),
            Switch(
              value: true,
              activeColor: const Color(0xFF0F3D2E),
              onChanged: (val) {},
            )
          ],
        )
      ],
    );
  }
}

////////////////////////////////////////////////////////////
/// IMPROVEMENT LIST
////////////////////////////////////////////////////////////

class ImprovementList extends StatelessWidget {
  const ImprovementList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ImprovementItem(text: "Complete all verification"),
        ImprovementItem(text: "Upload detailed business plan"),
        ImprovementItem(text: "Set clear funding goals"),
      ],
    );
  }
}

class ImprovementItem extends StatelessWidget {
  final String text;

  const ImprovementItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          const Icon(Icons.check_circle,
              color: Color(0xFF0F3D2E)),
          const SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}