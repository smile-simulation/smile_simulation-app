class EndPoint {
  static String baseUrl = "http://smilesimulation.runasp.net/api/";
  static String signUpUser = "Account/Register/Patient";
  static String signUpDoctor = "Account/Register/Doctor";
  static String login = "Account/Login";
  static String forgetPassword = "Account/ForgetPassword";
  static String resetPassword = "Account/ResetPassword";
  static String verifyOTP = "Account/VerifyOTP";
  static String allAdvices = "Advice/GetAllAdvices";
  static String post = "post";
  static String like = "Like/postid/";
  static String adviceByCategoryId = "AdviceCategory";
  static String allAdvicesCategories = "AdviceCategory/GetAll_Advice_Category";
  static String getPersonalData  = "User/GetPatientPersonalData?UserName=";
  static String updatePersonalData  = "User/EditPatientPersonalData?UserName=";
}
