import 'package:crypto/crypto.dart';
import 'dart:convert'; 

class SecurityUtils {
  
  
  String passwordEncrypt(String strPassword)
   {
    var strPasswordecrp = utf8.encode(strPassword); // data being hashed
    var  strEncryptedPassword = sha256.convert(strPasswordecrp);
    print(strEncryptedPassword);
    return strEncryptedPassword.toString();
  }
}
