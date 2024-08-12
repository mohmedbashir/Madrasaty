import 'package:flutter/material.dart';
import 'package:student/view/widgets/custom%20widgets/custom_text.dart';

import '../../../utils/shared/theme.dart';
import '../../../utils/size_config.dart';

class SectionCard extends StatelessWidget {
  const SectionCard(
      {super.key,
      required this.sectionName,
      required this.sectionImage,
      required this.onTap});
  final String sectionImage;
  final String sectionName;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 5),
      height: UI.height * .11,
      child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Colors.black12),
              borderRadius: BorderRadius.circular(15)),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.black.withOpacity(.03),
                      child: Image.asset(
                        sectionImage,
                        height: 45,
                      ),
                    ),
                  ),
                  CustomText(
                    text: sectionName,
                    textStyle: headingStyle5,
                    size: 17,
                    color: Colors.black87,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.black26,
                    size: 22,
                  )
                ],
              ),
            ),
          )),
    );
  }
}
