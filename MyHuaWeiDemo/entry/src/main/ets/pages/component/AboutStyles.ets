// @Styles 装饰器使用 定义组件重用样式  应用于静态页面的样式复用

// 全局
@Styles function testStyle() {
}

@Entry
@Component
struct UseStyle {
  @State heightNum: number = 100
  // 在组件内部使用可以省略function关键字
  // 组件内@Styles的优先级高于全局@Styles
  @Styles test(){
    .height(100).padding(10).backgroundColor(Color.Green)
  }
  // 定义在组件内的@Styles可以通过this访问组件的常量和状态变量，
  // 并可以在@Styles里通过事件来改变状态变量的值
  @Styles changeVal() {
    .height(this.heightNum)
    .backgroundColor(Color.Orange)
    .onClick(() => {
      this.heightNum = 200
    })
  }

  build() {
    Column({ space: 10 }) {
      Text('demo').test().fontSize(20)
      Divider()
      Text('demo2').changeVal().padding(10).fontSize(20)
    }
  }
}




