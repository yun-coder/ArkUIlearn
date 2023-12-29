// RelativeContainer  相对布局
// 锚点 通过锚点设置当前元素基于哪个元素确定位置

@Entry
@Component
struct RelativeContainerDemo {
  build() {
    Row() {
      RelativeContainer() {
        // 1
        Row()
          .width(100)
          .height(100)
          .backgroundColor('#ff3333')
          .alignRules({
            top: { anchor: '__container__', align: VerticalAlign.Top },
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          })
          .id('row1')
        // 2
        Row() {
          Image($r('app.media.icon'))
        }
        .height(100)
        .width(100)
        .alignRules({
          top: { anchor: 'row1', align: VerticalAlign.Bottom },
          left: { anchor: 'row1', align: HorizontalAlign.Start }
        }).id('row2')
        // 3
        Row()
          .width(100)
          .height(100)
          .backgroundColor('#ffcc00')
          .alignRules({
            top: { anchor: 'row2', align: VerticalAlign.Top },
            right:{anchor:'row2',align:HorizontalAlign.Start}
          })
          .id('row3')
        // 4
        Row()
          .width(100)
          .height(100)
          .backgroundColor('#ff9966')
          .alignRules({
            top: { anchor: 'row2', align: VerticalAlign.Top },
            left: { anchor: 'row2', align: HorizontalAlign.End }
          })
          .id('row4')
        // 5
        Row()
          .width(100)
          .height(100)
          .backgroundColor('#ff66ff')
          .alignRules({
            top: { anchor: 'row2', align: VerticalAlign.Bottom },
            middle: { anchor: 'row2', align: HorizontalAlign.Center }
          })
          .id('row5')
      }.width(310)
      .height(300)
    }.height('100%')
  }
}