// @Link 装饰器 父子双向同步
// 子组件中被@Link装饰的变量与其父组件中对应的数据源建立双向数据绑定
// 禁止本地初始化，只能在所属组件内访问

class GreenButtonState {
  width: number = 0

  constructor(width: number) {
    this.width = width
  }
}

@Component
struct GreenButton {
  @Link greenButtonState: GreenButtonState

  build() {
    Button('Green button')
      .width(this.greenButtonState.width)
      .height(80)
      .backgroundColor('#00ff00')
      .onClick(() => {
        if (this.greenButtonState.width < 400) {
          this.greenButtonState.width += 25
        } else {
          this.greenButtonState = new GreenButtonState(100)
        }
      })
  }
}

@Component
struct subLink {
  @Link yellowButtonState: number

  build() {
    Button('yellow button')
      .fontColor(Color.Black)
      .fontSize(20)
      .width(this.yellowButtonState)
      .height(80)
      .backgroundColor('#ffff00')
      .onClick(() => {
        // 子组件的简单类型可以同步回父组件
        this.yellowButtonState += 50
      })
  }
}


@Component
struct arrLink {
  @Link items: number[]

  build() {
    Column() {
      Button('push arr').onClick(() => {
        this.items.push(this.items.length + 1)
      })
      Button('update arr').onClick(() => {
        this.items = [10, 20, 30]
      })
    }
  }
}

@Entry
@Component
struct LinkDemo {
  @State yellowButtonProp: number = 200
  @State greenButtonProp: GreenButtonState = new GreenButtonState(300)
  @State arr: number[] = [1, 2, 3]

  build() {
    Column() {
      Button('parent set yellowButton').margin(10).fontSize(20).onClick(() => {
        this.yellowButtonProp = (this.yellowButtonProp < 400) ? this.yellowButtonProp + 100 : 100
      })

      Button('parent set greenButton').margin(10).fontSize(20).onClick(() => {
        this.greenButtonProp.width = (this.greenButtonProp.width < 400) ? this.greenButtonProp.width + 100 : 100
      })
      ForEach(this.arr, item => {
        Text(`${item}`).fontColor('#333')
      })
      subLink({ yellowButtonState: $yellowButtonProp })
      GreenButton({ greenButtonState: $greenButtonProp })
      arrLink({ items: $arr })
    }
  }
}