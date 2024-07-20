import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/login/data/data_sources/login_remote_data_source.dart';
import '../../features/auth/login/data/repos/login_repo.dart';
import '../../features/auth/login/logic/login_cubit.dart';
import '../../features/auth/register/data/data_sources/register_remote_data_source.dart';
import '../../features/auth/register/data/repos/register_repo.dart';
import '../../features/auth/register/logic/register_cubit.dart';
import '../../features/category/data/data_sources/category_remote_data_source.dart';
import '../../features/category/data/data_sources_impl/category_remote_data_source_impl.dart';
import '../../features/category/data/repos_impl/category_repository_impl.dart';
import '../../features/category/domain/repos/category_repository.dart';
import '../../features/category/domain/use_cases/get_category_products_use_cases.dart';
import '../../features/category/presentation/logic/category_cubit.dart';
import '../../features/home/data/data_sources/home_remote_data_source.dart';
import '../../features/home/data/data_sources_impl/home_remote_data_source_impl.dart';
import '../../features/home/data/repos_impl/home_repo_impl.dart';
import '../../features/home/domain/repos/home_repo.dart';
import '../../features/home/domain/use_cases/get_home_categories_use_case.dart';
import '../../features/home/domain/use_cases/get_home_products_use_case.dart';
import '../../features/home/domain/use_cases/get_user_selected_car_use_case.dart';
import '../../features/home/presentation/logic/cubit/user_cubit.dart';
import '../../features/home/presentation/logic/home_cubit.dart';
import '../../features/product_details/data/data_sources/product_remote_data_source.dart';
import '../../features/product_details/data/data_sources_impl/product_remote_data_source_impl.dart';
import '../../features/product_details/data/repos_impl/product_repo_impl.dart';
import '../../features/product_details/domain/repos/product_repo.dart';
import '../../features/product_details/domain/use_cases/get_product_details_use_case.dart';
import '../../features/product_details/domain/use_cases/get_similar_product_use_case.dart';
import '../../features/product_details/presentation/logic/product_cubit.dart';
import '../networking/crud_manager.dart';
import '../networking/dio/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  // Dio & ApiService
  Dio freeDio = DioFactory.getFreeDio();
  Dio tokenDio = DioFactory.getTokenDio();

  getIt.registerLazySingleton<CrudManager>(() => CrudManager.getInstance(
        freeDio: freeDio,
        tokenDio: tokenDio,
      ));

  // Register
  getIt.registerFactory<RegisterRemoteDataSource>(
      () => RegisterRemoteDataSource(getIt()));
  getIt.registerFactory<RegisterRepo>(() => RegisterRepo(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));

  // login
  getIt.registerFactory<LoginRemoteDataSource>(
      () => LoginRemoteDataSource(getIt()));
  getIt.registerFactory<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // home
  getIt.registerFactory<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(getIt()),
  );
  getIt.registerFactory<HomeRepo>(
    () => HomeRepoImpl(getIt()),
  );
  getIt.registerFactory<GetUserSelectedCarUseCase>(
    () => GetUserSelectedCarUseCase(getIt()),
  );
  getIt.registerFactory<GetHomeCategoriesUseCase>(
    () => GetHomeCategoriesUseCase(getIt()),
  );
  getIt.registerFactory<GetHomeProductsUseCase>(
    () => GetHomeProductsUseCase(getIt()),
  );
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(
      getIt(),
      getIt(),
    ),
  );

  // User
  getIt.registerFactory<UserCubit>(() => UserCubit(getIt()));

  // Category
  getIt.registerFactory<CategoryRemoteDataSource>(
    () => CategoryRemoteDataSourceImpl(getIt()),
  );
  getIt.registerFactory<CategoryRepository>(
    () => CategoryRepositoryImpl(getIt()),
  );
  getIt.registerFactory<GetCategoryProductsUseCases>(
    () => GetCategoryProductsUseCases(getIt()),
  );
  getIt.registerFactory<CategoryCubit>(() => CategoryCubit(getIt()));

  // Product
  getIt.registerFactory<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(getIt()),
  );
  getIt.registerFactory<ProductRepo>(
    () => ProductRepoImpl(getIt(), getIt()),
  );
  getIt.registerFactory<GetProductDetailsUseCase>(
    () => GetProductDetailsUseCase(getIt()),
  );
  getIt.registerFactory<GetSimilarProductUseCase>(
    () => GetSimilarProductUseCase(getIt()),
  );
  getIt.registerFactory<ProductCubit>(() => ProductCubit(getIt(), getIt()));
}
