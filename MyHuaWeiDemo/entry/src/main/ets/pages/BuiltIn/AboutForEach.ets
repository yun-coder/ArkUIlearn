// 循环渲染
// arr 数据源,为Array类型的数组
// itemGenerator  组件生成函数
// keyGenerator   键值生成函数 以下为默认的写法
// (item:any,index:number)=>{return index+'__'+JSON.stringify(item)}


@Builder
function textArea(width: number | Resource | string = '100%', height: number | Resource | string = '100%') {
  Row()
    .width(width)
    .height(height)
    .backgroundColor('#FFF2F3F4')
}

@Component
struct ArticleSkeletonView {
  build() {
    Row() {
      Column() {
        textArea(80, 80)
      }
      .margin({ right: 20 })

      Column() {
        textArea('60%', 20)
        textArea('50%', 20)
      }
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.SpaceAround)
      .height('100%')
    }
    .padding(20)
    .borderRadius(12)
    .backgroundColor('#FFECECEC')
    .height(120)
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
  }
}


@Entry
@Component
struct ForEachDemo {
  @State list: Array<number> = [1, 2, 2, 3]
  @State simpleList: Array<number> = [1, 2, 3, 4, 5];

  build() {
    Row() {
      Column() {
        ForEach(this.list, item => {
          Text(`${item}`).fontSize(30).margin(10)
        })
        Divider()
        // 指定 keyGenerator 会过滤出重复键
        ForEach(this.list, item => {
          Text(`${item}`).fontSize(30).margin(10)
        }, (item: string) => item)
      }

      // Column() {
      //   ForEach(this.simpleList, (item: string) => {
      //     ArticleSkeletonView()
      //       .margin({ top: 20 })
      //   }, (item: string) => item)
      // }
      // .padding(20)
      // .width('100%')
      // .height('100%')
    }
  }
}