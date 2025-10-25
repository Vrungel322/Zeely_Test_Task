part of screen_avatars;

class _AvatarFiltersWidget extends StatelessWidget {
  final AiAvatarFilters filters;
  final Function() onFiltersReset;
  final Function() onGenderFilterTap;
  final Function() onAgeGroupFilterTap;
  final Function() onPoseFilterTap;
  late final filterBorderDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(8.r)),
    border: Border.all(color: const Color(0xFFF2F4F6)),
  );

  _AvatarFiltersWidget({
    super.key,
    required this.filters,
    required this.onFiltersReset,
    required this.onGenderFilterTap,
    required this.onAgeGroupFilterTap,
    required this.onPoseFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (filters.isEmpty() == false) _buildResetFilter(),
        if (filters.isEmpty() == false) SizedBox(width: 8.w),
        _buildFilter(onGenderFilterTap, 'Gender', filters.genders.length),
        SizedBox(width: 8.w),
        _buildFilter(onAgeGroupFilterTap, 'Age', filters.ageGroups.length),
        SizedBox(width: 8.w),
        _buildFilter(onPoseFilterTap, 'Pose', filters.poses.length),
      ],
    );
  }

  Widget _buildResetFilter() {
    return GestureDetector(
      onTap: onFiltersReset,
      child: Container(
        width: 36.w,
        height: 36.h,
        decoration: filterBorderDecoration,
        child: Icon(Icons.close_rounded, color: Colors.black, size: 18.r),
      ),
    );
  }

  GestureDetector _buildFilter(Function() onClick, String title, int count) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        decoration: filterBorderDecoration,
        padding: EdgeInsets.only(left: 12.w, top: 6.h, bottom: 6.h, right: 6.w),
        child: Row(
          children: [
            Text(
              title,
              // to make text center aligned vertically
              strutStyle: const StrutStyle(forceStrutHeight: true),
              style: ZlTextStyles.semibold_12_1_0(),
              textAlign: TextAlign.center,
            ),
            // counter
            if (count > 0) SizedBox(width: 4.w),
            if (count > 0)
              Container(
                decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                width: 16.w,
                height: 16.h,
                child: Text(
                  '$count',
                  style: ZlTextStyles.bold_12_1_4(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            // arrow
            SizedBox(width: 4.w),
            const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
