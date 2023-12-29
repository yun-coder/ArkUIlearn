// 点击事件 onClick(event: (event?: ClickEvent) => void)
// 触摸事件 onTouch(event: (event?: TouchEvent) => void)
// 挂载卸载事件
// onAppear(event: () => void)
// onDisAppear(event: () => void)
// 按键事件 onKeyEvent(event: (event?: KeyEvent) => void)
// 焦点事件 组件在不可获焦状态下需要设置 focusable为true
// onFocus(event: () => void)
// onBlur(event:() => void)
// 鼠标事件
// onHover(event: (isHover?: boolean) => void)
// onMouse(event: (event?: MouseEvent) => void)
// 组件区域变化事件
// onAreaChange(event: (oldValue: Area, newValue: Area) => void)
// Area 返回目标元素的宽高以及目标元素相对父元素和页面左上角的坐标位置


import promptAction from "@ohos.promptAction"

@Entry
@Component
struct EventDemo {
  @State isShow: boolean = true
  @State changeAppear: string = '点击卸载挂载事件'
  private myText: string = 'text for onAppear'
  @State buttonColor: string = '#90ee90'
  @State sizeValue: string = 'default'

  build() {
    Column() {
      Button(this.changeAppear).onClick(() => {
        this.isShow = !this.isShow
      }).margin(15)
      if (this.isShow) {
        Text(this.myText)
          .fontSize(26)
          .fontWeight(FontWeight.Bold)
          .onAppear(() => {
            promptAction.showToast({
              message: 'this text is shown',
              duration: 2000
            })
          })
          .onDisAppear(() => {
            promptAction.showToast({
              message: 'this text is hidden',
              duration: 2000
            })
          })
      }
      Button('keyEvent')
        .focusable(true)
        .backgroundColor(this.buttonColor)
        .onKeyEvent((event: KeyEvent) => {
          console.info('event.keyCode:' + event.keyCode + ',event.keyType:' + event.type + ',event.keyText:' + event.keyText)
        })
        .onFocus(() => {
          this.buttonColor = '#ffc0cb'
        })
        .onBlur(() => {
          this.buttonColor = '#90ee90'
        })

      Text(this.sizeValue)
        .backgroundColor(Color.Green)
        .margin(30)
        .fontSize(20)
        .onClick(() => {
          this.sizeValue += ' add'
        })
        .onAreaChange((oldValue: Area, newValue: Area) => {
          console.info('oldValue:' + JSON.stringify(oldValue))
          console.info('newValue:' + JSON.stringify(newValue))
        })

    }.padding(30).width('100%')
  }
}