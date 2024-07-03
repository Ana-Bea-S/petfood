import 'package:flutter/material.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromARGB(255, 104, 60, 10).withOpacity(0.1),
        ),
        child: Icon(icon, color: Color.fromARGB(255, 104, 60, 10)),
      ),
      title: Text(
        title,
        //style: Theme.of(context).textTheme.bodyText1 ?.apply(color: textColor),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color.fromARGB(255, 104, 60, 10).withOpacity(0.1),
              ),
              child: const Icon(Icons.chevron_right,
                  size: 18.0, color: Color.fromARGB(255, 164, 121, 72)))
          : null,
    );
  }
}
