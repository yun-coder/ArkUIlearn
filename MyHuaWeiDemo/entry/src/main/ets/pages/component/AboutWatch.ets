// @watch 用于监听状态变量的变化 严格相等 （===）
// $$ 运算符： 给内置组件提供TS变量的引用


@Component
struct CountView {
  @Prop @Watch('onCountUpdated') count: number
  @State total: number = 0

  // 回调方法
  // 这里存在2个同时增长的数值
  onCountUpdated(param: string): void {
    this.total += this.count
  }

  build() {
    Text(`Total: ${this.total}`)
      .fontSize(20)
  }
}


class Product {
  static nextId: number = 0
  public id: number
  public price: number

  constructor(price: number) {
    this.id = Product.nextId++
    this.price = price
  }
}


@Component
struct ProductItem {
  @Link @Watch('onProductUpdate') items: Product[]
  @State totalPrice: number = 0

  updateTotal(): number {
    let total = this.items.reduce((sum, i) =>
    sum + i.price, 0)
    if (total >= 100) {
      total = 0.9 * total
    }
    return total
  }

  onProductUpdate(param: string): void {
    this.totalPrice = this.updateTotal()
  }

  build() {
    Column({ space: 10 }) {
      ForEach(this.items, item => {
        Text(`price:${item.price.toFixed(2)} $`).margin(10).fontSize(20)
      })
      Text(`total:${this.totalPrice.toFixed(2)} $`).margin(10).fontSize(28)
    }
  }
}


// refreshing demo
@Component
struct RefreshExample {
  @State isRefreshing: boolean = false
  @State counter: number = 0

  build() {
    Column() {
      Text('pull down and isRefreshing:' + this.isRefreshing)
        .fontSize(30)
        .margin(10)
      // 内置刷新组件
      Refresh({ refreshing: $$this.isRefreshing, offset: 120, friction: 100 }) {
        Text('pull down and refresh:' + this.counter)
          .fontSize(30)
          .margin(10)
      }.onStateChange((refreshStatus: RefreshStatus) => {
        console.info('refresh onStateChange state is' + refreshStatus)
      })
    }
  }
}


@Entry
@Component
struct WatchModify {
  @State count: number = 0
  @State shopMark: Product[] = []

  build() {
    Column() {
      Button('add')
        .onClick(() => {
          this.count++
        }).margin({ bottom: 10 })
      CountView({ count: this.count })
      Divider()
      Button('add product')
        .onClick(() => {
          this.shopMark.push(new Product(Math.round(100 * Math.random())))
        }).margin(10)
      ProductItem({ items: $shopMark })
      Divider()
      RefreshExample()
    }
    .width('100%')
    .margin({ top: 100 })
  }
}