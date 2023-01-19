import 'package:flutter/material.dart';

class CustomAppBarNike extends StatelessWidget {
  CustomAppBarNike({
    super.key,
    this.onPressedMenu,
  });

  VoidCallback? onPressedMenu;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight + 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/nike_assets/nike_w.png'),
            Row(
              children: [
                IconButton(
                  onPressed: onPressedMenu,
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
