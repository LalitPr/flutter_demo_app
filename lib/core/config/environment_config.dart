import 'dev_environment.dart' as develop;
import 'prod_environment.dart' as production;

enum AppEnvironment { develop, production }

class EnvironmentConfig {
  final AppEnvironment environment;
  final String baseUrl;
  final String apiKey;

  EnvironmentConfig({
    required this.environment,
    required this.baseUrl,
    required this.apiKey,
  });
}

EnvironmentConfig getEnvironmentConfig() {
  const env =
      String.fromEnvironment('APP_ENVIRONMENT', defaultValue: 'develop');

  final appEnvironment = AppEnvironment.values.firstWhere(
      (element) => element.name == env,
      orElse: () => AppEnvironment.develop);

  switch (appEnvironment) {
    case AppEnvironment.develop:
      return develop.environment;
    case AppEnvironment.production:
      return production.environment;
  }
}
