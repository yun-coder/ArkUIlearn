// 拖拽示例 手机模拟器查看效果
// onDragStart(event: (event?: DragEvent, extraParams?: string) => CustomBuilder | DragItemInfo)
// onDragEnter(event: (event?: DragEvent, extraParams?: string) => void)
// onDragMove(event: (event?: DragEvent, extraParams?: string) => void)
// onDragLeave(event: (event?: DragEvent, extraParams?: string) => void)
// onDrop(event: (event?: DragEvent, extraParams?: string) => void)

// 可以监听到变化
@Observed
class BoxA {
  public name: string
  public bools: boolean

  constructor(name: string, bools: boolean) {
    this.name = name
    this.bools = bools
  }
}


@Extend(Text) function textStyle() {
  .width('25%')
  .height(40)
  .fontSize(16)
  .textAlign(TextAlign.Center)
  .backgroundColor(0xafeeee)
}

@Entry
@Component
struct DragDemo {
  @State arr: BoxA[] = [new BoxA('A', true), new BoxA('B', true), new BoxA('C', true)]
  @State dragIndex: number = 0

  changeIndex(index1: number, index2: number) {
    [this.arr[index1], this.arr[index2]] = [this.arr[index2], this.arr[index1]]
  }

  build() {
    Column() {
      Row({ space: 15 }) {
        List({ space: 20 }) {
          ForEach(this.arr, (item, index) => {
            ListItem() {
              Column() {
                subItem({ a: this.arr[index] })
              }
              .onTouch((event: TouchEvent) => {
                if (event.type === TouchType.Down) {
                  this.dragIndex = index
                  console.info('onTouch' + this.dragIndex)
                }
              })
            }
          })
        }
        .listDirection(Axis.Horizontal)
        .backgroundColor(0xf556655)
        .onDrop((event: DragEvent, extraParams: string) => {
          let jsonString = JSON.parse(extraParams)
          console.info(jsonString)
          this.changeIndex(this.dragIndex, jsonString.insertIndex)
        })
      }.padding({ top: 10, bottom: 10 })
      .margin(10)
    }.width('100%')
    .height('100%')
    .padding({ top: 20 })
    .margin({ top: 20 })
  }
}


@Component
struct subItem {
  @ObjectLink a: BoxA

  @Builder pixelMapBuilder() {
    Column() {
      Text(this.a.name)
        .width('50%')
        .height(60)
        .fontSize(16)
        .borderRadius(10)
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Black)
    }
  }

  build() {
    Column() {
      Text(this.a.name)
        .textStyle()
        .visibility(this.a.bools ? Visibility.Visible : Visibility.None)
        .onDragStart(() => {
          this.a.bools = false
          return this.pixelMapBuilder()
        })
        .onTouch((event: TouchEvent) => {
          if (event.type === TouchType.Up) {
            this.a.bools = true
          }
        })
      Text('')
        .width('25%')
        .height(40)
        .fontSize(16)
        .textAlign(TextAlign.Center)
        .border({ width: 5, color: 'green' })
        .visibility(!this.a.bools ? Visibility.Visible : Visibility.None)
    }
  }
}
