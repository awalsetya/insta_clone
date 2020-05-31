class NetworkURL {
  static String server = "http://192.168.100.173/ig";

  static String registrasi() {
    return "$server/api/registrasi.php";
  }

  static String login() {
    return "$server/api/login.php";
  }
}
