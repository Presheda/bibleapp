import 'package:bibleapp/network/config.dart';

class ApiEndpoint {
  ApiEndpoint._();

  static const baseUrl = Config.baseUrl;

  /// Returns the path for an authentication [endpoint].
  static String auth(AuthEndpoint endpoint) {
    const path = '/auth';
    switch (endpoint) {
      case AuthEndpoint.REGISTER:
        return '$path/register';
      case AuthEndpoint.LOGIN:
        return '$path/login';
      case AuthEndpoint.REFRESH_TOKEN:
        return '$path/refresh-token';
      case AuthEndpoint.CHANGE_PASSWORD:
        return '$path/change-password';
      case AuthEndpoint.FORGOT_PW_SEND_OTP:
        return '$path/forgot/send-otp';
      case AuthEndpoint.FORGOT_PW_VERIFY_OTP:
        return '$path/forgot/verify-otp';
      case AuthEndpoint.FORGOT_PW_RESET_PASSWORD:
        return '$path/forgot/reset-password';
    }
  }
}

/// A collection of endpoints used for authentication purposes.
enum AuthEndpoint {
  /// An endpoint for registration requests.
  REGISTER,

  /// An endpoint for login requests.
  LOGIN,

  /// An endpoint for token refresh requests.
  REFRESH_TOKEN,

  /// An endpoint for change password requests.
  CHANGE_PASSWORD,

  /// An endpoint for reset password requests.
  FORGOT_PW_RESET_PASSWORD,

  /// An endpoint for forget password otp requests.
  FORGOT_PW_SEND_OTP,

  /// An endpoint for verifying forgot password otp code.
  FORGOT_PW_VERIFY_OTP,
}
