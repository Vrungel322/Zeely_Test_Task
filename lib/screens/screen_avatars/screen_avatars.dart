library screen_avatars;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:zeely_test_task/repositories/reposotory_avatars/repository_avatars.dart';
import 'package:zeely_test_task/resources/recources.dart';
import 'package:zeely_test_task/zl_views/zl_views.dart';

part 'AvatarsPage.dart';

part 'ScreenAvatarsModule.dart';

part 'ui/avatars_list/AvatarsListWidget.dart';

part 'ui/avatars_list/AvatarsListEmptyStateWidget.dart';

part 'ui/avatars_filter/AvatarFiltersWidget.dart';

part 'ui/avatars_filter/filter_configuration/AvatarFilterConfigurationWidget.dart';

part 'ui/avatars_filter/filter_configuration/data/AvatarFilterConfigurationUiData.dart';

part 'ui/avatars_filter/filter_configuration/data/AvatarFilterConfigurationItemUiData.dart';

part 'ui/avatars_list/data/AiAvatarUiData.dart';

part 'logic/AvatarsController.dart';

part 'logic/AiAvatarsInteractor.dart';

part 'logic/data/AvatarsPageUiData.dart';
