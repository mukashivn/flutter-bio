class Endpoints {
  Endpoints._();

  static const bool DEV = true;

  // base url
  static const String baseUrl =
      DEV ? "http://test-api.venesa.vn:8082" : "http://api.venesa.vn:8081";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // booking endpoints
  static const String getPosts = baseUrl + "/posts";

  static const String LOGIN = '/api/v1/authenticate';
  static const String REGISTER = '/api/v1/register';
  static const String ENDROLL_GET_OTP = '/api/v1/users/active/get-otp/';
  static const String ACTIVE_ACCOUNT = '/api/v1/users/active/valid-otp';
  static const String FOGETPASS_GET_OTP = '/api/v1/users/reset-passwd/get-otp/';
  static const String FOGETPASS_VALIDATE_OTP =
      '/api/v1/users/reset-passwd/valid-otp';
  static const String USER_PROFILE = '/api/v1/users/profile';
  static const String UPDATE_PROFILE = '/api/v1/users/profile';
  static const String CHANGE_PASSWORD = '/api/v1/users/change-password';
  static const String CHANGE_EMAIL = '/api/v1/users/change-email';
  static const String CHECK_PHONE = '/api/v1/users/mobile/check-mobile/';
  static const String VALIDATE_CHANGE_PHONE =
      '/api/v1/users/mobile/change-mobile/valid-otp';
  static const String HOME_BANNER = '/api/v1/banners';
  static const String NOTIFICATION_LIST = '/api/v1/notifications';
  static const String NOTIFICATION_DETAIL = '/api/v1/notifications/detail/';
  static const String COURSE_LIST = '/api/v1/courses';
  static const String SCHEDULE_LIST =
      '/api/v2/class-schedules'; //Phase 2: change from v1-v2
  static const String SCHEDULE_LIST_COMPLETE =
      '/api/v2/class-schedules/finished';
  static const String SCHEDULE_LIST_REGISTERED =
      '/api/v2/class-schedules/has-register'; //Phase 2
  static const String SCHEDULE_DETAIL = '/api/v1/class-schedules/';
  static const String REGISTER_CLASS = '/api/v1/class-schedules/register';

  //Phase 2
  static const String BILL_HISTORY = '/api/v1/bills/history/'; //{page}/{limit}
  static const String BILL_DETAIL = '/api/v1/bills/detail/'; //{billId}
  static const String SKINCARE_LIST = '/api/v1/contract-product/skincare';
  static const String SKINCARE_DETAIL =
      '/api/v1/contract-product/skincare'; //{contractProductId}
  static const String WELLNESS_LIST = '/api/v1/contract-product/wellness';
  static const String WELLNESS_DETAIL =
      '/api/v1/contract-product/wellness'; //{contractProductId}
  static const String LOYALTY_INFO = '/api/v1/loyalties/info';
  static const String LOYALTY_TRANSACTION_HISTORY =
      '/api/v1/loyalties/transaction-history';
  static const String MEMBERSHIP_INFO = '/api/v1/memberships/info';
  static const String MEMBERSHIP_TRANSACTION_HISTORY =
      '/api/v1/memberships/transaction-history';
  static const String TREATMENT_HISTORY =
      '/api/v1/customers/skincare/treatment-history';
  static const String WELLNESS_TREATMENT_HISTORY =
      '/api/v1/customers/wellness/treatment-history';
  static const String REVIEW_SERVICE = '/api/v1/rating';
  static const String FRIEND_LIST = '/api/v1/reference-mobile/search';
  static const String FRIEND_RECOMMEND = '/api/v1/reference-mobile';
  static const String QA_LIST = '/api/v1/question-answer/'; //{type}

}
