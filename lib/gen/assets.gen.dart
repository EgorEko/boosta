// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsElementsGen {
  const $AssetsElementsGen();

  /// File path: assets/elements/arrow_3.png
  AssetGenImage get arrow3 =>
      const AssetGenImage('assets/elements/arrow_3.png');

  /// File path: assets/elements/checkmark.png
  AssetGenImage get checkmark =>
      const AssetGenImage('assets/elements/checkmark.png');

  /// File path: assets/elements/fluent_data_pie_24_regular.png
  AssetGenImage get fluentDataPie24Regular =>
      const AssetGenImage('assets/elements/fluent_data_pie_24_regular.png');

  /// File path: assets/elements/fluent_money_16_filled.png
  AssetGenImage get fluentMoney16Filled =>
      const AssetGenImage('assets/elements/fluent_money_16_filled.png');

  /// File path: assets/elements/fluying_dol.png
  AssetGenImage get fluyingDol =>
      const AssetGenImage('assets/elements/fluying_dol.png');

  /// File path: assets/elements/flying_dol_back.png
  AssetGenImage get flyingDolBack =>
      const AssetGenImage('assets/elements/flying_dol_back.png');

  /// File path: assets/elements/flying_hundred_us_dollar.png
  AssetGenImage get flyingHundredUsDollar =>
      const AssetGenImage('assets/elements/flying_hundred_us_dollar.png');

  /// File path: assets/elements/lightning.png
  AssetGenImage get lightning =>
      const AssetGenImage('assets/elements/lightning.png');

  /// File path: assets/elements/lightning_second.png
  AssetGenImage get lightningSecond =>
      const AssetGenImage('assets/elements/lightning_second.png');

  /// File path: assets/elements/mdi_clock_fast.png
  AssetGenImage get mdiClockFast =>
      const AssetGenImage('assets/elements/mdi_clock_fast.png');

  /// File path: assets/elements/mingcute_safe_lock_line.png
  AssetGenImage get mingcuteSafeLockLine =>
      const AssetGenImage('assets/elements/mingcute_safe_lock_line.png');

  /// File path: assets/elements/net.svg
  SvgGenImage get net => const SvgGenImage('assets/elements/net.svg');

  /// File path: assets/elements/no_internet.png
  AssetGenImage get noInternet =>
      const AssetGenImage('assets/elements/no_internet.png');

  /// File path: assets/elements/portal.png
  AssetGenImage get portal => const AssetGenImage('assets/elements/portal.png');

  /// File path: assets/elements/portrait.png
  AssetGenImage get portrait =>
      const AssetGenImage('assets/elements/portrait.png');

  /// File path: assets/elements/portrait_girl.png
  AssetGenImage get portraitGirl =>
      const AssetGenImage('assets/elements/portrait_girl.png');

  /// File path: assets/elements/portrait_girl_1.png
  AssetGenImage get portraitGirl1 =>
      const AssetGenImage('assets/elements/portrait_girl_1.png');

  /// File path: assets/elements/portrait_no_internet.png
  AssetGenImage get portraitNoInternet =>
      const AssetGenImage('assets/elements/portrait_no_internet.png');

  /// File path: assets/elements/smile.png
  AssetGenImage get smile => const AssetGenImage('assets/elements/smile.png');

  /// List of all assets
  List<dynamic> get values => [
    arrow3,
    checkmark,
    fluentDataPie24Regular,
    fluentMoney16Filled,
    fluyingDol,
    flyingDolBack,
    flyingHundredUsDollar,
    lightning,
    lightningSecond,
    mdiClockFast,
    mingcuteSafeLockLine,
    net,
    noInternet,
    portal,
    portrait,
    portraitGirl,
    portraitGirl1,
    portraitNoInternet,
    smile,
  ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/app_store_icon.png
  AssetGenImage get appStoreIcon =>
      const AssetGenImage('assets/icons/app_store_icon.png');

  /// File path: assets/icons/info_icon.png
  AssetGenImage get infoIcon =>
      const AssetGenImage('assets/icons/info_icon.png');

  /// File path: assets/icons/security.png
  AssetGenImage get security =>
      const AssetGenImage('assets/icons/security.png');

  /// List of all assets
  List<AssetGenImage> get values => [appStoreIcon, infoIcon, security];
}

class Assets {
  const Assets._();

  static const $AssetsElementsGen elements = $AssetsElementsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
