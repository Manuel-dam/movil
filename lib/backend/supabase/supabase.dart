import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

String _kSupabaseUrl = 'https://dbcwavippdpmmudtztbj.supabase.co';
String _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRiY3dhdmlwcGRwbW11ZHR6dGJqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjkwMDU5MTMsImV4cCI6MjA4NDU4MTkxM30.mMoKqtHYJdzj-sNVgyKGKhOI5Z8nVQ-paR7cCzOn6c0';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
    url: _kSupabaseUrl,
    headers: {'X-Client-Info': 'flutterflow'},
    anonKey: _kSupabaseAnonKey,
    debug: false,
    authOptions: FlutterAuthClientOptions(authFlowType: AuthFlowType.implicit),
  );
}
