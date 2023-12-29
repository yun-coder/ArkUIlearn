// 像素单位转换

@Entry
@Component
struct PixelDemo {
  build() {
    Column(){
      Flex({wrap:FlexWrap.Wrap}){
        Column(){
          Text("width(220)")
            .width(220)
            .height(40)
            .backgroundColor(0xf9cf93)
            .textAlign(TextAlign.Center)
            .fontColor(Color.White)
            .fontSize('12vp')
        }.margin(5)

        Column(){
          Text("width(220px)")
            .width('220px')
            .height(40)
            .backgroundColor(0xf9cf93)
            .textAlign(TextAlign.Center)
            .fontColor(Color.White)
        }

        Column(){
          Text("width(220lpx) designWidth:720")
            .width('220lpx')
            .height(40)
            .backgroundColor(0xf9cf93)
            .textAlign(TextAlign.Center)
            .fontColor(Color.White)
            .fontSize('12vp')
        }.margin(5)

        Column(){
          Text("width(vp2px(220)+'px')")
            .width(vp2px(220)+'px')
            .height(40)
            .backgroundColor(0xf9cf93)
            .textAlign(TextAlign.Center)
            .fontColor(Color.White)
            .fontSize('12vp')
        }.margin(5)

        Column(){
          Text("fontSize('12fp')")
            .width(220)
            .height(40)
            .backgroundColor(0xf9cf93)
            .textAlign(TextAlign.Center)
            .fontColor(Color.White)
            .fontSize('12fp')
        }.margin(5)

        Column(){
          Text("width(px2vp(220))")
            .width(px2vp(220))
            .height(40)
            .backgroundColor(0xf9cf93)
            .textAlign(TextAlign.Center)
            .fontColor(Color.White)
            .fontSize('12fp')
        }.margin(5)
      }.width('100%')
    }
  }
}