import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: 'config.env')
abstract class Env {
  @EnviedField(varName: 'BASE_URL')
  static const String baseUrl = _Env.baseUrl;

  // If you added API_KEY
  // @EnviedField(varName: 'API_KEY')
  // static const String apiKey = _Env.apiKey;
}