//装饰器 @Prop 父子单向同步
// @Prop装饰的变量可以和父组件建立单向的同步关系。
// @Prop装饰的变量是可变的，但是变化不会同步回其父组件


// 限制条件
// @Prop 修饰复杂类型时是深拷贝，在拷贝的过程中除了基本类型、Map、Set、Date、Array 外都会丢失类型
// @Prop 装饰器不能在@Entry 装饰的自定义组件中使用
// 父组件传值不能为 undefined 和 null


@Entry
@Component
struct PropDemo {
  @State startValue: number = 10
  @State newArr: number[] = [1, 2, 3]

  build() {
    Column() {
      Text(`has ${this.startValue} times to click`)
      Button('times +1').onClick(() => {
        this.startValue += 1
      }).margin({
        top: 50,
        bottom: 50
      })
      Button('times -1').onClick(() => {
        this.startValue -= 1
      })
      ChildDemo({ count: this.startValue })
      Divider().height(5)
      // 数组
      subChild({ value: this.newArr[0] })
      subChild({ value: this.newArr[1] })
      subChild({ value: this.newArr[2] })
      Divider().height(5)
      ForEach(this.newArr, item => {
        subChild({ value: item.toString() }
        )
      })
      Divider().height(5)
      Button('replace entire arr').fontSize(30).onClick(() => {
        this.newArr = this.newArr[0] == 1 ? [3, 4, 5] : [1, 2, 3]
      })
    }.margin({
      top: 100
    }).width('100%').height('100%')
  }
}


@Component
struct ChildDemo {
  @Prop count: number

  build() {
    Text(this.count.toString()).fontSize(30).margin(20)
  }
}

@Component
struct subChild {
  @Prop value: number

  build() {
    Text(this.value.toString()).fontSize(30).margin(10).onClick(() => {
      this.value++
    })
  }
}