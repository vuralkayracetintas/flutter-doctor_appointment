part of '/core/pages/login/login_view.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.title,
    required this.style,
  });
  final String title;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style,
    );
  }
}
