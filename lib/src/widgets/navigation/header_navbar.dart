import 'package:flutter/material.dart';
import 'package:gsb/src/common/common.dart';

class HeaderNavBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackArrow;
  final String title;

  const HeaderNavBar({
    super.key,
    this.showBackArrow = false,
    required this.title,
  });

  @override
  Widget build(BuildContext context) => PreferredSize(
        preferredSize: preferredSize,
        child: Padding(
          padding: EdgeInsets.only(top: AppDimensions.paddingTop),
          child: AppBar(
            leading: showBackArrow
                ? IconButton(
                    icon: const Icon(Icons.chevron_left),
                    onPressed: () => Navigator.pop(context),
                  )
                : null,
            title: Text(
              title,
              style: TextStyles.header,
            ),
            centerTitle: true,
          ),
        ),
      );

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + AppDimensions.paddingTop);
}
