part of screen_avatars;

class AvatarsPage extends StatefulWidget {
  const AvatarsPage({super.key});

  @override
  State<AvatarsPage> createState() => _AvatarsPageState();
}

class _AvatarsPageState extends State<AvatarsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: GetBuilder<_AvatarsController>(
        builder: (controller) {
          final uiData = controller.uiData;
          return _buildBody(controller, uiData.avatars, uiData.filters, uiData.filterConfigurationUiData);
        },
      ),
    );
  }

  Widget _buildBody(
    _AvatarsController controller,
    List<_AiAvatarUiData> avatarUiItems,
    AiAvatarFilters filters,
    _AvatarFilterConfigurationUiData? currentFilterConfigurationUiData,
  ) {
    return Stack(
      children: [
        Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12.h),
                    Text('All avatars', style: ZlTextStyles.bold_26_1_2()),
                    SizedBox(height: 12.h),
                    _AvatarFiltersWidget(
                      filters: filters,
                      onFiltersReset: () => controller.resetFilters(),
                      onGenderFilterTap: () => controller.startEditGenderFilters(),
                      onAgeGroupFilterTap: () => controller.startEditAgeFilters(),
                      onPoseFilterTap: () => controller.startEditPoseFilters(),
                    ),
                    SizedBox(height: 12.h),
                    Expanded(
                      child: _AvatarsListWidget(
                        avatars: avatarUiItems,
                        onResetFilters: () => controller.resetFilters(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        AnimatedOpacity(
          opacity: currentFilterConfigurationUiData == null ? 0 : 1,
          duration: const Duration(milliseconds: 150),
          child:
              currentFilterConfigurationUiData == null
                  ? const SizedBox()
                  : _AvatarFilterConfigurationWidget(
                    uiData: currentFilterConfigurationUiData!,
                    onSave: (List<_AvatarFilterConfigurationItemUiData> updatedOptions) {
                      controller.filterAvatars(updatedOptions);
                    },
                    onBarrierClick: () {
                      controller.stopEditFilters();
                    },
                  ),
        ),
      ],
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: const Icon(CupertinoIcons.back, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      backgroundColor: Colors.white,
    );
  }
}
