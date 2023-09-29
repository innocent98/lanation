import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:la_nation/providers/prefs_provider.dart';

final keepSettingsProvider = StateProvider<bool>((ref) {
  final prefs = ref.read(prefsProvider);
  return prefs.getBool('keepSettings') ?? false;
  // return false;
});
