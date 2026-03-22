import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:feda_vest_group_project/global_widgets/app_text.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/verifcation/success_verif.dart';
import 'package:flutter/material.dart';



class VerificationFormScreen extends StatelessWidget {
  const VerificationFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      "Verification",
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

          /// BODY
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Business Verification",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 16),

                  const AppInputField(
                    label: "Business Verification",
                    hintText: "Enter your Business Name",
                  ),

                  const AppInputField(
                    label: "CAC Verification Number",
                    hintText: "e.g. RC-1234567",
                  ),

                  const AppInputField(
                    label: "National Identity Number (NIN)",
                    hintText: "Enter NIN",
                  ),

                  const AppInputField(
                    label: "Location",
                    hintText: "e.g. Lagos, Nigeria",
                  ),

                  const AppInputField(
                    label: "Food Sector",
                    hintText: "Select food sector",
                    isDropdown: true,
                  ),

                  const SizedBox(height: 24),

                  /// SUBMIT BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: (){
   showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return VerificationSuccess();
                          },
                        );
  },
                      icon:  Stack(
                        children: [
                          Icon(Icons.shield_outlined,color: Colors.white,size: 20,),
                          Positioned(
                            top:2 ,
                            left: 2,
                            right: 2,
                            bottom: 2,
                            child: Icon(Icons.check, color: Colors.white,size: 12,))
                          ]),
                      label: const AppText(
                      text:   "Submit Verification",
                        textSize: 16,
                        color: Colors.white,
                      ),
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
/// ONE REUSABLE INPUT CONTAINER
////////////////////////////////////////////////////////////

class AppInputField extends StatefulWidget {
  final String label;
  final String hintText;
  final bool isDropdown;

  const AppInputField({
    super.key,
    required this.label,
    required this.hintText,
    this.isDropdown = false,
  });

  @override
  State<AppInputField> createState() => _AppInputFieldState();
}

class _AppInputFieldState extends State<AppInputField> {
   String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label,
              style: const TextStyle(
                  fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 14, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                  color: Colors.grey.shade300),
            ),
            child: widget.isDropdown
                ? DropdownButtonHideUnderline(

                    child: DropdownButton<String>(
                     focusColor: Colors.transparent,
                    value: selectedValue,
                     autofocus: false,
                      isExpanded: true,
                      hint: Text(widget.hintText),
                      items: const [
                        DropdownMenuItem(
                          value: "Grain Processing",
                          child: Text("Grain Processing"),
                        ),
                        DropdownMenuItem(
                          value: "Livestock Poutry",
                          child: Text("Livestock Poutry"),
                        ),
                        DropdownMenuItem(
                          value: "Fisheries & Aquaculture",
                          child: Text("Fisheries & Aquaculture"),
                        ),
                       
                         DropdownMenuItem(
                          value: "Fruits & Vegetables",
                          child: Text("Fruits & Vegetables"),
                        ),
                          DropdownMenuItem(
                          value: "Dairy Products",
                          child: Text("Dairy Products"),
                        ),
                      ],
                      onChanged: (value) {
                          setState(() {
                          selectedValue = value; 
                        });
                      },
                    ),
                  )
                : TextField(
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      border: InputBorder.none,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}