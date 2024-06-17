class Password{
  String _password = '';

  //make password private, this is a constructor
  Password({String password = ''}){
    _password = password;
  }

  bool isValid(){
    bool length = _password.length >= 8 && _password.length <= 16;
    bool upper = _password.contains(RegExp(r'[A-Z]'));
    bool lower = _password.contains(RegExp(r'[a-z]'));
    bool digits = _password.contains(RegExp(r'[0-9]'));

    return length & upper & lower & digits;
  }
  @override
  String toString(){
    return 'Your Password is: $_password';
  }
}