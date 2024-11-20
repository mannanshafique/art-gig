// ignore_for_file: constant_identifier_names

class NetworkStrings {
  ////////////////////// API BASE URL //////////////////////////////////
  // Technado CPanel
  // static const String API_BASE_URL = "https://server.appsstaging.com/3373/be_discovered/public/api/";

  // Client CPanel
  static const String API_BASE_URL = "https://host2.appsstaging.com:3043/api/";

  static const String STRIPE_PUBLISH_KEY =
      "pk_test_51Q2Xu4CHsLZSnNQo5FV27D4LKbnvWR083g9qnpFD1S8Gsm2rCoykfBTECVSuMaYkiAX8PzXWNLMkEh2U0XuH58bW00asSx3q5R";

  ////////////////////// SOCKET API BASE URL //////////////////////////////////

  // Client CPanel
  // static const String CHAT_SOCKET_API_BASE_URL =
  //     "https://server1.appsstaging.com:3086";

  static const String MERCHANT_THANK_YOU_URL =
      "https://host2.appsstaging.com:3043/privacy_policy";

  ////////////////////// Network Image Base Url ///////////////////////////////////

  static const String NETWORK_IMAGE_BASE_URL =
      "https://host2.appsstaging.com:3043/";

  /////// API HEADER TEXT ////////////////////////
  static const String ACCEPT = 'application/json';
  // static const String BEARER_TOKEN = "Bearer Token";

  ////////////////////// API ENDPOINTS  ////////////////////////

  //!-------- Auth Endpoints
  static const String LOGIN_ENDPOINT = "signin";
  static const String SOCIAL_LOGIN_ENDPOINT = "sociallogin";
  static const String OTP_VERIFICATION_ENDPOINT = "verifyaccount";
  static const String RESEND_OTP_ENDPOINT = "resendotp";
  static const String COMPLETE_PROFILE_ENDPOINT = "completeProfile";
  static const String LOGOUT_ENDPOINT = "signout";

  static const String ADD_SCHEDULING_ENDPOINT = "consultant/AddSchedule";

  static const String ADD_CHILDERN_ENDPOINT = "parent/addChildern";
  static const String GET_CHILDERN_ENDPOINT = "parent/getChilderns";

  //!----Card
  static const String ADD_NEW_CARD_ENDPOINT = "addCard";
  static const String GET_CARD_LIST_ENDPOINT = "getAllCard";
  static const String SET_DEFAULT_CARD_ENDPOINT = "setCardDefault";
  static const String DELETE_CARD_ENDPOINT = "deleteCard";

  static const String GET_CONSULTANTS_ENDPOINT = "getAllConsultants";

  //!---Common
  static const String GET_BOOKINGS_ENDPOINT = "allBookings";

//!----Consultant

  static const String GET_STUDENT_ENDPOINT = "consultant/getStudents";
  static const String CHANGE_BOOKING_STATUS_ENDPOINT =
      "consultant/changeBookingStatus";
  // static const String CONS_BOOKING_HISTORY_ENDPOINT = "consultant/bookingHistory";

  static const String ADD_POST = "consultant/addPost";
  static const String ADD_BLOG = "consultant/addBlog";
  static const String ADD_WEBINAR = "consultant/addWebinar";
  static const String CREATE_ASSIGNMENT = "consultant/createAssignment";
  static const String CREATE_QUIZ = "consultant/createQuiz";
  static const String GET_AVAILABLE_SLOTS = "getAvailableSlots";

//!----Student

  static const String STUDENT_VIEW_ASSIGNMENT = "user/viewMyAssignments";
  static const String STUDENT_VIEW_DETAIL_ASSIGNMENT =
      "user/viewAssignmentDetail";
  static const String STUDENT_UPLOAD_ASSIGNMENT = "user/uploadAssignment";

