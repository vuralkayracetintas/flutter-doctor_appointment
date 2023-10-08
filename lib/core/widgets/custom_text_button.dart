part of '/core/pages/login/login_view.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.style,
  });
  final String title;
  final Function() onPressed;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: style,
        ));
  }
}
