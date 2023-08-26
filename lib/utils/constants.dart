class Constants {
  // static const String apiUrl = 'http://10.16.12.1:7092/api';
  static const String apiUrl = 'http://192.168.100.158:7092/api';

  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Allow-Control-Allow-Origin': '*', // CORS
  };
}
