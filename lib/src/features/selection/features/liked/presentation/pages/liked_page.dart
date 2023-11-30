import 'package:anchor_scroll_controller/anchor_scroll_controller.dart';
import 'package:flutter/material.dart';
import 'package:jojo/src/core/utils/_utils.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage()
class LikedPage extends StatefulWidget {
  const LikedPage({
    super.key,
  });

  @override
  State<LikedPage> createState() => _LikedPageState();
}

class _LikedPageState extends State<LikedPage> {
  late final AnchorScrollController _scrollController;
  late final ScrollController _gridScrollController;
  int index = 0;
  bool isGridScroll = false;
  static const int _duration = 300;
  static const double _infoTextSize = 109;
  static const double _arrowUpContainerSize = 48;
  static const double _chipContainerSize = 56;

  Color appBarColor = Colors.transparent;
  double initialFontSize = 24;
  double fontSize = 24;

  @override
  void initState() {
    super.initState();

    _scrollController = AnchorScrollController();
    _gridScrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        initialFontSize = context.texts.headline.big.fontSize ?? 24;
        fontSize = initialFontSize;
      });
    });
  }

  void onScroll(double offset) {
    if (offset > 50) {
      if (appBarColor == context.colors.bg.secondary) {
        return;
      }

      setState(() {
        appBarColor = context.colors.bg.secondary
            .withOpacity(getDelta(offset.clamp(10, 50), from: 0.1));
        fontSize = getDelta(
          offset.clamp(10, 50),
          from: 30,
          to: 20,
        );
      });
    } else {
      setState(() {
        appBarColor = context.colors.bg.secondary
            .withOpacity(getDelta(offset.clamp(10, 50)));

        fontSize = getDelta(
          offset.clamp(10, 50),
          from: 30,
          to: 20,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikedCubit, LikedState>(
      builder: (context, state) {
        if (state.offers.isEmpty && state.status.isFetchingInProgress) {
          return const LikedLoadingScreen();
        }

        if (state.status.isFetchingFailure) {
          return Center(
            child: Column(
              children: [
                Text(state.error ?? ''),
              ],
            ),
          );
        }

        final newLikesMe = state.datingInfo.newLikesMe > 0
            ? '+${state.datingInfo.newLikesMe}'
            : '';

        final likesMe = state.datingInfo.likesMe > 0
            ? state.datingInfo.likesMe.toString()
            : '';

        return Scaffold(
          appBar: UiAppBar(
            useColor: true,
            backgroundColor: appBarColor,
            title: Text(
              LikedI18n.title,
              style: context.texts.headline.big.copyWith(
                fontSize: fontSize,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: Insets.l),
                child: Row(
                  children: [
                    if (newLikesMe.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(right: Insets.s),
                        child: BadgeLiked(
                          text: newLikesMe,
                          fontSize: Insets.m,
                          height: Insets.xl,
                          color: context.colors.content.success,
                        ),
                      ),
                    if (likesMe.isNotEmpty)
                      BadgeLiked(
                        text: likesMe,
                        fontSize: Insets.m,
                        height: Insets.xl,
                        gradient: context.colors.content.brandGradient,
                        padding: const EdgeInsets.symmetric(
                          horizontal: Insets.m,
                        ),
                        icon: UiIcon(
                          Assets.icons.iHeartFilled,
                          color: context.colors.content.inverse,
                          height: 15,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          body: Builder(
            builder: (context) {
              if (state.offers.isEmpty) {
                return Center(
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: Insets.xxl,
                            top: Insets.l,
                          ),
                          child: UiImage(
                            state.user.searcher.gender == SearcherGender.female
                                ? Assets.images.noSympathyForGirl
                                : Assets.images.noSympathyForMen,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: Insets.m),
                              child: Text(
                                LikedI18n.noLikes,
                                textAlign: TextAlign.center,
                                style: context.texts.headline.second,
                              ),
                            ),
                            Text(
                              LikedI18n.noLikesHint(
                                state.user.searcher.gender ==
                                    SearcherGender.female,
                              ),
                              textAlign: TextAlign.center,
                              style: context.texts.body.base,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }

              return Stack(
                children: [
                  NotificationListener(
                    onNotification: _onNotification,
                    child: CustomScrollView(
                      controller: _gridScrollController,
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        SliverAppBar(
                          expandedHeight: _infoTextSize,
                          flexibleSpace: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: Insets.xl,
                                  right: Insets.l,
                                  left: Insets.l,
                                  top: Insets.l,
                                ),
                                child: Text(
                                  LikedI18n.shownSympathy(
                                    state.user.searcher.gender ==
                                        SearcherGender.female,
                                  ),
                                  style: context.texts.body.base,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SliverPersistentHeader(
                          pinned: true,
                          delegate: SliverAppBarDelegate(
                            minHeight: _chipContainerSize,
                            maxHeight: _chipContainerSize,
                            child: AnimatedContainer(
                              color: isGridScroll
                                  ? context.colors.bg.secondary
                                  : context.colors.bg.primary,
                              duration: const Duration(milliseconds: _duration),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(bottom: Insets.l),
                                child: SizedBox(
                                  height: 36,
                                  child: ListView(
                                    controller: _scrollController,
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.only(
                                      left: Insets.l,
                                      right: Insets.l,
                                    ),
                                    children: Sort.values.map((e) {
                                      return AnchorItemWrapper(
                                        index: Sort.values.indexOf(e),
                                        controller: _scrollController,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 3,
                                          ),
                                          child: GestureDetector(
                                            onTap: () => _onPressedTag(
                                              Sort.values.indexOf(e),
                                            ),
                                            child: Chip(
                                              backgroundColor:
                                                  _getChipBackgroundColor(
                                                index,
                                                Sort.values.indexOf(e),
                                              ),
                                              padding: const EdgeInsets.all(
                                                Insets.xs,
                                              ),
                                              label: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: Insets.xs,
                                                ),
                                                child: Text(
                                                  LikedI18n.likedSortTypeTitle(
                                                    e,
                                                  ),
                                                  style: context.texts.body.base
                                                      .copyWith(
                                                    color: _getChipTextColor(
                                                      index,
                                                      Sort.values.indexOf(e),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (state.status.isFetchingInProgress)
                          SliverPersistentHeader(
                            pinned: true,
                            delegate: SliverAppBarDelegate(
                              minHeight: MediaQuery.of(context).size.height,
                              maxHeight: MediaQuery.of(context).size.height,
                              child: const LikedLoadingPhotoScreen(),
                            ),
                          ),
                        if (!state.status.isFetchingInProgress)
                          SliverPadding(
                            padding: const EdgeInsets.only(
                              left: Insets.l,
                              right: Insets.l,
                              bottom: Insets.bottomNavBar,
                            ),
                            sliver: SliverGrid.builder(
                              itemCount: state.offers.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: Insets.s,
                                crossAxisSpacing: Insets.s,
                                crossAxisCount: 2,
                                childAspectRatio: 344 / 496,
                              ),
                              itemBuilder: (context, index) {
                                final item = state.offers[index];

                                return GestureDetector(
                                  child: Stack(
                                    children: <Widget>[
                                      UiPhotoSlider(
                                        photos: item.candidate.photos
                                            .take(1)
                                            .toList(),
                                        padding: EdgeInsets.zero,
                                        emptyPhotosText:
                                            'ProfileI18n.emptyPhoto',
                                      ),
                                      if (!item.isNew)
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: Insets.m,
                                                top: Insets.m,
                                              ),
                                              child: BadgeLiked(
                                                text: LikedI18n.photoBadge,
                                                fontSize: 9,
                                                height: 15,
                                                color: context
                                                    .colors.content.success,
                                                border: Border.all(
                                                  color: context
                                                      .colors.content.inverse,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      Column(
                                        children: [
                                          Expanded(
                                            child: Container(),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: Insets.m,
                                              left: Insets.m,
                                              right: Insets.m,
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    '${item.candidate.name}, ${item.candidate.age}',
                                                    style: context
                                                        .texts.body.base
                                                        .copyWith(
                                                      color: context.colors
                                                          .content.inverse,
                                                    ),
                                                  ),
                                                ),
                                                UiIcon(
                                                  Assets
                                                      .icons.iParkSolidProtect,
                                                  useColor: false,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    context
                                        .read<LikedCubit>()
                                        .onPressedOffer(item.id);
                                  },
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                  Positioned.fill(
                    child: AnimatedOpacity(
                      opacity: isGridScroll ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: _duration),
                      child: GestureDetector(
                        onTap: _scrollTop,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: Insets.bottomNavBar,
                            right: Insets.l,
                          ),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: UIShadow(
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(137, 149, 164, 0.3),
                                  blurRadius: Insets.l,
                                ),
                              ],
                              child: Container(
                                height: _arrowUpContainerSize,
                                width: _arrowUpContainerSize,
                                decoration: BoxDecoration(
                                  color: context.colors.button.inverse,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(24),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: Insets.s,
                                  ),
                                  child: UiIcon(
                                    AssetsNew.icons.dsArrowUp1.path,
                                    color: context.colors.content.base,
                                    height: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Future<void> _onPressedTag(int newIndex) async {
    if (newIndex <= Sort.values.length && newIndex != index) {
      final sortBy = sortMap[Sort.values[index]] ?? '';
      if (sortBy.isNotEmpty) {
        setState(() {
          index = newIndex;
        });
        _scrollTo(index);

        await context.read<LikedCubit>().geOffersSortBy(sortBy: sortBy);
      }
    }
  }

  void _scrollTo(int index) {
    _scrollController.scrollToIndex(
      index: index,
      scrollSpeed: 10,
    );
  }

  void _scrollTop() {
    _gridScrollController.animateTo(
      0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: _duration),
    );
  }

  bool _onNotification(Object e) {
    if (e is ScrollUpdateNotification) {
      onScroll(e.metrics.pixels);
      if (e.metrics.pixels > _infoTextSize && !isGridScroll) {
        setState(() {
          isGridScroll = !isGridScroll;
        });
      }

      if (e.metrics.pixels < _infoTextSize && isGridScroll) {
        setState(() {
          isGridScroll = !isGridScroll;
        });
      }
    }
    return true;
  }

  Color _getChipBackgroundColor(
    int index,
    int sortValueOfIndex,
  ) =>
      index == sortValueOfIndex
          ? context.colors.bg.brand
          : context.colors.bg.chips;

  Color _getChipTextColor(
    int index,
    int sortValueOfIndex,
  ) =>
      index == sortValueOfIndex
          ? context.colors.text.constantWhite
          : context.colors.text.main;
}
