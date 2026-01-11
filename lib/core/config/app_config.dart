class AppConfig {
  static const String serverUrl = String.fromEnvironment('SERVER_URL',  defaultValue: 'https://ir-remote-backend.onrender.com');
  
  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: '$serverUrl/api',
  );

  
  
  static const String appName = 'IoT IR Control';
  
  // Storage keys
  static const String tokenKey = 'auth_token';
  static const String userKey = 'user_data';
  static const String userIdKey = 'user_id';
}
