import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:feda_vest_group_project/constants/asset_images.dart';
import 'package:feda_vest_group_project/global_widgets/app_button.dart';
import 'package:feda_vest_group_project/global_widgets/app_text.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/readiness/ai_show_dialogue.dart';
import 'package:flutter/material.dart';

class RunAnalysis extends StatefulWidget {
  const RunAnalysis({super.key});

  @override
  State<RunAnalysis> createState() => _RunAnalysisState();
}

class _RunAnalysisState extends State<RunAnalysis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.only(top: 15, left: 20, right: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: "AI Scoring",
                    fontWeight: FontWeight.bold,
                    textSize: 24,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.close),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(child: Image(image: AssetImage(AuthImages.aiImage))),
              SizedBox(height: 10),
              AppText(
                text: "AI Investment Analysis",
                fontWeight: FontWeight.bold,
                textSize: 24,
              ),
                SizedBox(height: 15),
              AppText(
                textAlign: TextAlign.center,
                maxline: 3,
                text:
                    "Our AI evaluates your business readiness, risk level, and predicts funding success probability.",
              ),
              SizedBox(height: 15),
          
              AiAnalysisContainer(),
              SizedBox(height: 15),
              AiAnalysisContainer(),
              SizedBox(height: 15),
              AiAnalysisContainer(),
               SizedBox(height: 20),
              GestureDetector(
                  onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AiShowDialogue();
                          },
                        );
                      },
                child: AppButton(
                  isAi: true,
                  suffixIcon: Icons.restart_alt_outlined,
                  text: "Re-run AI Analysis",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AiAnalysisContainer extends StatelessWidget {
  const AiAnalysisContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(color: Color(0xffF4F4F4),
      borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(text: "Readiness Score", textSize: 14,
           fontWeight: FontWeight.w500,),
          AppText(
            fontWeight: FontWeight.w500,
            text: "87/100",
            color: AppColors.dashBoardYellow,
            textSize: 24,
          ),
          AppText(text: "Good progress", textSize: 14,
           fontWeight: FontWeight.w500,),
           
        ],
        
      ),
      
    );
    
  }
}
