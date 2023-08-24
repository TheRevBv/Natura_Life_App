class Constants {
  static const String apiUrl = 'http://192.168.113.138:7092/api';

  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Allow-Control-Allow-Origin': '*', // CORS
  };
}
