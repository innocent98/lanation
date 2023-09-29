import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:la_nation/providers/prefs_provider.dart';

final fontSizeProvider = StateProvider<double>((ref) {
  final prefs = ref.read(prefsProvider);
  return prefs.getDouble('fontSize') ?? 16;
  // return false;
});
