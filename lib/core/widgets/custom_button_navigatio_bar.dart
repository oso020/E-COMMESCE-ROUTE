import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final List<String> unselectedIcons;
  final List<String> selectedIcons;
  int currentIndex;
  final Color backgroundColor;
  Function(int) onItemSelected;

  CustomBottomNavigationBar(
      {required this.unselectedIcons,
      required this.selectedIcons,
      required this.currentIndex,
      required this.backgroundColor,
      required this.onItemSelected});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: widget.backgroundColor,
      type: BottomNavigationBarType.fixed,
      items: List.generate(
        widget.unselectedIcons.length,
        (index) => BottomNavigationBarItem(
          icon: widget.currentIndex == index
              ? CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    widget.selectedIcons[index],
                  ),
                )
              : Image.asset(
                  widget.unselectedIcons[index],
                ),
          label: "",
        ),
      ),
      currentIndex: widget.currentIndex,
      onTap: (int index) {
        widget.onItemSelected(index);
      },
    );
  }
}
