import 'package:nafa_money/lifeCycleServices/stoppable_service%20.dart';

class BackgroudFetchService extends StoppableService {
  @override
  void start() {
    super.start();
    // start subscription again
  }
  @override
  void stop() {
    super.stop();
    // cancel stream subscription
  }
}