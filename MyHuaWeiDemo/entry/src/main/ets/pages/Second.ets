// 测试路由跳转页面
import router from '@ohos.router';

@Entry
@Component
struct Second {
  @State message: string = 'hi there'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button() {
          Text('Back')
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({ top: 20 })
        .backgroundColor('#0D9FFB')
        .width('40%')
        .height('5%')
        .onClick(()=>{
          try {
            router.back()
          }catch (err){
            console.info(`message:${err.message}`)
          }
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}