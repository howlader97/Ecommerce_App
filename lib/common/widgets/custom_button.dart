import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/app_color.dart';
import 'package:ecommerce_app/utils/dimensions.dart';
import 'package:ecommerce_app/utils/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String buttonText;
  final Color? color;
  final Color? textColor;
  final Function()? onPressed;
  final bool isBorderEnable;
  final bool isLoading;
  final EdgeInsetsGeometry? margin;
  const CustomButton({super.key, this.height = 50, this.width, required this.buttonText, this.color = AppColors.primary,
    this.textColor, this.onPressed, this.isBorderEnable = true, this.isLoading = false, this.margin});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: isLoading ? null : onPressed,
      child: Container(
        width: width ?? double.infinity,
        height: height,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [
              Color(0xff1990eb),
              Color(0xff52aaf7),
            ],
          ),
        ),
        child: Center(
          child: isLoading ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(
              height: 15, width: 15,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 2,
              ),
            ),
            const SizedBox(width: Dimensions.paddingSizeDefault),

            Text('Loading', style: GoogleFonts.poppins(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
          ]) : Text(
            buttonText,
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
