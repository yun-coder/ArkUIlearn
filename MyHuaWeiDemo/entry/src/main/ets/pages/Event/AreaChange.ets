// 组件可见区域变化事件
// onVisibleAreaChange(ratios: Array<number>, event: (isVisible: boolean, currentRatio: number) => void)
// ratios：阈值数组


@Entry
@Component
struct AreaChangeDemo {
  scroller: Scroller = new Scroller()
  private arr: string[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
  @State testTextStr: string = 'test'
  @State testRowStr: string = 'test'

  build() {
    Column() {
      Column() {
        Text(this.testTextStr)
          .fontSize(20)
        Text(this.testRowStr)
          .fontSize(20)
      }.height(100)
      .backgroundColor(Color.Gray)
      .opacity(0.3)

      Scroll(this.scroller) {
        Column() {
          Text("test text visible change")
            .fontSize(20)
            .height(200)
            .margin({ top: 50, bottom: 20 })
            .backgroundColor(Color.Green)
            .onVisibleAreaChange([0.0, 1.0], (isVisible: boolean, currentRatio: number) => {
              console.info('test text isVisible:' + isVisible + ',currentRatio:' + currentRatio)
              if (currentRatio >= 1.0 && isVisible) {
                console.info('' + currentRatio)
                this.testTextStr = 'test text is fully visible'
              }
              if (currentRatio <= 0.0 && !isVisible) {
                console.info('' + currentRatio)
                this.testTextStr = 'test text is completely invisible'
              }
            })
          Row() {
            Text('test row visible change')
              .fontSize(20)
              .margin({ bottom: 20 })
          }.height(200)
          .backgroundColor(Color.Orange)
          .onVisibleAreaChange([0.0, 1.0], (isVisible: boolean, currentRatio: number) => {
            console.info('test row isVisible:' + isVisible + ',currentRatio:' + currentRatio)
            if (currentRatio >= 1.0 && isVisible) {
              console.info('' + currentRatio)
              this.testTextStr = 'test row is fully visible'
            }
            if (currentRatio <= 0.0 && !isVisible) {
              console.info('' + currentRatio)
              this.testTextStr = 'test row is completely invisible'
            }
          })

          ForEach(this.arr, (item) => {
            Text(item)
              .width('90%')
              .height(150)
              .backgroundColor(0xffffff)
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .margin({ top: 10 })
          })
        }.width('100%')
      }
      .backgroundColor(0x317aff)
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Grey)
      .scrollBarWidth(10)
      .onScroll((xOffset: number, yOffset: number) => {
        console.info(xOffset + ',' + yOffset)
      })
      .onScrollEdge((side: Edge) => {
        console.info('to the edge')
      })
      .onScrollEnd(() => {
        console.info('scroll end')
      })
    }.width('100%')
    .height('100%')
    .backgroundColor(0xdcdcdc)
  }
}