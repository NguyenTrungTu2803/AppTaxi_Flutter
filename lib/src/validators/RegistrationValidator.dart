
class RegistrationValidator{

  static bool isValidName(String name){
    return name != null && name.length > 6;
  }
  static bool isValidPhone(String phone){
    return phone.length > 10 && phone.isNotEmpty;
  }
  static bool isValidEmail(String email){
    return  email.isNotEmpty;
  }
  static bool isValidPass(String pass){
    return pass.isNotEmpty && pass.length > 6;
  }
}