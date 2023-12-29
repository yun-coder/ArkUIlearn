// 通用属性

@Entry
@Component
struct CommonProps {
  scroller: Scroller = new Scroller()

  build() {
    Column() {
      Scroll(this.scroller) {
        // 尺寸设置
        Column() {
          Text("width height padding margin size constrainSize")
            .width(120)
            .height(120)
            .padding(5)
            .margin(5)
            .backgroundColor('#f9cf93')
            .constraintSize({ minWidth: 100 })
            .size({ width: '100', height: '100' })
          // layoutWeight
          Row() {
            Text('layoutWeight(1)')
              .layoutWeight(1)
              .backgroundColor('#ffefd5')
              .size({ width: '30%', height: 100 })
            Text('layoutWeight(2)')
              .size({ width: '30%', height: 100 })
              .backgroundColor('#f5deb3')
              .layoutWeight(2)
            Text('no layoutWeight')
              .size({ width: '30%', height: 100 })
              .backgroundColor('#ffefd5')
          }.width('90%')

          // 位置设置 align
          Stack() {
            Text('top start')
          }
          .width('90%')
          .height(50)
          .margin({ top: 5 })
          .backgroundColor(0xffe4c4)
          .align(Alignment.TopStart)

          // direction 子元素从左到右排列
          Row() {
            Text('1').height(50).width('25%').fontSize(16).backgroundColor(0xf5deb3)
            Text('2').height(50).width('25%').fontSize(16).backgroundColor(0xd2b48c)
            Text('3').height(50).width('25%').fontSize(16).backgroundColor(0xf5deb3)
            Text('4').height(50).width('25%').fontSize(16).backgroundColor(0xd2b48c)
          }.width('90%').margin({ top: 5 }).direction(Direction.Ltr)
          // 子元素从右到左排列
          Row() {
            Text('1')
              .height(50)
              .width('25%')
              .fontSize(16)
              .backgroundColor(0xf5deb3)
              .textAlign(TextAlign.End)
            Text('2')
              .height(50)
              .width('25%')
              .fontSize(16)
              .backgroundColor(0xd2b48c)
              .textAlign(TextAlign.End)
            Text('3')
              .height(50)
              .width('25%')
              .fontSize(16)
              .backgroundColor(0xf5deb3)
              .textAlign(TextAlign.End)
            Text('4')
              .height(50)
              .width('25%')
              .fontSize(16)
              .backgroundColor(0xd2b48c)
              .textAlign(TextAlign.End)
          }.width('90%').margin({ top: 5 }).direction(Direction.Rtl)

          // position
          Text('position').fontSize(16).margin(5)
          Row() {
            Text('1').size({ width: '30%', height: '50' })
              .backgroundColor(0xdeb887)
              .border({ width: 1 }).fontSize(16)
            Text('2 position(30,10)')
              .size({ width: '60%', height: '30' })
              .backgroundColor(0xbbb2cb)
              .border({ width: 1 })
              .fontSize(16)
              .align(Alignment.Start)
              .position({ x: 30, y: 10 })
            Text('3').size({ width: '45%', height: '50' })
              .backgroundColor(0xdeb887).border({ width: 1 })
              .fontSize(16)
            Text('4 position(50% 70%)')
              .size({ width: '50%', height: '50' })
              .backgroundColor(0xbbb2cb)
              .border({ width: 1 })
              .fontSize(16)
              .position({ x: '50%', y: '70%' })
          }.width('90%').height(100)
          .border({ width: 1, style: BorderStyle.Dashed })
        }
      }
      .scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Grey)
      .scrollBarWidth(8)
      .edgeEffect(EdgeEffect.Spring)
    }.width('100%').height('100%')
  }
}