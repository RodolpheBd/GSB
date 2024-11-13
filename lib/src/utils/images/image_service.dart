import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:gsb/src/common/common.dart';

class ImageService {
  static Widget displayImage(XFile image) => ClipRRect(
        borderRadius: BorderRadius.circular(AppDimensions.borderRadiusMedium),
        child: kIsWeb
            ? Image.network(
                image.path,
                height: AppDimensions.widgetMediumHeight,
                width: AppDimensions.widgetWidth,
                fit: BoxFit.cover,
              )
            : Image.file(
                File(image.path),
                height: AppDimensions.widgetMediumHeight,
                width: AppDimensions.widgetWidth,
                fit: BoxFit.cover,
              ),
      );
}
