import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:feda_vest_group_project/global_widgets/app_text.dart';
import 'package:feda_vest_group_project/utils/utils.dart';
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
            padding: EdgeInsets.only(
                top: Utils.h(50),
                left: Utils.w(20),
                right: Utils.w(20),
                bottom: Utils.h(30)),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(Utils.r(28)),
                bottomRight: Radius.circular(Utils.r(28)),
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
                          color: Colors.white, size: Utils.r(18)),
                    ),
                    SizedBox(width: Utils.w(8)),
                    Text(
                      "Verification",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Utils.sp(20),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: Utils.h(8)),
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
              padding: EdgeInsets.all(Utils.w(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Business Verification",
                    style: TextStyle(
                        fontSize: Utils.sp(20), fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: Utils.h(16)),

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

                  SizedBox(height: Utils.h(24)),

                  /// SUBMIT BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: Utils.h(55),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Utils.r(12)),
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
                          Icon(Icons.shield_outlined,color: Colors.white,size: Utils.r(20),),
                          Positioned(
                            top:2 ,
                            left: 2,
                            right: 2,
                            bottom: 2,
                            child: Icon(Icons.check, color: Colors.white,size: Utils.r(12),))
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
      padding: EdgeInsets.only(bottom: Utils.h(18)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label,
              style: const TextStyle(
                  fontWeight: FontWeight.w500)),
          SizedBox(height: Utils.h(8)),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Utils.w(14), vertical: Utils.h(4)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Utils.r(14)),
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