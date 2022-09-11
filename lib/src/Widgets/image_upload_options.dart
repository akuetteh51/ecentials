import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:flutter/material.dart';

class UploadOption extends StatelessWidget {
  const UploadOption({
    Key? key,
    this.onTap,
    required this.label,
    required this.description,
  }) : super(key: key);

  final void Function()? onTap;
  final String label;
  final String description;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Container(
          height: 180,
          decoration: BoxDecoration(
            color: AppColors.primaryDeepColor.withOpacity(.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  label == "Camera" ? Icons.camera_alt : Icons.photo,
                  size: 60,
                  color: Theme.of(context).disabledColor,
                ),
              ),
              SizedBox(
                width: width / 2 - 32,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      label,
                      style: TextStyle(
                          color: Theme.of(context).disabledColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      description,
                      style: TextStyle(
                          color: Theme.of(context).disabledColor, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
