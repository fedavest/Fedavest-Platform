import 'package:feda_vest_group_project/constants/asset_images.dart';
import 'package:feda_vest_group_project/global_widgets/app_button.dart';
import 'package:feda_vest_group_project/global_widgets/app_text.dart';
import 'package:feda_vest_group_project/routes/route_name.dart';
import 'package:flutter/material.dart';

class AiShowDialogue extends StatefulWidget {
  const AiShowDialogue({super.key});

  @override
  State<AiShowDialogue> createState() => _AiShowDialogueState();
}

class _AiShowDialogueState extends State<AiShowDialogue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),

          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(text: "AI SCoring"),
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
              AppText(text: "AI Investment Analysis"),
              AppText(
                text:
                    "Our AI evaluates your business readiness, risk level, and predicts funding success probability.",
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, RouteName.runAI);
                },
                child: AppButton(
                  isAi: true,
                  suffixIcon: Icons.electric_bolt_outlined,
                  text: "Run AI Analysis",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
