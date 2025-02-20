class SignUpBody{
  String email;
  String password;
  String phone;
  SignUpBody({
    required this.phone, required this.email, required this.password,
});

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["f_name"] = this.email;
    data["phone"] = this.phone;
    data["pasword"] = this.password;
    return data;
  }

}