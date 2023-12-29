// 创建网格  Grid GridItem
// Grid 子组件必须是 GridItem 组件
// 在两个网格单元之间的网络横向间距称为行间距 columnsGap,  rowsGap网络纵向间距称为列间距
// columnsTemplate  设置网格布局列的数量
// rowsTemplate  设置网格布局行的数量

@Entry
@Component
struct GridDemo {
  @State numStr: string[] = ['1', '2', '3', '4', '5']
  scroller: Scroller = new Scroller()

  build() {
    Column({ space: 5 }) {
      Grid() {
        ForEach(this.numStr, rows => {
          ForEach(this.numStr, cols => {
            GridItem() {
              Text(cols)
                .fontSize(16)
                .backgroundColor(0xf9cf93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }
          })
        })
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .width('90%')
      .backgroundColor(0xfaeee0)
      .height(300)


      Text('scroll')
        .fontColor(0xcccccc)
        .fontSize(9)
        .width('90%')

      Grid(this.scroller) {
        ForEach(this.numStr, rows => {
          ForEach(this.numStr, cols => {
            GridItem() {
              Text(cols)
                .fontSize(16)
                .backgroundColor(0xf9cf93)
                .width('100%')
                .height(80)
                .textAlign(TextAlign.Center)
            }
          })
        })
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .onScrollIndex(i => {
        console.info(i.toString())
      })
      .width('90%')
      .backgroundColor(0xfaeee0)
      .height(300)

      Button('next page')
        .onClick(() => {
          this.scroller.scrollPage({ next: true })
        })
    }.width('100%').margin({ top: 5 })
  }
}