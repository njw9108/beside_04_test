import 'package:beside04_test/domain/repository/local_secure_data_repository.dart';

class GetTokenUseCase {
  final LocalSecureDataRepository tokenRepository;

  GetTokenUseCase({
    required this.tokenRepository,
  });

  Future<String> getAccessToken() async {
    return await tokenRepository.loadData('accessToken');
  }

  Future<String> getRefreshToken() async {
    return await tokenRepository.loadData('refreshToken');
  }
}
