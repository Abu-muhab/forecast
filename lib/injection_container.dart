import 'package:dio/dio.dart';
import 'package:forecast/data/datasources/forecast_local_data_source.dart';
import 'package:forecast/data/datasources/forecast_remote_data_scource.dart';
import 'package:forecast/data/network/forecast_rest_client.dart';
import 'package:forecast/data/network/network_info.dart';
import 'package:forecast/data/repositories/forecast_repository_impl.dart';
import 'package:forecast/domain/repositories/forecast_repository.dart';
import 'package:forecast/domain/usecases/get_aggregate_forecast.dart';
import 'package:forecast/presentation/providers/forecast_provider.dart';
import 'package:forecast/presentation/providers/location_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:location/location.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //providers
  sl.registerFactory(() => ForecastProvider(getAggregateForecast: sl()));
  sl.registerFactory(() => LocationProvider(location: sl()));

  //use cases
  sl.registerLazySingleton(() => GetAggregateForecast(sl()));

  //repositories
  sl.registerLazySingleton<ForecastRepository>(() => ForecastRepositoryImpl(
      forecastLocalDataSource: sl(),
      forecastRemoteDataSource: sl(),
      networkInfo: sl()));

  //data sources
  sl.registerLazySingleton<ForecastRemoteDataSource>(
      () => ForecastRemoteDataSourceImpl(forecastRestClient: sl()));
  sl.registerLazySingleton<ForecastLocalDataSource>(
      () => ForecastLocalDataSourceImpl());

  //network
  sl.registerLazySingleton<ForecastRestClient>(() => ForecastRestClient(sl()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  //external
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => Location());
}
