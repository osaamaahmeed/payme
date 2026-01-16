import 'package:flutter/material.dart';
import 'package:payme/core/theme/app_styles.dart';
import 'package:payme/core/widgets/custom_dotted_divider.dart';
import 'package:payme/features/checkout/view/widgets/card_info_widget.dart';
import 'package:payme/features/checkout/view/widgets/custom_check_icon.dart';
import 'package:payme/features/checkout/view/widgets/custom_white_circle.dart';
import 'package:payme/features/checkout/view/widgets/thank_you_custom_container.dart';
import 'package:payme/features/checkout/view/widgets/thank_you_header_section.dart';
import 'package:payme/features/checkout/view/widgets/thank_you_oder_info_section.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ThankYouCustomContainer(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -105,
              left: 0,
              right: 0,
              child: const CustomCheckIcon(),
            ),
            Column(
              children: [
                const ThankYouHeaderSection(),
                const SizedBox(height: 40),
                const ThankYouOderInfoSection(),
                const SizedBox(height: 30),
                const CardInfoWidget(),
                const SizedBox(height: 30),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -16,
                      left: -38,
                      child: const CustomWhiteCircle(),
                    ),
                    const CustomDottedDivider(),
                    Positioned(
                      top: -16,
                      right: -38,
                      child: const CustomWhiteCircle(),
                    ),
                  ],
                ),
                const SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/images/qrCode.png", height: 71),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 29,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.green, width: 1.5),
                      ),
                      child: Center(
                        child: Text(
                          "PAID",
                          style: AppStyles.style24.copyWith(
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 70),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
