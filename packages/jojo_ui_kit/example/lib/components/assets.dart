import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Assets',
  type: Container,
  path: '[assets]/assets',
)
Widget assetsUseCase(BuildContext context) {
  return SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DefaultTextStyle(
              style: const TextStyle(color: Colors.black),
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: const EdgeInsets.all(Insets.l),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Insets.s)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Icons Navigation',
                              style: context.texts.title.base,
                            ),
                            const SizedBox(
                              height: Insets.l,
                            ),
                            Wrap(
                                spacing: Insets.l,
                                runSpacing: Insets.l,
                                children: [
                                  Column(
                                    children: [
                                      UiIcon(AssetsNew
                                          .icons.dsNavigationCross.path),
                                      SelectableText(
                                        'dsNavigationCross',
                                        style: context.texts.caption.caption,
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      UiIcon(
                                        AssetsNew.icons.dsNavigationBack.path,
                                      ),
                                      SelectableText(
                                        'dsNavigationBack',
                                        style: context.texts.caption.caption,
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      UiIcon(
                                        AssetsNew.icons.dsNavigationRight.path,
                                      ),
                                      SelectableText(
                                        'dsNavigationRight',
                                        style: context.texts.caption.caption,
                                      )
                                    ],
                                  ),
                                ])
                          ])),
                  const SizedBox(
                    height: Insets.l,
                  ),
                  Container(
                    padding: const EdgeInsets.all(Insets.l),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Insets.s)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Icons 24px',
                          style: context.texts.title.base,
                        ),
                        const SizedBox(
                          height: Insets.l,
                        ),
                        Wrap(
                          spacing: Insets.l,
                          runSpacing: Insets.l,
                          children: [
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsWeight.path),
                                SelectableText(
                                  'dsWeight',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsRuler.path),
                                SelectableText(
                                  'dsRuler',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsCoffeeCup.path),
                                SelectableText(
                                  'dsCoffeeCup',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsMarriage.path),
                                SelectableText(
                                  'dsMarriage',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsStudent.path),
                                SelectableText(
                                  'dsStudent',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsSmoke.path),
                                SelectableText(
                                  'dsSmoke',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsBody.path),
                                SelectableText(
                                  'dsBody',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsLang.path),
                                SelectableText(
                                  'dsLang',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsBaby.path),
                                SelectableText(
                                  'dsBaby',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsWork.path),
                                SelectableText(
                                  'dsWork',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsDollarSign.path),
                                SelectableText(
                                  'dsDollarSign',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsPray.path),
                                SelectableText(
                                  'dsPray',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsCovidLine.path),
                                SelectableText(
                                  'dsCovidLine',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsBar.path),
                                SelectableText(
                                  'dsBar',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsFood.path),
                                SelectableText(
                                  'dsFood',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsSportsTennis.path),
                                SelectableText(
                                  'dsSportsTennis',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsCloudyNight.path),
                                SelectableText(
                                  'dsCloudyNight',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsDog.path),
                                SelectableText(
                                  'dsDog',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsHeart.path),
                                SelectableText(
                                  'dsHeart',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsEyeOutline.path),
                                SelectableText(
                                  'dsEyeOutline',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsAddAPhoto.path),
                                SelectableText(
                                  'dsAddAPhoto',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsChat.path),
                                SelectableText(
                                  'dsChat',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsUser.path),
                                SelectableText(
                                  'dsUser',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsJojo.path),
                                SelectableText(
                                  'dsJojo',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsMenu.path),
                                SelectableText(
                                  'dsMenu',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsLock.path),
                                SelectableText(
                                  'dsLock',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsFlag.path),
                                SelectableText(
                                  'dsFlag',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsSearch.path),
                                SelectableText(
                                  'dsSearch',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsGift.path),
                                SelectableText(
                                  'dsGift',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsSettings.path),
                                SelectableText(
                                  'dsSettings',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsAnalytics.path),
                                SelectableText(
                                  'dsAnalytics',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsMandala.path),
                                SelectableText(
                                  'dsMandala',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsQuestion.path),
                                SelectableText(
                                  'dsQuestion',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsWallet.path),
                                SelectableText(
                                  'dsWallet',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsUserBlockBold.path),
                                SelectableText(
                                  'dsUserBlockBold',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsBlock.path),
                                SelectableText(
                                  'dsBlock',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsTrash.path),
                                SelectableText(
                                  'dsTrash',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsWarning.path),
                                SelectableText(
                                  'dsWarning',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsSettingsGear.path),
                                SelectableText(
                                  'dsSettingsGear',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsBellOff.path),
                                SelectableText(
                                  'dsBellOff',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsBell.path),
                                SelectableText(
                                  'dsBell',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsCamera.path),
                                SelectableText(
                                  'dsCamera',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsArrowUp.path),
                                SelectableText(
                                  'dsArrowUp',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsCheck.path),
                                SelectableText(
                                  'dsCheck',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsShare.path),
                                SelectableText(
                                  'dsShare',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsArrowDown.path),
                                SelectableText(
                                  'dsArrowDown',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsArrowUp1.path),
                                SelectableText(
                                  'dsArrowUp1',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsLogOut.path),
                                SelectableText(
                                  'dsLogOut',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsSnow.path),
                                SelectableText(
                                  'dsSnow',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsCrossSmall.path),
                                SelectableText(
                                  'dsCrossSmall',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsLanguage.path),
                                SelectableText(
                                  'dsLanguage',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                UiIcon(AssetsNew.icons.dsPause.path),
                                SelectableText(
                                  'dsPause',
                                  style: context.texts.caption.caption,
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: Insets.l,
                  ),
                  Container(
                      padding: const EdgeInsets.all(Insets.l),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Insets.s)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Icons 16px',
                              style: context.texts.title.base,
                            ),
                            const SizedBox(
                              height: Insets.l,
                            ),
                            Wrap(
                              spacing: Insets.l,
                              runSpacing: Insets.l,
                              children: [
                                Column(
                                  children: [
                                    UiIcon(AssetsNew.icons.dsMap.path),
                                    SelectableText(
                                      'dsMap',
                                      style: context.texts.caption.caption,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    UiIcon(AssetsNew.icons.dsHeart16px.path),
                                    SelectableText(
                                      'dsHeart16px',
                                      style: context.texts.caption.caption,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    UiIcon(
                                        AssetsNew.icons.dsHeartFill16px.path),
                                    SelectableText(
                                      'dsHeartFill16px',
                                      style: context.texts.caption.caption,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    UiIcon(AssetsNew.icons.dsLoading.path),
                                    SelectableText(
                                      'dsLoading',
                                      style: context.texts.caption.caption,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    UiIcon(AssetsNew.icons.dsCheckDouble.path),
                                    SelectableText(
                                      'dsCheckDouble',
                                      style: context.texts.caption.caption,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    UiIcon(AssetsNew.icons.dsCheckMono.path),
                                    SelectableText(
                                      'dsCheckMono',
                                      style: context.texts.caption.caption,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    UiIcon(AssetsNew.icons.dsBellX.path),
                                    SelectableText(
                                      'dsBellX',
                                      style: context.texts.caption.caption,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    UiIcon(AssetsNew.icons.editableMark.path),
                                    SelectableText(
                                      'editableMark',
                                      style: context.texts.caption.caption,
                                    )
                                  ],
                                )
                              ],
                            )
                          ])),
                  const SizedBox(
                    height: Insets.l,
                  ),
                  Container(
                      padding: const EdgeInsets.all(Insets.l),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Insets.s)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Logos',
                              style: context.texts.title.base,
                            ),
                            const SizedBox(
                              height: Insets.l,
                            ),
                            Wrap(
                              spacing: Insets.l,
                              runSpacing: Insets.l,
                              children: [
                                Column(
                                  children: [
                                    UiImage(
                                        AssetsNew.images.logos.googlePlay.path),
                                    SelectableText(
                                      'AssetsNew.images.logos.googlePlay.path',
                                      style: context.texts.caption.caption,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    UiImage(AssetsNew
                                        .images.logos.appleAppStore.path),
                                    SelectableText(
                                      'AssetsNew.images.logos.appleAppStore.path',
                                      style: context.texts.caption.caption,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    UiImage(AssetsNew.images.logos.lgbt.path),
                                    SelectableText(
                                      'AssetsNew.images.logos.lgbt.path',
                                      style: context.texts.caption.caption,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    UiImage(
                                        AssetsNew.images.logos.telegram.path),
                                    SelectableText(
                                      'AssetsNew.images.logos.telegram.path',
                                      style: context.texts.caption.caption,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    UiImage(AssetsNew.images.logos.jojo.path),
                                    SelectableText(
                                      'AssetsNew.images.logos.jojo.path',
                                      style: context.texts.caption.caption,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    UiImage(AssetsNew.images.logos.google.path),
                                    SelectableText(
                                      'AssetsNew.images.google.jojo.path',
                                      style: context.texts.caption.caption,
                                    )
                                  ],
                                ),
                              ],
                            )
                          ])),
                ],
              )))));
}
