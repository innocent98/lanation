import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:la_nation/providers/prefs_provider.dart';

final darkModeProvider = StateProvider<bool>((ref) {
  final prefs = ref.read(prefsProvider);
  return prefs.getBool('darkMode') ?? false;
  // return false;
});
