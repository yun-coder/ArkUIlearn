// Environment 设备环境查询
// 应用场景：多语言，暗黑模式等

// 将设备运行的环境变量存入 AppStorage 中
Environment.EnvProp('languageCode','en')
// 设备环境到Component更新链: Environment->AppStorage->Component
let enable = AppStorage.Get('languageCode')
@Entry
@Component
struct EnvironmentDemo {
  @StorageProp('languageCode') languageCode:string='en'

  build() {
    Row(){
      Column(){
        Text(this.languageCode)
      }
    }
  }
}