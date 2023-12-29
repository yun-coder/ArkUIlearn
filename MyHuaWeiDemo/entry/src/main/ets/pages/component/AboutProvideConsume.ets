// @Provide(提供) @Consume(消费) 与后代组件双向同步
// 摆脱参数传递机制的限制，实现跨层级传递
// 一对多的关系，不允许在同一个组件内，包括其子组件中声明多个同名或者同名的@Provide装饰的变量
// alias 可以指定别名，如果指定了别名就必须通过别名来绑定变量

@Entry
@Component
struct FatherFunc {
  @Provide reviewNum: number = 0

  build() {
    Column({ space: 10 }) {
      Button(`self's reviewNum:${this.reviewNum}`).onClick(() => {
        this.reviewNum += 1
      })
      SonFunc()
    }
  }
}


@Component
struct SonFunc {
  build() {
    GrandSon()
  }
}


@Component
struct GrandSon {
  @Consume reviewNum: number

  build() {
    Column({ space: 10 }) {
      Text(`GrandSon reviewNum:${this.reviewNum}`).fontSize(20)
      Button(`change GrandSon's reviewNum +1`).onClick(() => {
        this.reviewNum += 1
      })
    }
  }
}