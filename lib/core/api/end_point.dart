class EndPoint {
  static String baseUrl = "http://smilesimulation.runasp.net/api/";
  static String signUpUser = "Account/Register/Patient";
  static String signUpDoctor = "Account/Register/Doctor";
  static String login = "Account/Login";
  static String forgetPassword = "Account/ForgetPassword";
  static String resetPassword = "Account/ResetPassword";
  static String changePassword = "Account/ChangePassword";
  static String deleteAccount = "UserManagement/DeleteAccountByEmail?email=";
  static String verifyOTP = "Account/VerifyOTP";
  static String allAdvices = "Advice";
  static String post = "post";
  static String getPostsByPublisherId = "Post/Publisher/";
  static String like = "Like/postid/";
  static String adviceByCategoryId = "AdviceCategory";
  static String allAdvicesCategories = "AdviceCategory";
  static String getPersonalData = "User/GetPatientPersonalData?UserName=";
  static String updatePersonalData = "User/EditPatientPersonalData?UserName=";
  static String updateHealthStatus = "User/EditPatientHealthConditionData/";
  static String editProfile = "User/EditUserDetails";
}
