// 拖拽示例 手机模拟器查看效果


@Extend(Text) function textStyleA() {
  .width('25%')
  .height(40)
  .fontSize(16)
  .textAlign(TextAlign.Center)
  .backgroundColor(0xafeeee)
}


@Entry
@Component
struct DragExample {
  @State numStr: string[] = ['one', 'two', 'three', 'four', 'five', 'six']
  @State text: string = ''
  @State bool: boolean = true
  @State eventType: string = ''
  @State appleVisible: Visibility = Visibility.Visible
  @State orangeVisible: Visibility = Visibility.Visible
  @State bananaVisible: Visibility = Visibility.Visible
  @State fruitVisible: Visibility[] = [Visibility.Visible, Visibility.Visible, Visibility.Visible]
  @State idx: number = 0
  private dragList: string[] = ['apple', 'orange', 'banana']

  @Builder pixelMapBuilder() {
    Column() {
      Text(this.text)
        .width('50%')
        .height(60)
        .fontSize(16)
        .borderRadius(10)
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Red)
    }
  }

  build() {
    Column() {
      Text('there are three elements here')
        .fontSize(12)
        .fontColor(0xcccccc)
        .width('90%')
        .textAlign(TextAlign.Start)
        .margin(5)
      Row({ space: 15 }) {
        ForEach(this.dragList, (item, index) => {
          Text(item)
            .textStyleA()
            .visibility(this.fruitVisible[index])
            .onDragStart(() => {
              this.bool = true
              this.text = item
              this.fruitVisible[index] = Visibility.None
              return this.pixelMapBuilder()
            })
            .onTouch((event: TouchEvent) => {
              if (event.type === TouchType.Down) {
                this.eventType = 'Down'
                this.idx = index
              }
              if (event.type === TouchType.Up) {
                this.eventType = 'Up'
                if (this.bool) {
                  this.fruitVisible[index] = Visibility.Visible
                }
              }
            })
        })
      }.padding({ top: 10, bottom: 10 }).margin(10)

      Text('this is a List element')
        .fontSize(12)
        .fontColor(0xcccccc)
        .width('90%')
        .textAlign(TextAlign.Start)
        .margin(15)
      List({ space: 20 }) {
        ForEach(this.numStr, (item) => {
          ListItem() {
            Text(item)
              .width('100%')
              .height(80)
              .fontSize(16)
              .borderRadius(10)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xafeeee)
          }
        })
      }
      .editMode(true)
      .height('70%')
      .width('80%')
      .border({ width: 1 })
      .padding(15)
      .divider({
        strokeWidth: 2,
        color: 0xffffff,
        startMargin: 20,
        endMargin: 20
      })
      .onDragEnter((event: DragEvent, extraParams: string) => {
        console.log('list onDragEnter,' + extraParams + 'x:' + event.getX() + 'y:' + event.getY())
      })
      .onDragMove((event: DragEvent, extraParams: string) => {
        console.log('list onDragMove,' + extraParams + 'x:' + event.getX() + 'y:' + event.getY())
      })
      .onDragLeave((event: DragEvent, extraParams: string) => {
        console.log('list  onDragLeave,' + extraParams + 'x:' + event.getX() + 'y:' + event.getY())
      })
      .onDrop((event: DragEvent, extraParams: string) => {
        let jsonString = JSON.parse(extraParams)
        if (this.bool) {
          this.numStr.splice(jsonString.insertIndex, 0, this.text)
          this.bool = false
        }
        this.fruitVisible[this.idx] = Visibility.None
      })
    }.width('100%')
    .height('100%')
    .padding({ top: 20 })
    .margin({ top: 20 })
  }
}