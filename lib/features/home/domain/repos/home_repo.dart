import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/failures.dart';
import '../../data/models/home_car_model.dart';
import '../entities/category_entity.dart';
import '../entities/home_product_entity.dart';

abstract class HomeRepo {
  Future<Either<ServerFailure, CarModel>> getUserCar();
  Future<Either<ServerFailure, List<HomeCategoryEntity>>> getHomeCategories();
  Future<Either<ServerFailure, List<HomeProductEntity>>> getHomeProducts();
}
