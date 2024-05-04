import 'package:flutter/material.dart'; // Flutter's Material Design components.

/// A light color scheme for the application's theme.
///
/// This color scheme defines a set of colors to be used in the light theme of the application.
/// It specifies primary, secondary, and tertiary colors, along with their corresponding containers.
/// It also includes colors for error states, background, surface, and various other UI elements.
const lightColorScheme = ColorScheme(
  brightness: Brightness.light, // Indicates this is for a light theme.
  primary: Color(0xFF303EFF), // Primary color.
  onPrimary: Color(0xFFFFFFFF), // Text color on primary.
  primaryContainer: Color(0xFFE0E0FF), // Background for primary.
  onPrimaryContainer: Color(0xFF00046A), // Text color on primary container.
  secondary: Color(0xFF924C00), // Secondary color.
  onSecondary: Color(0xFFFFFFFF), // Text color on secondary.
  secondaryContainer: Color(0xFFFFDCC4), // Background for secondary.
  onSecondaryContainer: Color(0xFF2F1400), // Text color on secondary container.
  tertiary: Color(0xFF7D00F9), // Tertiary color.
  onTertiary: Color(0xFFFFFFFF), // Text color on tertiary.
  tertiaryContainer: Color(0xFFECDCFF), // Background for tertiary.
  onTertiaryContainer: Color(0xFF280057), // Text color on tertiary container.
  error: Color(0xFFBA1A1A), // Color for error states.
  errorContainer: Color(0xFFFFDAD6), // Background for error container.
  onError: Color(0xFFFFFFFF), // Text color on error.
  onErrorContainer: Color(0xFF410002), // Text color on error container.
  background: Color(0xFFFFFBFF), // Background color for the theme.
  onBackground: Color(0xFF1B1B1F), // Text color on background.
  surface: Color(0xFFFFFBFF), // Surface color for UI elements.
  onSurface: Color(0xFF1B1B1F), // Text color on surface.
  surfaceVariant: Color(0xFFE3E1EC), // Variant of surface color.
  onSurfaceVariant: Color(0xFF46464F), // Text color on surface variant.
  outline: Color(0xFF777680), // Outline color for borders.
  onInverseSurface: Color(0xFFF3F0F4), // Text color on inverse surface.
  inverseSurface: Color(0xFF303034), // Inverse surface color.
  inversePrimary: Color(0xFFBEC2FF), // Inverse primary color.
  shadow: Color(0xFF000000), // Color for shadows.
  surfaceTint: Color(0xFF303EFF), // Tint for surfaces.
  outlineVariant: Color(0xFFC7C5D0), // Variant for outline color.
  scrim: Color(0xFF000000), // Color for scrims.
);

/// A dark color scheme for the application's theme.
///
/// This color scheme defines a set of colors to be used in the dark theme of the application.
/// It has similar structure to the light color scheme but with darker tones and contrasts.
const darkColorScheme = ColorScheme(
  brightness: Brightness.dark, // Indicates this is for a dark theme.
  primary: Color(0xFFBEC2FF), // Primary color.
  onPrimary: Color(0xFF0009A7), // Text color on primary.
  primaryContainer: Color(0xFF0011E8), // Background for primary.
  onPrimaryContainer: Color(0xFFE0E0FF), // Text color on primary container.
  secondary: Color(0xFFFFB780), // Secondary color.
  onSecondary: Color(0xFF4E2600), // Text color on secondary.
  secondaryContainer: Color(0xFF6F3800), // Background for secondary.
  onSecondaryContainer: Color(0xFFFFDCC4), // Text color on secondary container.
  tertiary: Color(0xFFD6BAFF), // Tertiary color.
  onTertiary: Color(0xFF420089), // Text color on tertiary.
  tertiaryContainer: Color(0xFF5F00C0), // Background for tertiary.
  onTertiaryContainer: Color(0xFFECDCFF), // Text color on tertiary container.
  error: Color(0xFFFFB4AB), // Color for error states.
  errorContainer: Color(0xFF93000A), // Background for error container.
  onError: Color(0xFF690005), // Text color on error.
  onErrorContainer: Color(0xFFFFDAD6), // Text color on error container.
  background: Color(0xFF1B1B1F), // Background color for the theme.
  onBackground: Color(0xFFE5E1E6), // Text color on background.
  surface: Color(0xFF1B1B1F), // Surface color for UI elements.
  onSurface: Color(0xFFE5E1E6), // Text color on surface.
  surfaceVariant: Color(0xFF46464F), // Variant of surface color.
  onSurfaceVariant: Color(0xFFC7C5D0), // Text color on surface variant.
  outline: Color(0xFF91909A), // Outline color for borders.
  onInverseSurface: Color(0xFF1B1B1F), // Text color on inverse surface.
  inverseSurface: Color(0xFFE5E1E6), // Inverse surface color.
  inversePrimary: Color(0xFF303EFF), // Inverse primary color.
  shadow: Color(0xFF000000), // Color for shadows.
  surfaceTint: Color(0xFFBEC2FF), // Tint for surfaces.
  outlineVariant: Color(0xFF46464F), // Variant for outline color.
  scrim: Color(0xFF000000), // Color for scrims.
);
