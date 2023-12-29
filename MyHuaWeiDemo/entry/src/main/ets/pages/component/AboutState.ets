// 观察变化和行为表现
// 当装饰的数据类型为【 boolean string number 】类型时，可以观察到数据中的变化
// 当装饰的数据类型为class或者Object时 Object.keys(observedObject)

class ClassA {
  public value: string

  constructor(value: string) {
    this.value = value
  }
}

class ClassB {
  public value: string
  public name: ClassA

  constructor(value: string, a: ClassA) {
    this.value = value
    this.name = a
  }
}

class ArrModel {
  public value: number

  constructor(value: number) {
    this.value = value
  }
}


@Entry
@Component
struct StateDemo {
  // @State 装饰的类型是Model
  @State title: ClassB = new ClassB('hello', new ClassA('Harmony'))
  // class 类型赋值
  // this.title = new ClassB('hi', new ClassA('ArkUI'))
  @State info:ArrModel[] = [new ArrModel(11),new ArrModel(1)]

  build() {
    Row() {
      Text(this.title.value)
        .fontSize(40)
        .onClick(() => {
          this.title.value = 'Hi'
          // 嵌套属性的赋值观察不到
          this.title.name.value = 'what?';
          console.info(this.title.name.value)
          // 数组自身的赋值可以观察到
          this.info = [new ArrModel(2)]
          // 数组项的赋值可以观察到
          this.info[0]=new ArrModel(10)
          // 删除数组项可以观察到
          this.info.pop();
          // 新增数字项可以观察到
          this.info.push(new ArrModel(100))
          console.info(JSON.stringify(this.info))
        })
    }
  }
}
