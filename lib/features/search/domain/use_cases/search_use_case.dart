import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/failures.dart';
import '../../../home/domain/entities/home_product_entity.dart';
import '../repos/search_repo.dart';

class SearchUseCase {
  final SearchRepo _searchRepo;

  SearchUseCase(this._searchRepo);

  Future<Either<ServerFailure, List<HomeProductEntity>>> search(
      String query) async {
    final response = await _searchRepo.search(query);
    return response.fold(
      (serverFailure) => Left(serverFailure),
      (data) {
        List<HomeProductEntity> searchResults = data.map((product) {
          final finalPrice = calculateFinalPrice(
            product.oldPrice!,
            product.discountPercentage!,
          );
          return product.copyWith(price: finalPrice);
        }).toList();

        return Right(searchResults);
      },
    );
  }

  double calculateFinalPrice(num oldPrice, num discountPercentage) {
    return oldPrice - (oldPrice * discountPercentage / 100);
  }
}
