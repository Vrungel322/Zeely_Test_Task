part of screen_avatars;

class _AvatarFilterConfigurationWidget extends StatefulWidget {
  final _AvatarFilterConfigurationUiData uiData;
  final Function(List<_AvatarFilterConfigurationItemUiData> updatedOptions) onSave;
  final Function() onBarrierClick;

  const _AvatarFilterConfigurationWidget({
    super.key,
    required this.uiData,
    required this.onSave,
    required this.onBarrierClick,
  });

  @override
  State<_AvatarFilterConfigurationWidget> createState() => _AvatarFilterConfigurationWidgetState();
}

class _AvatarFilterConfigurationWidgetState extends State<_AvatarFilterConfigurationWidget> {
  late final _options = [...widget.uiData.filterOptions];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: widget.onBarrierClick,
          child: Container(decoration: BoxDecoration(color: Colors.black.withAlpha(125))),
        ),
        _buildSettings(),
      ],
    );
  }

  Widget _buildSettings() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 24.h).add(EdgeInsets.symmetric(horizontal: 16.w)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(28.r))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTitle(),
              SizedBox(height: 32.h),
              _buildList(),
              SizedBox(height: 32.h),
              ZlButtonBlack(
                title: widget.uiData.buttonTitle,
                onPressed: () {
                  widget.onSave(_options);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildList() {
    return Flexible(
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemBuilder: (c, index) {
          final option = _options[index];
          return InkWell(
            onTap: () {
              _toggleItemSelection(option, index);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(option.title, style: ZlTextStyles.semibold_14_1_1()),
                    if (option.subTitle != null) Text(option.subTitle!, style: ZlTextStyles.regular_14_1_4()),
                  ],
                ),
                SizedBox(
                  width: 18.w,
                  height: 18.h,
                  child: CupertinoCheckbox(
                    activeColor: Colors.black,
                    value: option.isSelected,
                    onChanged: (_) {
                      _toggleItemSelection(option, index);
                    },
                    side: BorderSide(width: 1.0.w, color: option.isSelected ? Colors.black : Color(0xFFCAD4DD)),
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => SizedBox(height: 24.h),
        itemCount: _options.length,
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.uiData.title, style: ZlTextStyles.bold_26_1_2()),
        GestureDetector(onTap: widget.onBarrierClick, child: const Icon(Icons.close_rounded)),
      ],
    );
  }

  _toggleItemSelection(_AvatarFilterConfigurationItemUiData option, int index) {
    setState(() {
      final newOption = option.toggleSelection();
      _options[index] = newOption;
    });
  }
}
