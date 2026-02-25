import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:feda_vest_group_project/constants/asset_images.dart';
import 'package:flutter/material.dart';



class VerificationCenterScreen extends StatelessWidget {
  const VerificationCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F7),
      body: Column(
        children: [

         
          Container(
            padding: const EdgeInsets.only(
                top: 50, left: 20, right: 20, bottom: 30),
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(28),
                bottomRight: Radius.circular(28),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                         Navigator.pushReplacementNamed(context, '/bottomNav');
                      },
                      child: Icon(Icons.arrow_back_ios,
                          color: Colors.white, size: 18),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Verification Center",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  "Complete all steps to unlock full access",
                  style: TextStyle(color: Colors.white70),
                )
              ],
            ),
          ),

        
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text("Overall Progress",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600)),
                            Spacer(),
                            Text("3/5")
                          ],
                        ),
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: 0.6,
                            minHeight: 8,
                            backgroundColor: Color(0xFFE6E6E6),
                            valueColor:
                                AlwaysStoppedAnimation(Color(0xFF0F3D2E)),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "2 items remaining",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// Trust Badges
                  const Text("Your Trust Badges",
                      style:
                          TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: const [
                      BadgeWidget(
                        containerColor: Color(0xFFE8EFE9),
                        icon: Icon(Icons.shield_outlined, color: AppColors.primaryColor,),
                        text: "Identity Verified",
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(width: 8),
                      BadgeWidget(
                        containerColor: Color(0xffE9EBF9),
                        icon: Icon(Icons.shield_outlined, color: Color(0xff1E3DA4),),
                        text: "CAC Registered",
                        color:Color(0xff1E3DA4),
                      ),
                    
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: BadgeWidget(
                          containerColor: Color(0xffE6D9F8),
                          icon: Icon(Icons.camera_alt_outlined, color: Color(0xff5E07D0),),
                          text: "Photo ID",
                          color: Color(0xff5E07D0),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  const Text("Verification Items",
                      style:
                          TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),

                  /// REUSABLE ITEMS
                  VerificationItem(
                    title: "National Identity Number (NIN)",
                    description:
                        "Strong cash flow and emergency reserves\nVerified on jan 15, 2026",
                    status: VerificationStatus.verified,
                  ),
                  VerificationItem(
                    title: "CAC Registration",
                    description:
                        "Corporate Affairs Commission\nRC 1234567 Verified",
                    status: VerificationStatus.verified,
                  ),
                  VerificationItem(
                    title: "Photo Identification",
                    description:
                        "Valid passport or driver’s license\nDriver’s license. Expires 2028",
                    status: VerificationStatus.verified,
                  ),
                  VerificationItem(
                    title: "Utility Bill",
                    description:
                        "Proof of business address\nUpload recent utility bill",
                    status: VerificationStatus.pending,
                  ),
                  VerificationItem(
                    title: "Location Verification",
                    description:
                        "GPS confirmation of business location\nEnable location access",
                    status: VerificationStatus.pending,
                  ),

                  const SizedBox(height: 24),

                  /// Benefits
                  const Text("Benefits of Full Verification",
                      style:
                          TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),

                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Colors.green),
                    ),
                    child: Column(
                      children: const [
                        BenefitItem(text: "3x more profile views from investors"),
                        BenefitItem(text: "Access to premium funding opportunities"),
                        BenefitItem(text: "Higher credibility score and trust badges"),
                        BenefitItem(text: "Priority support from FedaVest team"),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// REUSABLE VERIFICATION ITEM CONTAINER
////////////////////////////////////////////////////////////

enum VerificationStatus { verified, pending }

class VerificationItem extends StatelessWidget {
  final String title;
  final String description;
  final VerificationStatus status;

  const VerificationItem({
    super.key,
    required this.title,
    required this.description,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final bool isVerified = status == VerificationStatus.verified;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: isVerified ? Border (
          left: BorderSide(
            color: AppColors.primaryColor,
                 
          width: 4,
          )
          )   : Border.all(
              color  :  Color(0xFFD4AF37),
          width: 1.2,
          )      
          
        ),
      
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Status Icon
       Container(
  padding: const EdgeInsets.all(8),
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: isVerified
        ? const Color(0xFFE8EFE9)
        : const Color(0xFFFEF1DA),
  ),
  child: isVerified
      ? Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
          ),
          child: const Icon(
            Icons.check_outlined,
            color: Colors.white,
            size: 18,
          ),
        )
      : const Icon(
          Icons.error_outline,
          color: Color(0xFFD4AF37),
          size: 22,
        ),
),

const SizedBox(width: 12),

          const SizedBox(width: 12),

          /// Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: isVerified
                            ? const Color(0xFFE6F4EA)
                            : const Color(0xFFFFF4D6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        isVerified ? "Verified" : "Pending",
                        style: TextStyle(
                          fontSize: 12,
                          color: isVerified
                              ? const Color(0xFF0F3D2E)
                              : const Color(0xFFD4AF37),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(color: Colors.black54),
                ),
                if (!isVerified) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Image(image: AssetImage(AuthImages.centerUpload)),
                      const Text(
                        "Upload Evidence",
                        style: TextStyle(
                          color: Color(0xff1E3DA4),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                ]
              ],
            ),
          )
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// BADGE WIDGET
////////////////////////////////////////////////////////////

class BadgeWidget extends StatelessWidget {
  final String text;
  final Color color, containerColor;
  final Icon icon;

  const BadgeWidget({
    super.key,
    required this.text,
    required this.color, required this.icon, required this.containerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
       // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(width: 4,),
          Text(
            text,
            style: TextStyle(color: color, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// BENEFIT ITEM
////////////////////////////////////////////////////////////

class BenefitItem extends StatelessWidget {
  final String text;

  const BenefitItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: const [
          Icon(Icons.check_circle,
              color: Color(0xFF0F3D2E), size: 20),
          SizedBox(width: 8),
          Expanded(child: Text("")),
        ],
      ),
    );
  }
}