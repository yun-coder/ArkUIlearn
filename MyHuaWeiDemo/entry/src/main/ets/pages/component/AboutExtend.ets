// @Extend 装饰器 定义扩展组件样式  应用于静态页面的样式复用
// 仅定义在全局，不支持定义在组件内部
// 支持封装指定的组件的私有属性和私有事件和预定义相同组件的@Extend的方法

@Extend(Text) function useText() {
  // fontColor Text的私有属性
  .fontColor(Color.Red)
}

// 支持参数传递
@Extend(Text) function superText(size: number) {
  // 可以调用预定义的 useText
  .fontSize(size)
  .useText()
}

// 装饰的方法的参数可以为 function 作为Event事件的句柄
@Extend(Text) function makeClick(onClick: () => void) {
  .fontColor(Color.Green)
  .onClick(onClick)
}

@Entry
@Component
struct ExtendDemo {
  @State label: string = '男刀'
  @State fontSizeVal: number = 20

  onClickHandler() {
    this.label = '刀妹'
  }

  build() {
    Column() {
      Row({ space: 20 }) {
        Text('亚索').superText(this.fontSizeVal).margin(10).onClick(()=>{
          // 可以为状态变量
          this.fontSizeVal = 30
        })
      }

      Row({ space: 20 }) {
        Text(`${this.label}`).superText(22).makeClick(this.onClickHandler.bind(this))
      }
    }
  }
}