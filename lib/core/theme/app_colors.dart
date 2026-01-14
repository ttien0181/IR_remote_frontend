import 'package:flutter/material.dart';

/// Custom theme extension for granular color control
class AppColors extends ThemeExtension<AppColors> {
  // Tile/Card colors
  final Color tileBackground;
  final Color tileBorder;
  final Color tileShadow;
  final Color tileIconBackground;
  final Color tileIconColor;
  final Color tileTitleColor;
  final Color tileSubtitleColor;

  // Room tile specific
  final Color roomTileBackground;
  final Color roomTileIconBackground;
  final Color roomTileIconColor;
  
  // Controller tile specific
  final Color controllerTileBackground;
  final Color controllerTileIconBackground;
  final Color controllerTileIconColor;
  
  // Appliance tile specific
  final Color applianceTileBackground;
  final Color applianceTileIconBackground;
  final Color applianceTileIconColor;
  
  // Telemetry tile specific
  final Color telemetryTileBackground;
  final Color telemetryTileIconBackground;
  final Color telemetryTileIconColor;
  
  // Background colors
  final Color scaffoldBackground;
  final Color cardBackground;
  
  // Text colors
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  
  // Icon colors
  final Color iconPrimary;
  final Color iconSecondary;
  
  // Button colors
  final Color buttonPrimary;
  final Color buttonOnPrimary;
  final Color buttonSecondary;
  final Color buttonOnSecondary;
  
  // Border colors
  final Color borderPrimary;
  final Color borderSecondary;
  
  // Status colors
  final Color statusSuccess;
  final Color statusWarning;
  final Color statusError;
  final Color statusInfo;

  const AppColors({
    required this.tileBackground,
    required this.tileBorder,
    required this.tileShadow,
    required this.tileIconBackground,
    required this.tileIconColor,
    required this.tileTitleColor,
    required this.tileSubtitleColor,
    required this.roomTileBackground,
    required this.roomTileIconBackground,
    required this.roomTileIconColor,
    required this.controllerTileBackground,
    required this.controllerTileIconBackground,
    required this.controllerTileIconColor,
    required this.applianceTileBackground,
    required this.applianceTileIconBackground,
    required this.applianceTileIconColor,
    required this.telemetryTileBackground,
    required this.telemetryTileIconBackground,
    required this.telemetryTileIconColor,
    required this.scaffoldBackground,
    required this.cardBackground,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.iconPrimary,
    required this.iconSecondary,
    required this.buttonPrimary,
    required this.buttonOnPrimary,
    required this.buttonSecondary,
    required this.buttonOnSecondary,
    required this.borderPrimary,
    required this.borderSecondary,
    required this.statusSuccess,
    required this.statusWarning,
    required this.statusError,
    required this.statusInfo,
  });

