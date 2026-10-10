import { LengthUnit, window } from '@kit.ArkUI';
import { KeyboardAvoidMode } from '@kit.ArkUI';

@Entry
@ComponentV2
struct Index {

  private controller: SwiperController = new SwiperController()

  @Local currentIndex: number = 0

  @Local topRectHeight: number = 0

  @Local bottomRectHeight: number = 0

  @Local phone: string = ''

  @Local codeIndex: number = 0

  @Local code1: string = ''

  @Local code2: string = ''

  @Local code3: string = ''

  @Local code4: string = ''

  @Local code5: string = ''

  @Local code6: string = ''

  private timerId: number = -1

  onPageShow() {
    const context = this.getUIContext().getHostContext();
    if (context) {
      window.getLastWindow(context).then((win: window.Window) => {
        win.setWindowLayoutFullScreen(true).catch();
        try {
          let topArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
          this.topRectHeight = px2vp(topArea.topRect.height);
        } catch (error) {
          // TODO: Implement error handling.
        }
        try {
          let bottomArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR);
          this.bottomRectHeight = px2vp(bottomArea.bottomRect.height);
        } catch (error) {
          // TODO: Implement error handling.
        }
      }).catch();
    }
  }

  onPageHide() {
    const context = this.getUIContext().getHostContext();
    if (context) {
      window.getLastWindow(context).then((win: window.Window) => {

      }).catch();
    }
  }

  aboutToAppear(): void {
    this.getUIContext().setKeyboardAvoidMode(KeyboardAvoidMode.RESIZE);
  }


  build() {
    RelativeContainer() {
      Swiper(this.controller) {
        this.buildStepOne()

        this.buildStepTwo()

        this.buildStepThree()

        this.buildStepFour()

        this.buildStepFive()

        this.buildStepSix()

        this.buildStepSeven()
      }
      .indicator(false)
      .disableSwipe(true)
      .index($$this.currentIndex)
    }
    .height('100%')
    .width('100%')
  }


  @Builder
  buildStepOne() {
    Stack({
      alignContent: Alignment.Bottom
    }) {
      Video({
        src: $rawfile('video_demo.mp4'),
      })
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Cover)
        .autoPlay(true)
        .loop(true)
        .muted(true)
        .controls(false)
        .onPrepared(() => {

        })

      Column() {
        Row() {
          Text('The World\'s Most')
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .fontColor('#ffffff')
        }
        .justifyContent(FlexAlign.Start)
        .alignSelf(ItemAlign.Start)
        .margin({
          bottom: 6
        })

        Row() {
          Text() {
            Span('Experienced Driver')
              .fontSize(24)
            Span('TM')
              .fontSize(14)
              .baselineOffset({
                value: 9,
                unit: LengthUnit.VP
              })
          }
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffffff')
        }
        .justifyContent(FlexAlign.Start)
        .alignSelf(ItemAlign.Start)
        .padding({
          bottom: 48
        })

        Row() {
          Button('Continue')
            .height(52)
            .width('100%')
            .backgroundColor('#0072f3')
            .onClick((event: ClickEvent) => {
              this.controller.changeIndex(1, true)
            })
        }
        .padding({
          bottom: this.bottomRectHeight,
        })
      }
      .width('100%')
      .padding({
        left: 12,
        right: 12,
      })
    }
    .height('100%')
    .width('100%')
  }

  @Builder
  buildStepTwo() {
    Stack({
      alignContent: Alignment.Bottom
    }) {
      Scroll() {
        Column() {
          Row() {
            Text('Give permission to get the best experience')
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
              .fontColor('#000000')
          }
          .width('100%')
          .margin({
            bottom: 32
          })

          Row() {
            Text('The Waymo service works best with there permissions in place')
              .fontSize(14)
              .fontColor('#555861')
          }
          .width('100%')
          .margin({
            bottom: 32
          })

          Row() {
            Text('Allow location access')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor('#000000')
          }
          .width('100%')
          .margin({
            bottom: 6
          })

          Row() {
            Text('Automatically set your service area, pick-up spot and more (see Waymo\'s Privacy Policy for full details)')
              .fontSize(14)
              .fontColor('#555861')
          }
          .width('100%')
          .margin({
            bottom: 32
          })

          Row() {
            Text('Allow notifications')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor('#000000')
          }
          .width('100%')
          .margin({
            bottom: 6
          })

          Row() {
            Text('Get real-time updates on your trip, our service area and even special offers')
              .fontSize(14)
              .fontColor('#555861')
          }
          .width('100%')

        }
        .width('100%')
        .padding({
          top: this.topRectHeight + 48,
          bottom: this.bottomRectHeight + 52,
          left: 12,
          right: 12,
        })
      }
      .width('100%')
      .height('100%')
      .align(Alignment.TopStart)
      .scrollBar(BarState.Off)

      Column() {
        Row() {
          Button('Continue')
            .height(52)
            .width('100%')
            .backgroundColor('#0072f3')
            .onClick((event: ClickEvent) => {
              this.controller.changeIndex(2, true)
            })
        }
        .padding({
          bottom: this.bottomRectHeight,
        })
      }
      .width('100$')
      .padding({
        left: 12,
        right: 12,
      })
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#e9edf2')
  }

  @Builder
  buildStepThree() {
    Stack({
      alignContent: Alignment.Bottom
    }) {
      Scroll() {
        Column() {
          Row() {
            Text('Choose an account')
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
              .fontColor('#000000')
          }
          .width('100%')
          .margin({
            bottom: 32
          })

          Row() {
            Text('Select a Google Account to use with Waymo. we\'ll use your name, email address and profile picture.')
              .fontSize(14)
              .fontColor('#555861')
          }
          .width('100%')
          .margin({
            bottom: 32
          })

          Row() {
            Button() {
              Row() {
                Image($r('app.media.icon_google'))
                  .width(20)
                  .height(20)
                  .margin({
                    right: 12
                  })

                Text('Add an account')
                  .fontColor('#0072f3')
              }
            }
            .height(52)
            .width('100%')
            .backgroundColor('#FFFFFF')
            .onClick((event: ClickEvent) => {
              this.controller.changeIndex(3, true)
              this.startAutoJump()
            })
          }
          .width('100%')

        }
        .width('100%')
        .padding({
          top: this.topRectHeight + 48,
          bottom: this.bottomRectHeight + 52,
          left: 12,
          right: 12,
        })
      }
      .width('100%')
      .height('100%')
      .align(Alignment.TopStart)
      .scrollBar(BarState.Off)
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#e9edf2')
  }

  @Builder
  buildStepFour() {
    Column(){
      LoadingProgress()
        .color(Color.Black)
        .width(40)
        .height(40)
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor('#e9edf2')
  }

  @Builder
  buildStepFive() {
    Stack({
      alignContent: Alignment.Bottom
    }) {
      Scroll() {
        Column() {
          Row() {
            Text('Review and agree')
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
              .fontColor('#000000')
          }
          .width('100%')
          .margin({
            bottom: 32
          })

          Row() {
            Text('By choosing the button below, you agree to Waymo\'s Terms of Service, acknowledge that you\'ve read the Privacy Policy and confirm that you\'re at least 18 years old.')
              .fontSize(14)
              .fontColor('#555861')
          }
          .width('100%')
          .margin({
            bottom: 32
          })

          Row() {
            Text('You\'ll be riding in our autonomous vehicle. If your ride is taking place in California, our drivered and driverless autonomous vehicle passenger service is operated by Waymo pursuant to authority granted by the California Public Utilities Commission.')
              .fontSize(14)
              .fontColor('#555861')
          }
          .width('100%')
          .margin({
            bottom: 32
          })

        }
        .width('100%')
        .padding({
          top: this.topRectHeight + 48,
          bottom: this.bottomRectHeight + 52,
          left: 12,
          right: 12,
        })
      }
      .width('100%')
      .height('100%')
      .align(Alignment.TopStart)
      .scrollBar(BarState.Off)

      Column() {
        Row() {
          Button('I agree to all')
            .height(52)
            .width('100%')
            .backgroundColor('#0072f3')
            .onClick((event: ClickEvent) => {
              this.controller.changeIndex(5, true)
            })
        }
        .padding({
          bottom: this.bottomRectHeight,
        })
      }
      .width('100$')
      .padding({
        left: 12,
        right: 12,
      })
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#e9edf2')
  }

  @Builder
  buildStepSix() {
    Stack({
      alignContent: Alignment.Bottom
    }) {
      Scroll() {
        Column() {
          Row() {
            Button() {
              Image($r('app.media.icon_more'))
                .width(20)
                .height(20)
                .fillColor('#000000')
            }
            .backgroundColor(Color.Transparent)
            .height(36)
            .width(36)
            .onClick(() => {

            })
          }
          .width('100%')
          .margin({
            bottom: 16
          })
          .justifyContent(FlexAlign.End)

          Row() {
            Text('What\'s your')
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
              .fontColor('#000000')
          }
          .width('100%')

          Row() {
            Text('mobile number?')
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
              .fontColor('#000000')
          }
          .width('100%')
          .margin({
            bottom: 32
          })

          Row() {
            Text('We\'ll text you a code to confirm')
              .fontSize(14)
              .fontColor('#555861')
          }
          .width('100%')
          .margin({
            bottom: 32
          })

          Row() {
            Column({ space: 8 }) {
              Row() {
                Column() {
                  Column() {
                    Text('Phone number')
                      .fontSize(12)
                      .fontColor('#0072f3')
                      .width('100%')
                  }
                  .padding({
                    left: 16,
                    right: 16
                  })

                  TextInput({ placeholder: '', text: this.phone })
                    .type(InputType.PhoneNumber)
                    .maxLength(40)
                    .height(32)
                    .backgroundColor('#FFFFFF')
                    .onChange((value: string) => {
                      this.phone = value
                    })
                }
                .layoutWeight(1)

                if (this.phone) {
                  Button() {
                    Image($r('app.media.icon_close'))
                      .width(18)
                      .height(18)
                      .fillColor('#818184')
                  }
                  .backgroundColor(Color.Transparent)
                  .height(32)
                  .width(32)
                  .margin({
                    left: 6,
                    right: 6
                  })
                  .onClick(() => {
                    this.phone = ''
                  })
                }
              }
              .width('100%')
              .justifyContent(FlexAlign.SpaceBetween)
              .alignItems(VerticalAlign.Center)
            }
            .width('100%')
            .padding({
              top: 16,
              bottom: 16
            })
            .borderRadius(16)
            .backgroundColor('#FFFFFF')
          }
          .width('100%')

        }
        .width('100%')
        .padding({
          top: this.topRectHeight,
          bottom: this.bottomRectHeight + 52,
          left: 12,
          right: 12,
        })
      }
      .width('100%')
      .height('100%')
      .align(Alignment.TopStart)
      .scrollBar(BarState.Off)

      Column() {
        Row() {
          Button('Next')
            .height(52)
            .width('100%')
            .backgroundColor('#0072f3')
            .onClick((event: ClickEvent) => {
              this.controller.changeIndex(6, true)
            })
        }
        .padding({
          bottom: this.bottomRectHeight,
        })
      }
      .width('100$')
      .padding({
        left: 12,
        right: 12,
      })
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#e9edf2')
  }

  @Builder
  buildStepSeven() {
    Stack({
      alignContent: Alignment.Bottom
    }) {
      Scroll() {
        Column() {
          Row() {
            Button() {
              Image($r('app.media.icon_arrow_left'))
                .width(20)
                .height(20)
                .fillColor('#000000')
            }
            .backgroundColor(Color.Transparent)
            .height(36)
            .width(36)
            .onClick(() => {
              this.controller.showPrevious()
            })

            Button() {
              Image($r('app.media.icon_more'))
                .width(20)
                .height(20)
                .fillColor('#000000')
            }
            .backgroundColor(Color.Transparent)
            .height(36)
            .width(36)
            .onClick(() => {

            })
          }
          .width('100%')
          .margin({
            bottom: 16
          })
          .justifyContent(FlexAlign.SpaceBetween)


          Row() {
            Text('What\'s your code?')
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
              .fontColor('#000000')
          }
          .width('100%')
          .margin({
            bottom: 32
          })

          Row() {
            Text(`We sent it to ${this.phone}`)
              .fontSize(14)
              .fontColor('#555861')
          }
          .width('100%')
          .margin({
            bottom: 32
          })

          Grid() {
            GridItem() {
              TextInput({ placeholder: '', text: this.code1 })
                .id('code1_input')
                .type(InputType.PhoneNumber)
                .maxLength(1)
                .height(64)
                .fontWeight(FontWeight.Bold)
                .fontSize(18)
                .backgroundColor('#FFFFFF')
                .textAlign(TextAlign.Center)
                .onChange((value: string) => {
                  if (!value) {
                    this.code1 = ''
                    this.code2 = ''
                    this.code3 = ''
                    this.code4 = ''
                    this.code5 = ''
                    this.code6 = ''
                    this.codeIndex = 0
                    focusControl.requestFocus('code1_input');
                  } else {
                    this.code1 = value
                    this.codeIndex = 1
                    focusControl.requestFocus('code2_input');
                  }
                })
            }
            GridItem() {
              TextInput({ placeholder: '', text: this.code2 })
                .id('code2_input')
                .type(InputType.PhoneNumber)
                .maxLength(1)
                .height(64)
                .fontWeight(FontWeight.Bold)
                .fontSize(18)
                .backgroundColor(this.codeIndex >= 1 ? '#FFFFFF' : '#f4f6fa')
                .textAlign(TextAlign.Center)
                .onChange((value: string) => {
                  if (!value) {
                    this.code1 = ''
                    this.code2 = ''
                    this.code3 = ''
                    this.code4 = ''
                    this.code5 = ''
                    this.code6 = ''
                    this.codeIndex = 0
                    focusControl.requestFocus('code1_input');
                  } else {
                    this.code2 = value
                    this.codeIndex = 2
                    focusControl.requestFocus('code3_input');
                  }
                })
            }
            GridItem() { TextInput({ placeholder: '', text: this.code3 })
              .id('code3_input')
              .type(InputType.PhoneNumber)
              .maxLength(1)
              .height(64)
              .fontWeight(FontWeight.Bold)
              .fontSize(18)
              .backgroundColor(this.codeIndex >= 2 ? '#FFFFFF' : '#f4f6fa')
              .textAlign(TextAlign.Center)
              .onChange((value: string) => {
                if (!value) {
                  this.code1 = ''
                  this.code2 = ''
                  this.code3 = ''
                  this.code4 = ''
                  this.code5 = ''
                  this.code6 = ''
                  this.codeIndex = 0
                  focusControl.requestFocus('code1_input');
                } else {
                  this.code3 = value
                  this.codeIndex = 3
                  focusControl.requestFocus('code4_input');
                }
              }) }
            GridItem() {
              TextInput({ placeholder: '', text: this.code4 })
                .id('code4_input')
                .type(InputType.PhoneNumber)
                .maxLength(1)
                .height(64)
                .fontWeight(FontWeight.Bold)
                .fontSize(18)
                .backgroundColor(this.codeIndex >= 3 ? '#FFFFFF' : '#f4f6fa')
                .textAlign(TextAlign.Center)
                .onChange((value: string) => {
                  if (!value) {
                    this.code1 = ''
                    this.code2 = ''
                    this.code3 = ''
                    this.code4 = ''
                    this.code5 = ''
                    this.code6 = ''
                    this.codeIndex = 0
                    focusControl.requestFocus('code1_input');
                  } else {
                    this.code4 = value
                    this.codeIndex = 4
                    focusControl.requestFocus('code5_input');
                  }
                }) }
            GridItem() {
              TextInput({ placeholder: '', text: this.code5 })
                .id('code5_input')
                .type(InputType.PhoneNumber)
                .maxLength(1)
                .height(64)
                .fontWeight(FontWeight.Bold)
                .fontSize(18)
                .backgroundColor(this.codeIndex >= 4 ? '#FFFFFF' : '#f4f6fa')
                .textAlign(TextAlign.Center)
                .onChange((value: string) => {
                  if (!value) {
                    this.code1 = ''
                    this.code2 = ''
                    this.code3 = ''
                    this.code4 = ''
                    this.code5 = ''
                    this.code6 = ''
                    this.codeIndex = 0
                    focusControl.requestFocus('code1_input');
                  } else {
                    this.code5 = value
                    this.codeIndex = 5
                    focusControl.requestFocus('code6_input');
                  }
                })
            }
            GridItem() {
              TextInput({ placeholder: '', text: this.code6 })
                .id('code6_input')
                .type(InputType.PhoneNumber)
                .maxLength(1)
                .height(64)
                .fontWeight(FontWeight.Bold)
                .fontSize(18)
                .backgroundColor(this.codeIndex >= 5 ? '#FFFFFF' : '#f4f6fa')
                .textAlign(TextAlign.Center)
                .onChange((value: string) => {
                  if (!value) {
                    this.code1 = ''
                    this.code2 = ''
                    this.code3 = ''
                    this.code4 = ''
                    this.code5 = ''
                    this.code6 = ''
                    this.codeIndex = 0
                    focusControl.requestFocus('code1_input');
                  } else {
                    this.code6 = value
                    // TODO next logic
                  }
                })
            }
          }
          .width('100%')
          .columnsGap(12)
          .columnsTemplate('1fr 1fr 1fr 1fr 1fr 1fr')

        }
        .width('100%')
        .padding({
          top: this.topRectHeight,
          bottom: this.bottomRectHeight + 52,
          left: 12,
          right: 12,
        })
      }
      .width('100%')
      .height('100%')
      .align(Alignment.TopStart)
      .scrollBar(BarState.Off)
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#e9edf2')
  }

  private startAutoJump(): void {
    if (this.timerId !== -1) {
      clearTimeout(this.timerId)
    }
    this.timerId = setTimeout(() => {
      this.controller.showNext()
      this.timerId = -1
    }, 1500)
  }

}