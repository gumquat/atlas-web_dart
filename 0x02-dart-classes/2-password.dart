class Password{
  String password = '';

  bool isValid(){
    bool length = password.length >= 8 && password.length <= 16;
    bool upper = password.contains(RegExp(r'[A-Z]'));
    bool lower = password.contains(RegExp(r'[a-z]'));
    bool digits = password.contains(RegExp(r'[0-9]'));

    return length & upper & lower & digits;
  }
  @override
  String toString(){
    return 'Your Password is: $password';
  }
}