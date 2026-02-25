import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:flutter/material.dart';


class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Header
              const SizedBox(height: 10),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, '/bottomNav');
                    },
                    child: const Icon(Icons.arrow_back_ios, size: 18)),
                  const SizedBox(width: 8),
                  const Text(
                    "Notification",
                    style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Color(0xffBF0000),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "3 new",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 20),

              /// Filter Chips
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    FilterChipWidget(label: "All", selected: true),
                    SizedBox(width: 8),
                    FilterChipWidget(label: "Verification"),
                    SizedBox(width: 8),
                    FilterChipWidget(label: "Funding"),
                    SizedBox(width: 8),
                    FilterChipWidget(label: "Milestone"),
                    SizedBox(width: 8),
                    FilterChipWidget(label: "Risk"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView(
                  children: const [

                    /// NEW SECTION
                    NotificationSectionCard(
                      title: "New",
                      actionText: "Mark all as read",
                      children: [
                        NotificationItem(
                          title: "Verification Complete",
                          description:
                              "Your National ID has been verified successfully",
                          time: "2 hours ago",
                           icon: Icons.check_circle_outline,
                          
                          iconColor:AppColors.primaryColor,
                          showUnreadDot: true,
                        ),
                        NotificationItem(
                          title: "Verification Complete",
                          description:
                              "Your National ID has been verified successfully",
                          time: "2 hours ago",
                          icon: Icons.check_circle_outline,
                          
                          iconColor:AppColors.primaryColor,
                          showUnreadDot: true,
                        ),
                        NotificationItem(
                          title: "Verification Complete",
                          description:
                              "Your National ID has been verified successfully",
                          time: "2 hours ago",
                          icon: Icons.check_circle_outline,
                          
                          iconColor:AppColors.primaryColor,
                          showUnreadDot: true,
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    /// EARLIER SECTION
                    NotificationSectionCard(
                      title: "Earlier",
                      children: [
                        NotificationItem(
                          title: "Risk Alert",
                          description:
                              "Weather Patterns may affect Harvest Timeline. Review contingency plan",
                          time: "1 day ago",
                          icon: Icons.flag_outlined,
                          iconBgColor: Color(0xFFFDE8E8),
                          iconColor: Colors.red,
                        ),
                        NotificationItem(
                          title: "Profile View",
                          description:
                              "AgriVest Fund viewed your business profile",
                          time: "2 days ago",
                          icon: Icons.show_chart,
                          iconBgColor: Color(0xFFE8EDFF),
                          iconColor: Colors.blue,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// REUSABLE SECTION CONTAINER
////////////////////////////////////////////////////////////

class NotificationSectionCard extends StatelessWidget {
  final String title;
  final String? actionText;
  final List<Widget> children;

  const NotificationSectionCard({
    super.key,
    required this.title,
    required this.children,
    this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              if (actionText != null)
                Text(
                  actionText!,
                  style: const TextStyle(
                    color:AppColors.primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                )
            ],
          ),
          const SizedBox(height: 16),
          ...children
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// ONE REUSABLE NOTIFICATION ITEM CONTAINER
////////////////////////////////////////////////////////////

class NotificationItem extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  final IconData icon;
  final Color? iconBgColor;
  final Color iconColor;
  final bool showUnreadDot;

  const NotificationItem({
    super.key,
    required this.title,
    required this.description,
    required this.time,
    required this.icon,
     this.iconBgColor,
    required this.iconColor,
    this.showUnreadDot = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Icon Circle
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor),
          ),

          const SizedBox(width: 12),

          /// Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 6),
                Text(
                  time,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),

          /// Unread Blue Dot
          if (showUnreadDot)
            Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.only(top: 6),
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            )
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// FILTER CHIP WIDGET
////////////////////////////////////////////////////////////

class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool selected;

  const FilterChipWidget({
    super.key,
    required this.label,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: selected ?AppColors.primaryColor : const Color(0xFFE9ECEF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : AppColors.primaryColor,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}