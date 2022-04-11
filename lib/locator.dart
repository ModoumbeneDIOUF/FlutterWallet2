import 'package:get_it/get_it.dart';
import 'package:nafa_money/lifeCycleServices/backgroud_fetch_service.dart';
import 'package:nafa_money/lifeCycleServices/location_service.dart';

GetIt locator = GetIt.instance ;

void setupLocator(){

  locator.registerLazySingleton(() => LocationService());
  locator.registerLazySingleton(() => BackgroudFetchService());
}