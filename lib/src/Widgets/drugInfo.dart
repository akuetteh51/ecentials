import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DrugInfo extends StatelessWidget {
  DrugInfo({Key? key, required this.title, required this.info, this.size})
      : super(key: key);
  final String title;
  final String info;
  double? size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title,
            style:
                TextStyle(color: AppColors.primaryBlackColor.withOpacity(.60))),
        const SizedBox(
          height: 10,
        ),
        Text(info,
            style: TextStyle(
                fontSize: size ?? 26,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryBlackColor.withAlpha(180)))
      ]),
    );
  }
}
