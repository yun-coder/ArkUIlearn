// stateStyles 多态样式
// stateStyles可以依据组件的内部状态的不同，快速设置不同样式
// 可以根据UI内部状态来设置样式，类似于css 伪类
// 4 种状态
// focused 获取聚焦状态
// normal  正常状态
// pressed 按压状态
// disabled 不可用状态

@Entry
@Component
struct diffStateStyles {
  @State focusedColor: Color = Color.Black
  normalColor: Color = Color.Green

  build() {
    Column() {
      Button('clickMe')
        .height(100)
        .width(200)
        .fontSize(20)
        .stateStyles({
          normal: {
            .backgroundColor(this.normalColor)
          },
          focused: {
            .backgroundColor(this.focusedColor)
          }
        })
        .onClick(() => {
          this.focusedColor = Color.Pink
        })
        .margin('20%')
    }
  }
}