  @override
  AppColors copyWith({
    Color? tileBackground,
    Color? tileBorder,
    Color? tileShadow,
    Color? tileIconBackground,
    Color? tileIconColor,
    Color? tileTitleColor,
    Color? tileSubtitleColor,
    Color? roomTileBackground,
    Color? roomTileIconBackground,
    Color? roomTileIconColor,
    Color? controllerTileBackground,
    Color? controllerTileIconBackground,
    Color? controllerTileIconColor,
    Color? applianceTileBackground,
    Color? applianceTileIconBackground,
    Color? applianceTileIconColor,
    Color? telemetryTileBackground,
    Color? telemetryTileIconBackground,
    Color? telemetryTileIconColor,
    Color? scaffoldBackground,
    Color? cardBackground,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? iconPrimary,
    Color? iconSecondary,
    Color? buttonPrimary,
    Color? buttonOnPrimary,
    Color? buttonSecondary,
    Color? buttonOnSecondary,
    Color? borderPrimary,
    Color? borderSecondary,
    Color? statusSuccess,
    Color? statusWarning,
    Color? statusError,
    Color? statusInfo,
  }) {
    return AppColors(
      tileBackground: tileBackground ?? this.tileBackground,
      tileBorder: tileBorder ?? this.tileBorder,
      tileShadow: tileShadow ?? this.tileShadow,
      tileIconBackground: tileIconBackground ?? this.tileIconBackground,
      tileIconColor: tileIconColor ?? this.tileIconColor,
      tileTitleColor: tileTitleColor ?? this.tileTitleColor,
      tileSubtitleColor: tileSubtitleColor ?? this.tileSubtitleColor,
      roomTileBackground: roomTileBackground ?? this.roomTileBackground,
      roomTileIconBackground: roomTileIconBackground ?? this.roomTileIconBackground,
      roomTileIconColor: roomTileIconColor ?? this.roomTileIconColor,
      controllerTileBackground: controllerTileBackground ?? this.controllerTileBackground,
      controllerTileIconBackground: controllerTileIconBackground ?? this.controllerTileIconBackground,
      controllerTileIconColor: controllerTileIconColor ?? this.controllerTileIconColor,
      applianceTileBackground: applianceTileBackground ?? this.applianceTileBackground,
      applianceTileIconBackground: applianceTileIconBackground ?? this.applianceTileIconBackground,
      applianceTileIconColor: applianceTileIconColor ?? this.applianceTileIconColor,
      telemetryTileBackground: telemetryTileBackground ?? this.telemetryTileBackground,
      telemetryTileIconBackground: telemetryTileIconBackground ?? this.telemetryTileIconBackground,
      telemetryTileIconColor: telemetryTileIconColor ?? this.telemetryTileIconColor,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      cardBackground: cardBackground ?? this.cardBackground,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      iconPrimary: iconPrimary ?? this.iconPrimary,
      iconSecondary: iconSecondary ?? this.iconSecondary,
      buttonPrimary: buttonPrimary ?? this.buttonPrimary,
      buttonOnPrimary: buttonOnPrimary ?? this.buttonOnPrimary,
      buttonSecondary: buttonSecondary ?? this.buttonSecondary,
      buttonOnSecondary: buttonOnSecondary ?? this.buttonOnSecondary,
      borderPrimary: borderPrimary ?? this.borderPrimary,
      borderSecondary: borderSecondary ?? this.borderSecondary,
      statusSuccess: statusSuccess ?? this.statusSuccess,
      statusWarning: statusWarning ?? this.statusWarning,
      statusError: statusError ?? this.statusError,
      statusInfo: statusInfo ?? this.statusInfo,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      tileBackground: Color.lerp(tileBackground, other.tileBackground, t)!,
      tileBorder: Color.lerp(tileBorder, other.tileBorder, t)!,
      tileShadow: Color.lerp(tileShadow, other.tileShadow, t)!,
      tileIconBackground: Color.lerp(tileIconBackground, other.tileIconBackground, t)!,
      tileIconColor: Color.lerp(tileIconColor, other.tileIconColor, t)!,
      tileTitleColor: Color.lerp(tileTitleColor, other.tileTitleColor, t)!,
      tileSubtitleColor: Color.lerp(tileSubtitleColor, other.tileSubtitleColor, t)!,
      roomTileBackground: Color.lerp(roomTileBackground, other.roomTileBackground, t)!,
      roomTileIconBackground: Color.lerp(roomTileIconBackground, other.roomTileIconBackground, t)!,
      roomTileIconColor: Color.lerp(roomTileIconColor, other.roomTileIconColor, t)!,
      controllerTileBackground: Color.lerp(controllerTileBackground, other.controllerTileBackground, t)!,
      controllerTileIconBackground: Color.lerp(controllerTileIconBackground, other.controllerTileIconBackground, t)!,
      controllerTileIconColor: Color.lerp(controllerTileIconColor, other.controllerTileIconColor, t)!,
      applianceTileBackground: Color.lerp(applianceTileBackground, other.applianceTileBackground, t)!,
      applianceTileIconBackground: Color.lerp(applianceTileIconBackground, other.applianceTileIconBackground, t)!,
      applianceTileIconColor: Color.lerp(applianceTileIconColor, other.applianceTileIconColor, t)!,
      telemetryTileBackground: Color.lerp(telemetryTileBackground, other.telemetryTileBackground, t)!,
      telemetryTileIconBackground: Color.lerp(telemetryTileIconBackground, other.telemetryTileIconBackground, t)!,
      telemetryTileIconColor: Color.lerp(telemetryTileIconColor, other.telemetryTileIconColor, t)!,
      scaffoldBackground: Color.lerp(scaffoldBackground, other.scaffoldBackground, t)!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      iconPrimary: Color.lerp(iconPrimary, other.iconPrimary, t)!,
      iconSecondary: Color.lerp(iconSecondary, other.iconSecondary, t)!,
      buttonPrimary: Color.lerp(buttonPrimary, other.buttonPrimary, t)!,
      buttonOnPrimary: Color.lerp(buttonOnPrimary, other.buttonOnPrimary, t)!,
      buttonSecondary: Color.lerp(buttonSecondary, other.buttonSecondary, t)!,
      buttonOnSecondary: Color.lerp(buttonOnSecondary, other.buttonOnSecondary, t)!,
      borderPrimary: Color.lerp(borderPrimary, other.borderPrimary, t)!,
      borderSecondary: Color.lerp(borderSecondary, other.borderSecondary, t)!,
      statusSuccess: Color.lerp(statusSuccess, other.statusSuccess, t)!,
      statusWarning: Color.lerp(statusWarning, other.statusWarning, t)!,
      statusError: Color.lerp(statusError, other.statusError, t)!,
      statusInfo: Color.lerp(statusInfo, other.statusInfo, t)!,
    );
  }

