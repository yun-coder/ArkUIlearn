// AppStorage
// 特殊的单例LocalStorage对象，由UI框架在应用程序启动时创建，为应用程序UI状态属性提供中央存储
// @StorageProp
// @StorageLink

AppStorage.SetOrCreate('score', 100)
let localStorage = new LocalStorage({ 'score': 99 })

@Entry(localStorage)
@Component
struct AppStorageDemo {
  @StorageLink('score') storeLink1: number = 1
  @LocalStorageLink('score') localStoreLink1: number = 1

  build() {
    Column({ space: 10 }) {
      Text(`from AppStorage ${this.storeLink1}`)
        .onClick(() => {
          this.storeLink1 += 1
          // 起步是从 100+1
          console.info(this.storeLink1.toString())
        }).backgroundColor('#00fff0').padding(10)

      Text(`from LocalStorage ${this.localStoreLink1}`)
        .onClick(() => {
          // 起步是从 99+1
          this.localStoreLink1 += 1
          console.info(this.localStoreLink1.toString())
        }).backgroundColor('#00fff0').padding(10)

    }.width('100%')
  }
}