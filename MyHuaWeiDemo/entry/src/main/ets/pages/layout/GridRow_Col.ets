// 栅格布局  GridRow
// xs [0,320]
// xm [320,520]
// md [520,840]
// lg [840,+∞]

@Entry
@Component
struct GridRowDemo {
  @State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown]

  build() {
    GridRow({
      gutter: { x: 20, y: 50 }, //间距
      breakpoints: {
        value: ['200vp', '300vp', '400vp', '500vp', '600vp'],
        reference: BreakpointsReference.WindowSize
      }
    }) {
      // GridCol span(占用列数) offset(偏移列数) order(元素序号)
      ForEach(this.bgColors, (item, index) => {
        GridCol({
          span: {
            xs: 2,
            sm: 3,
            md: 4,
            lg: 6,
            xl: 8,
            xxl: 12
          }
        }) {
          Row() {
            Text(`${index}`)
          }.width('100%').height('50vp')
        }.backgroundColor(item)
      })
    }
  }
}