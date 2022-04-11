import 'package:nafa_money/lifeCycleServices/stoppable_service%20.dart';

class LocationService extends StoppableService {
  @override
  void start() {
    super.start();
     print("service is started");
  }
  @override
  void stop() {
    super.stop();
   print("service is stopped");
  }
  
}