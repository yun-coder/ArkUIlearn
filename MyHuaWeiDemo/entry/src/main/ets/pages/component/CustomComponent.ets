// 自定义组件
// 开发者谨慎使用bind改变函数调用的上下文，可能会使this指向混乱

// -----------全局自定义构建函数
// 全局的自定义构建函数可以被整个应用获取，不允许使用this和bind方法
// 如果不涉及组件状态变化，建议使用全局的自定义构建方法
// 自定义构建函数的参数传递有[ 按值传递 ]和[ 按引用传递 ]两种
// 不允许undefined、null和返回undefined、null的表达式
// ArkUI提供   $$    作为按引用传递参数的范式。
@Builder function MyGlobalBuilderFunction($$: { param1: string }) {
  Row() {
    Text(`useStateVarByRefrence: ${$$.param1}`)
  }.width('100%').height('100%')
}

@Builder function MyStaticFunction(param1: string) {
  Row() {
    Text(`useStateVarByValue: ${param1}`)
  }
}

@Builder function GlobalBuilderOne() {
}
//------------全局自定义构建函数 end----------------


// 只有被@Entry装饰的组件才可以调用页面的生命周期
@Entry
@Component
struct CustomComponents {
  @State showChild: boolean = true
  @State title: string = 'call me dade'
  label: string = 'fuck you'

  // 自定义构建函数
  // 允许在自定义组件内定义一个或多个@Builder方法，
  // 该方法被认为是该组件的私有、特殊类型的成员函数
  @Builder CustomComponents() {
  }
  // 组件生命周期
  aboutToAppear() {
    console.info('aboutToAppear')
  }

  build() {
    // 调用全局函数 引用传参  当使用状态变量的时候，推荐使用按引用传递
    // MyGlobalBuilderFunction({ param1: this.title })
    // 调用全局函数 传值
    // MyStaticFunction(this.label)

    Column() {
      if (this.showChild) {
        Child()
      }
      Button('create or delete').onClick(() => {
        this.showChild = !this.showChild
      })
    }.width('100%')
  }
  // 只有被@Entry装饰的组件才可以调用页面的生命周期
  onPageShow() {
    console.info('onPageShow')
  }
  // 只有被@Entry装饰的组件才可以调用页面的生命周期
  onPageHide() {
    console.info('onPageHide')
  }
  // 只有被@Entry装饰的组件才可以调用页面的生命周期
  onBackPress() {
    console.info('onBackPress')
  }
  // 组件生命周期 不要添加 async await,会导致自定义组件无法被垃圾回收
  aboutToDisappear() {
    console.info('aboutToDisappear')
  }
}


@Component
struct Child {
  @State title: string = 'hello there'
  // 装饰器 只能被自定义构建函数（@Builder装饰的方法）初始化
  @Builder doNothingBuilder() {
  }
  // @BuilderParam 装饰器用来指向@Builder方法的变量，
  // 在初始化自定义组件时对此属性进行赋值，为自定义的组件增加特定的功能
  @BuilderParam builder0: () => void = this.doNothingBuilder
  @BuilderParam builder1: () => void = GlobalBuilderOne
  // 组件生命周期
  aboutToAppear() {
    console.info('child start')
  }
  // 组件生命周期
  aboutToDisappear() {
    console.info('child end')
  }

  build() {
    Text(this.title).fontSize(30).onClick(() => {
      this.title = 'this is child'
      console.info(this.title)
    })
  }
}