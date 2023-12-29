// LocalStorage  页面级UI状态存储

// AppStorage
// 特殊的单例LocalStorage对象，由UI框架在应用程序启动时创建，为应用程序UI状态属性提供中央存储
// @StorageProp
// @StorageLink

// PersistentStorage
// 持久化存储UI状态，通常和AppStorage配合使用，选择AppStorage存储的数据写入磁盘，以确保这些属性在
// 应用重新启动时的值与应用程序关闭时的值相同

// Environment
// 应用程序运行的设备的环境参数，环境参数会同步到AppStorage中，可以和AppStorage搭配使用

// 应用程序可以创建多个LocalStorage实例,LocalStorage实例可以在页面内共享
// 也可以通过GetShared接口，获取在UIAbility里创建的GetShared，实现跨页面、UIAbility内共享

// 被@Entry装饰的@Component，可以被分配一个LocalStorage实例
// 此组件的所有子组件实例将自动获得对该LocalStorage实例的访问权限

// 未被@Entry装饰的组件不可被独立分配LocalStorage实例
// 只能接受父组件通过@Entry传递来的LocalStorage实例

// LocalStorage中的所有属性都是可变的,当释放最后一个指向LocalStorage的引用时会被垃圾回收

// @LocalStorageProp 单向同步关系
// @LocalStorageLink 双向同步关系

// 限制条件
// 命名属性的类型不可更改。后续调用Set时必须使用相同类型的值
// 页面级存储，GetShared 接口仅能获取当前Stage通过 windowStage.loadContent传入的LocalStorage实例
// 否则返回 undefined


// 创建新实例并使用给定对象初始化
let storage = new LocalStorage({ 'age': 30 })

@Component
struct Sub1 {
  // 建立双向绑定
  @LocalStorageLink('age') storageLink2: number = 1

  build() {
    Button(`sub1 from LocalStorage ${this.storageLink2}`)
      .onClick(() => {
        this.storageLink2 += 1
        console.info(storage.get('age'))
      })
  }
}


@Component
struct Sub2{
  // 建立单向绑定
  @LocalStorageProp('age') storageLink3:number = 1
  build(){
    Button(`sub2 from LocalStorage ${this.storageLink3}`)
      .onClick(()=>{
        this.storageLink3+=1
        console.info(storage.get('age'))
      })
  }
}

// 使LocalStorage 可以被当前组件访问
@Entry(storage)
@Component
struct HomeStorage {
  @LocalStorageLink('age') storageLink1: number = 1

  build() {
    Column({ space: 10 }) {
      Button(`parent from LocalStorage ${this.storageLink1}`)
        .onClick(() => {
          this.storageLink1 += 1
          console.info(storage.get('age'))

          // 应用逻辑使用
          let propGet = storage.get('age')
          let link1 = storage.link('age')
          let prop = storage.prop('age')
          link1.set(40)
          prop.set(1)
          console.info('propGet==>',propGet.toString())
        })
      Sub1()
      Divider()
      Sub2()
    }
  }
}