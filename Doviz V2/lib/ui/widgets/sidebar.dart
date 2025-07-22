// widgets/sidebar.dart

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Sidebar extends StatelessWidget {
  final Color baseColor = Color(0xFF1A1A1A);
  final Color hoverColor = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      color: baseColor,
      child: Column(
        children: [
          SidebarButton(title: "Login", route: "/login"),
          SidebarButton(title: "Main Menu", route: "/main"),
          SidebarButton(title: "Settings", route: "/settings"),
          SidebarButton(
            title: "Developer : @ca1ik",
            onTap: () async {
              final Uri url = Uri.parse("https://www.github.com/ca1ik");
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
          ),
        ],
      ),
    );
  }
}

class SidebarButton extends StatefulWidget {
  final String title;
  final String? route;
  final VoidCallback? onTap;

  SidebarButton({required this.title, this.route, this.onTap});

  @override
  _SidebarButtonState createState() => _SidebarButtonState();
}

class _SidebarButtonState extends State<SidebarButton> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap ??
            () {
              Navigator.pushNamed(context, widget.route ?? '/');
            },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 4),
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          width: double.infinity,
          color: isHovering ? Colors.deepPurple : Colors.transparent,
          child: Text(
            widget.title,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
