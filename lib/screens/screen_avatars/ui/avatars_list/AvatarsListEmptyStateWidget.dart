part of screen_avatars;

class _AvatarsListEmptyStateWidget extends StatelessWidget {
  final VoidCallback onResetFilters;

  const _AvatarsListEmptyStateWidget({super.key, required this.onResetFilters});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(ZlImages.avatars_list_empty_state, width: 165.w, height: 165.h),
          Text(
            'Nothing was found using\nthese filters',
            style: ZlTextStyles.bold_22_1_2(),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
          ZlButtonOutline(title: 'Clear filters', onPressed: onResetFilters),
        ],
      ),
    );
  }
}
