import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstant {
  String baseUrl = dotenv.env['API_URL'] ?? 'http://localhost:3000';
}
