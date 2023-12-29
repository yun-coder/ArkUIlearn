// @Observed @ObjectLink  嵌套类对象属性变化
// 用于涉及嵌套对象或数组的场景中进行数据同步
// Observed(观察) 装饰的类可以观察到属性的变化
// 子组件中@ObjectLink 装饰的变量用于接收@Observed装饰的类的实例
// 单独使用@Observed是没有任何作用的，需要搭配@ObjectLink或者@Prop使用

// 限制条件
// 使用@Observed 装饰class会改变class原始的原型链，@Observed和其他类装饰器装饰同一个class可能会带来问题
// @ObjectLink 装饰器不能在 @Entry 装饰的自定义组件中使用
// @ObjectLink 允许装饰的数据属性赋值，不允许装饰的数据自身赋值

// 以下是嵌套类
@Observed
class ObDemoA {
  public a: number

  constructor(a: number) {
    this.a = a
  }
}

@Observed
class ObDemoB {
  public b: ObDemoA

  constructor(b: ObDemoA) {
    this.b = b
  }
}


@Component
struct ViewPartA {
  label: string = 'viewPartA'
  @ObjectLink part: ObDemoA

  build() {
    Row() {
      Button(`viewA [${this.label}] this.part.a=${this.part.a}+1`)
        .margin(10)
        .onClick(() => {
          this.part.a += 1
        })
    }.width('100%').justifyContent(FlexAlign.Center)
  }
}


// 对象数组
@Observed
class StringArray extends Array<string> {
}

@Component
struct ItemPage {
  @ObjectLink itemArr: StringArray

  build() {
    Row() {
      Text('itemPage').width(100).height(100)
      ForEach(this.itemArr, item => {
        Text(item).width(100).height(100)
      })
    }
  }
}


@Entry
@Component
struct ViewPartB {
  @State part: ObDemoB = new ObDemoB(new ObDemoA(0))
  @State arr: Array<StringArray> = [new StringArray(), new StringArray(), new StringArray()]

  build() {
    Column() {
      ViewPartA({ label: 'viewB #1', part: this.part.b })

      Button(`viewB this.part.b.a+1`).margin(10).onClick(() => {
        this.part.b.a += 1
      })
      Divider()
      Button(`viewB this.part.b=new ObDemoA(10)`).margin(10).onClick(() => {
        this.part.b = new ObDemoA(10)
      })
      Button(`viewB this.part=new ObDemoB(new ObDemoA(10))`).onClick(() => {
        this.part = new ObDemoB(new ObDemoA(10))
      })

      // 对象数组
      ItemPage({ itemArr: this.arr[0] })
      ItemPage({ itemArr: this.arr[1] })
      ItemPage({ itemArr: this.arr[2] })
      Divider()
      // ForEach(this.arr, itemArr => {
      //   ItemPage({ itemArr: itemArr })
      // })

      Button('update').onClick(() => {
        this.arr[0].push('Hello');
        this.arr[1].push('World');
        this.arr[2].push('!');
        console.info(this.arr.toString())
      })
    }
  }
}
