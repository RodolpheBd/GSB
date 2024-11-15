import 'package:flutter/material.dart';
import 'package:gsb/src/common/common.dart';

class HeaderNavBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor;
  final bool? showBackArrow;

  const HeaderNavBar({
    super.key,
    required this.title,
    this.backgroundColor,
    this.showBackArrow,
  });

  @override
  Widget build(BuildContext context) => PreferredSize(
        preferredSize: preferredSize,
        child: Container(
          color: backgroundColor ?? ColorStyles.whiteColor,
        child: Padding(
          padding: EdgeInsets.only(top: AppDimensions.paddingTop),
          child: Center(
            child: AppBar(
              leading: showBackArrow ?? false
                  ? IconButton(
                      icon: const Icon(
                        Icons.chevron_left,
                        size: AppDimensions.iconSmall,
                      ),
                      onPressed: () => Navigator.pop(context),
                    )
                  : null,
              title: Text(
                title,
                style: TextStyles.header,
              ),
              centerTitle: true,
              backgroundColor: backgroundColor ?? ColorStyles.whiteColor,
            ),
          ),
        ),
        ),
      );

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + AppDimensions.paddingTop);
}
