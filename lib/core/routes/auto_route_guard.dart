import 'package:auto_route/auto_route.dart';
import 'package:smart_hotel/core/routes/app_routes.gr.dart';
import 'package:smart_hotel/models/user_model.dart';

import '../../dependency_injection.dart' as di;
import '../util/pref_utils.dart';

class GetInitialRoute extends AutoRouteGuard {
  PrefUtils prefUtils = di.sl<PrefUtils>();

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    // UserModel? user = prefUtils.getUser();
    String? token = prefUtils.getToken();

    if (token.isEmpty) {
      resolver.next(true);
    } else {
      router.push(MainRoute());
    }
  }
}
