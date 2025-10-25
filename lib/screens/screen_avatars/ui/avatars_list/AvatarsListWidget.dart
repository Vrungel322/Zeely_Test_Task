part of screen_avatars;

class _AvatarsListWidget extends StatelessWidget {
  static final double _avatarItemWidth = 152.w;
  static final double _avatarItemHeight = 112.h;
  final List<_AiAvatarUiData> avatars;
  final VoidCallback onResetFilters;

  _AvatarsListWidget({super.key, required this.avatars, required this.onResetFilters});

  final _borderRadius = BorderRadius.circular(12.r);

  @override
  Widget build(BuildContext context) {
    return avatars.isEmpty
        ? _AvatarsListEmptyStateWidget(onResetFilters: onResetFilters)
        : GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 8.h,
            // w/h ratio where sizes taken from design
            childAspectRatio: _avatarItemHeight / _avatarItemWidth,
          ),
          itemCount: avatars.length,
          itemBuilder: (context, index) {
            final avatar = avatars[index];
            return Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: _borderRadius,
                  child: Image.network(
                    avatar.imageUrl,
                    width: _avatarItemWidth,
                    height: _avatarItemHeight,
                    fit: BoxFit.fill,
                  ),
                ),
                _buildMetadata(avatar),
                _buildShadow(),
              ],
            );
          },
        );
  }

  Widget _buildMetadata(_AiAvatarUiData avatar) {
    return Padding(
      padding: EdgeInsets.all(8.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            avatar.displayName,
            style: ZlTextStyles.semibold_14_1_2(color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '${avatar.displayGender} · ${avatar.displayAge}',
            style: ZlTextStyles.regular_10_1(color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildShadow() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
        border: Border.all(width: 1.w, color: Colors.black.withAlpha(13)),
        gradient: LinearGradient(
          colors: [Colors.white.withAlpha(1), Colors.black.withAlpha(51)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
