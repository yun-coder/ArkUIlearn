// PersistentStorage：持久化存储UI状态
// 应用退出再次启动后，依然能保存选定的结果
// 持久化存储选定的AppStorage属性，以确保这些属性在应用程序重新启动时的值与应用程序关闭时的值相同

// 限制条件
// 简单类型，可以被JSON.stringify() 和 JSON.parse() 重构的对象

// 持久化数据是一个相对缓慢的操作，需要避免一下情况
// 持久化大型数据集 最好是小于2KB
// 持久化经常变化的变量

// 初始化
PersistentStorage.PersistProp('score',1)
// 从AppStorage中获取对应属性
AppStorage.Get('score')

@Entry
@Component
struct PersistentDemo {
  @State message:string = 'hi'
  @StorageLink('score') score:number=1
  build() {
    Column(){
      Text(this.message)
      Text(`${this.score}`)
        .onClick(()=>{
          // 应用退出时会保存当前值，重新启动后，会显示上一次保存的值
          this.score+=10
        })
    }
  }
}