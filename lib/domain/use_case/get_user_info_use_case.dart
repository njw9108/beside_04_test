import 'package:beside04_test/domain/repository/user_info_repository.dart';

class GetUserInfoUseCase {
  final UserInfoRepository userInfoRepository;

  GetUserInfoUseCase({
    required this.userInfoRepository,
  });

  Future<String> call() async {
    return await userInfoRepository.loadUserLoginId();
  }
}
