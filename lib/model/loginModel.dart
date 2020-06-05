class LoginModel {
  final int value;
  final String message;
  final String id;
  final String username;
  final String name;
  final String email;
  final String createdDate;

  LoginModel(
      {this.value,
      this.message,
      this.id,
      this.email,
      this.username,
      this.name,
      this.createdDate});

  factory LoginModel.api(Map<String, dynamic> json) {
    return LoginModel(
      value: json['value'],
      message: json['message'],
    );
  }
}
