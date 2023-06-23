import '../entities/location.dart';

abstract class GetLocationsByPageUseCase {
  Future<List<Location>> getLocationsByPage({int page = 1});
}
