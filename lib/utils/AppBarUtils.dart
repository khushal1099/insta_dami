import 'package:flutter/material.dart';

class Appbar extends StatefulWidget implements PreferredSizeWidget {
  final List<AppBarIconButton> icons;

  const Appbar({
    super.key,
    this.icons = const [],
  });

  @override
  State<Appbar> createState() => _AppbarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize;
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.white,
      backgroundColor: Colors.black,
      title: Row(
        children: [
          Text(
            "Cipher Craft",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            width: 1,
          ),
          Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
            size: 20,
          ),
          SizedBox(
            width: 1,
          ),
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
          ),
        ],
      ),
      actions: widget.icons.map((e) => e).toList(),
    );
  }
}

class AppBarIconButton extends StatelessWidget {
  final IconData icon;
  final Function()? onPress;
  final int count;
  final bool showNotification;

  const AppBarIconButton({
    super.key,
    required this.icon,
    this.onPress,
    this.count = 0,
    this.showNotification = false,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress,
      icon: Stack(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 33,
          ),
          if (count > 0)
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  count.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
          if (showNotification)
            Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
            )
        ],
      ),
    );
  }
}
