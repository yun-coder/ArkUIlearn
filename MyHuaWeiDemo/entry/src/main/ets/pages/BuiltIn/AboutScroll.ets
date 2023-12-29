// 布局 --  自适应延伸
// 1、在list中添加滚动条 2、使用scroll组件

@Entry
@Component
struct ScrollDemo {
  scroll: Scroller = new Scroller()
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

  build() {
    // 纵向
    // Scroll(this.scroll) {
    //   Column() {
    //     ForEach(this.arr, (item) => {
    //       Text(item.toString())
    //         .width('90%')
    //         .height(150)
    //         .backgroundColor(0xffffff)
    //         .borderRadius(15)
    //         .fontSize(16)
    //         .textAlign(TextAlign.Center)
    //         .margin({ top: 10 })
    //     })
    //   }.width('100%')
    // }
    // .backgroundColor(0xdcdcdc)
    // .scrollable(ScrollDirection.Vertical) // 设置滚动方向
    // .scrollBar(BarState.On) // 滚动条是否一直显示
    // .scrollBarColor(Color.Gray) // 滚动条颜色
    // .scrollBarWidth(10) // 滚动条宽度
    // .edgeEffect(EdgeEffect.Spring) // 边沿回弹

    // 横向
    Scroll(this.scroll) {
      Row() {
        ForEach(this.arr, item => {
          Text(item.toString())
            .height('90%')
            .width(150)
            .backgroundColor(0xffffff)
            .borderRadius(15)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .margin({ left: 10 })
        })
      }.height('100%')
    }
    .backgroundColor(0xdcdcdc)
    .scrollable(ScrollDirection.Horizontal)
    .scrollBar(BarState.On)
    .scrollBarColor(Color.Gray)
    .scrollBarWidth(10)
    .edgeEffect(EdgeEffect.Spring)
  }
}