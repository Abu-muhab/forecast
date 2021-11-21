import 'package:dio/dio.dart';
import 'package:forecast/data/datasources/forecast_local_data_source.dart';
import 'package:forecast/data/datasources/forecast_remote_data_scource.dart';
import 'package:forecast/data/network/forecast_rest_client.dart';
import 'package:forecast/data/network/network_info.dart';
import 'package:forecast/data/network/places_rest_client.dart';
import 'package:forecast/data/repositories/forecast_repository_impl.dart';
import 'package:forecast/data/repositories/notifications_repository_impl.dart';
import 'package:forecast/domain/repositories/forecast_repository.dart';
import 'package:forecast/domain/repositories/notification_repository.dart';
import 'package:forecast/domain/usecases/add_and_get_updated_notification_list.dart';
import 'package:forecast/domain/usecases/find_loaction_from_text.dart';
import 'package:forecast/domain/usecases/get_aggregate_forecast.dart';
import 'package:forecast/domain/usecases/get_notifications.dart';
import 'package:forecast/domain/usecases/marks_notifications_as_read_and_get_updated_list.dart';
import 'package:forecast/presentation/providers/forecast_provider.dart';
import 'package:forecast/presentation/providers/location_provider.dart';
import 'package:forecast/presentation/providers/notification_provider.dart';
import 'package:forecast/presentation/providers/settings_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //providers
  sl.registerFactory(
      () => ForecastProvider(getAggregateForecast: sl(), location: sl()));
  sl.registerFactory(
      () => LocationProvider(location: sl(), findLocationFromText: sl()));
  sl.registerFactory(() => SettingsProvider());
  sl.registerFactory(() => NotificationProvider(
      addAndGetUpdatedNotificationList: sl(),
      getNotifications: sl(),
      markNotificationsAsReadAndGetUpdatedList: sl()));

  //use cases
  sl.registerLazySingleton(() => GetAggregateForecast(sl()));
  sl.registerLazySingleton(() => FindLocationFromText(placesRestClient: sl()));
  sl.registerLazySingleton(() => AddAndGetUpdatedNotificationList(sl()));
  sl.registerLazySingleton(() => GetNotifications(sl()));
  sl.registerLazySingleton(
      () => MarkNotificationsAsReadAndGetUpdatedList(sl()));

  //repositories
  sl.registerLazySingleton<ForecastRepository>(() => ForecastRepositoryImpl(
      forecastLocalDataSource: sl(),
      forecastRemoteDataSource: sl(),
      networkInfo: sl()));
  sl.registerLazySingleton<NotificationRepository>(
      () => NotificationRepositoryImpl(sharedPreferences: sl()));

  //data sources
  sl.registerLazySingleton<ForecastRemoteDataSource>(
      () => ForecastRemoteDataSourceImpl(forecastRestClient: sl()));
  sl.registerLazySingleton<ForecastLocalDataSource>(
      () => ForecastLocalDataSourceImpl(sharedPreferences: sl()));

  //network
  sl.registerLazySingleton<ForecastRestClient>(() => ForecastRestClient(sl()));
  sl.registerLazySingleton<PlacesRestClient>(() => PlacesRestClient(sl()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  //external
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => Location());
  SharedPreferences preferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => preferences);
}