  // Light theme colors
  static const light = AppColors(
    // Tile/Card colors (generic)
    tileBackground: Color(0xFFFFFFFF),
    tileBorder: Color(0xFFE8ECFF),
    tileShadow: Color(0x14000000),
    tileIconBackground: Color(0xFFB5C9FF),
    tileIconColor: Color(0xFF1B1D28),
    tileTitleColor: Color(0xFF1B1D28),
    tileSubtitleColor: Color(0xFF7B819A),
    
    // Room tile specific
    roomTileBackground: Color(0xFFFFFFFF),
    roomTileIconBackground: Colors.red,
    roomTileIconColor: Color(0xFF1B1D28),
    
    // Controller tile specific
    controllerTileBackground: Color(0xFFFFFFFF),
    controllerTileIconBackground: Color(0xFFD4E4FF),
    controllerTileIconColor: Color(0xFF1B1D28),
    
    // Appliance tile specific
    applianceTileBackground: Color(0xFFFFFFFF),
    applianceTileIconBackground: Color(0xFFE8F0FF),
    applianceTileIconColor: Color(0xFF1B1D28),
    
    // Telemetry tile specific
    telemetryTileBackground: Color(0xFFFFFFFF),
    telemetryTileIconBackground: Color(0xFFB5C9FF),
    telemetryTileIconColor: Color(0xFF1B1D28),
    
    // Background colors
    scaffoldBackground: Color(0xFFF3F5FF),
    cardBackground: Color(0xFFFFFFFF),
    
    // Text colors
    textPrimary: Color(0xFF1B1D28),
    textSecondary: Color(0xFF7B819A),
    textTertiary: Color(0xFF6A7085),
    
    // Icon colors
    iconPrimary: Color(0xFF6A7085),
    iconSecondary: Color(0xFF7B819A),
    
    // Button colors
    buttonPrimary: Color(0xFF4567FF),
    buttonOnPrimary: Color(0xFFFFFFFF),
    buttonSecondary: Color(0xFFB5C9FF),
    buttonOnSecondary: Color(0xFF1B1D28),
    
    // Border colors
    borderPrimary: Color(0xFFE8ECFF),
    borderSecondary: Color(0xFFB5C9FF),
    
    // Status colors
    statusSuccess: Color(0xFF34C759),
    statusWarning: Color(0xFFFF9500),
    statusError: Color(0xFFFF3B30),
    statusInfo: Color(0xFF4567FF),
  );

  // Dark theme colors
  static const dark = AppColors(
    // Tile/Card colors (generic)
    tileBackground: Color(0xFF1A2235),
    tileBorder: Color(0xFF2A3447),
    tileShadow: Color(0x28000000),
    tileIconBackground: Color(0xFF354B91),
    tileIconColor: Color(0xFFFFFFFF),
    tileTitleColor: Color(0xFFFFFFFF),
    tileSubtitleColor: Color(0xFFB8BED2),
    
    // Room tile specific
    roomTileBackground: Color(0xFF1A2235),
    roomTileIconBackground: Color(0xFF354B91),
    roomTileIconColor: Color(0xFFFFFFFF),
    
    // Controller tile specific
    controllerTileBackground: Color(0xFF1A2235),
    controllerTileIconBackground: Color(0xFF2D4080),
    controllerTileIconColor: Color(0xFFFFFFFF),
    
    // Appliance tile specific
    applianceTileBackground: Color(0xFF1A2235),
    applianceTileIconBackground: Color(0xFF253A6F),
    applianceTileIconColor: Color(0xFFFFFFFF),
    
    // Telemetry tile specific
    telemetryTileBackground: Color(0xFF1A2235),
    telemetryTileIconBackground: Color(0xFF354B91),
    telemetryTileIconColor: Color(0xFFFFFFFF),
    
    // Background colors
    scaffoldBackground: Color(0xFF0D1321),
    cardBackground: Color(0xFF1A2235),
    
    // Text colors
    textPrimary: Color(0xFFFFFFFF),
    textSecondary: Color(0xFFB8BED2),
    textTertiary: Color(0xFF8A94AF),
    
    // Icon colors
    iconPrimary: Color(0xFF8A94AF),
    iconSecondary: Color(0xFFB8BED2),
    
    // Button colors
    buttonPrimary: Color(0xFF4C6FFF),
    buttonOnPrimary: Color(0xFFFFFFFF),
    buttonSecondary: Color(0xFF354B91),
    buttonOnSecondary: Color(0xFFFFFFFF),
    
    // Border colors
    borderPrimary: Color(0xFF2A3447),
    borderSecondary: Color(0xFF354B91),
    
    // Status colors
    statusSuccess: Color(0xFF32D74B),
    statusWarning: Color(0xFFFF9F0A),
    statusError: Color(0xFFFF453A),
    statusInfo: Color(0xFF4C6FFF),
  );
}

// Extension to easily access AppColors from BuildContext
extension AppColorsExtension on BuildContext {
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
}
