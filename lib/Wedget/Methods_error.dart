

 String getErrorMessage(String error) {
  if (error.contains("email-already-in-use")) {
    return "هذا البريد الإلكتروني مستخدم بالفعل";
  } else if (error.contains("weak-password")) {
    return "كلمة المرور ضعيفة جداً";
  } else if (error.contains("invalid-email")) {
    return "صيغة البريد الإلكتروني غير صحيحة";
  } else {
    return "حدث خطأ، حاول مرة أخرى";
  }
}