  /////////////// SOCKET EMIT EVENTS ////////////////
  // static const String CREATE_ROOM_EVENT = "create-room";
  // static const String GET_INBOX_EVENT = "get_inbox";
  static const String GET_MESSAGES_EVENT = "get_messages";
  static const String SEND_MESSAGE_EVENT = "send_message";

  /////////////// SOCKET RESPONSE KEYS ////////////////
  static const String GET_INBOX_KEY = "inbox";
  static const String GET_MESSAGES_KEY = "get_messages";
  static const String GET_MESSAGE_KEY = "get_message";

//!-----Order Status For Notification
  static const String CREATE_ORDER_NOTIFICATION_TYPE = "Create-Order";
  static const String ORDER_ACCEPTED_NOTIFICATION_TYPE = "Accepted";
  static const String ORDER_REJECTED_NOTIFICATION_TYPE = "Rejected";
  static const String ORDER_IN_PROGRESS_NOTIFICATION_TYPE = "In Progress";
  static const String ORDER_ON_THE_WAY_NOTIFICATION_TYPE = "On the Way";
  static const String ORDER_COMPLETED_NOTIFICATION_TYPE = "Completed";
  static const String ORDER_CANCELLED_NOTIFICATION_TYPE = "Cancelled";

  // Create-Order
//post_id

//Accepted
// In Progress
// On the Way
// Completed

//!

  static const String CHAT_ERROR = "Chat not found.";

  ////// API STATUS CODE/////////////
  static const int SUCCESS_CODE = 200;
  static const int UNAUTHORIZED_CODE = 401;
  static const int CARD_ERROR_CODE = 402;
  static const int BAD_REQUEST_CODE = 400;
  static const int FORBIDDEN_CODE = 403;

  /////////// API MESSAGES /////////////////
  static const int API_SUCCESS_STATUS = 1;
  static const String EMAIL_UNVERIFIED = "0";
  static const String EMAIL_VERIFIED = "1";
  static const String PROFILE_INCOMPLETED = "0";
  static const String PROFILE_COMPLETED = "1";

  /////////// USER PAYMENT STATUS VALUE /////////////////
  static const int PAID_USER = 1;
  static const int UN_PAID_USER = 0;
  static const int PAID_DATA = 1;
  static const int UN_PAID_DATA = 0;
  static const int GUEST_USER = 1;
  static const String ADMIN_ACTIVITY = 'admins';
  static const String USER_ACTIVITY = 'users';

  /////////// API TOAST MESSAGES //////////////////
  static const String NO_INTERNET_CONNECTION = "No Internet Connection!";
  static const String SOMETHING_WENT_WRONG = "Something Went Wrong";
  static const String STATUS_NOT_FOUND = "No Status Found";
  static const String INVALID_CARD_ERROR = "Invalid Card Details.";
  static const String CARD_TYPE_ERROR = "Wrong card type.";
  static const String INVALID_BANK_ACCOUNT_DETAILS_ERROR =
      "Invalid Bank Account Details.";
  static const String MERCHANT_ACCOUNT_ERROR =
      "Error:Merchant Account can not be created.";

//---------------- API SHOW ERROR MESSAGE -------------------//

  static const String NOTIFICATION_EMPTY_ERROR = "Notification not found";
  static const String CONTENT_EMPTY_ERROR = "Content not found";
  static const String CHAT_EMPTY_ERROR = "Chat not found";
  static const String STATUS_EMPTY_ERROR = "Stories not found";
  static const String MY_STATUS_EMPTY_ERROR = "My Stories not found";
  static const String MEDIA_EMPTY_ERROR = "Media not found";
  static const String CONNECTION_REQUEST_EMPTY_ERROR =
      "Connection Request not found";
  static const String PARTNER_EMPTY_ERROR = "Partners not found";
  static const String PENDING_PARTNER_EMPTY_ERROR =
      "Pending partners not found";
  static const String REQUEST_EMPTY_ERROR = "Requests not found";
}
