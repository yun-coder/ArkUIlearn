// Flex 弹性布局
// direction 设置布局方向
// 主轴为水平方向 Row RowReverse
// 主轴为垂直方向 Column ColumnReverse
// 布局换行  FlexWrap
// 交叉轴方向  ItemAlign  Stretch(拉伸填充) Baseline(文本基线对齐)
// 子组件 alignSelf 属性可以覆盖Flex布局容器中的 alignItems 配置
// 内容对齐  alignContent - 通过 FlexAlign 设置

@Entry
@Component
struct FlexDemo {
  build() {
    Column() {
      Flex({ justifyContent: FlexAlign.SpaceBetween, wrap: FlexWrap.Wrap, alignContent: FlexAlign.SpaceAround }) {
        Text('1').width('30%').height(20).backgroundColor(0xf5deb3)
        Text('2').width('60%').height(20).backgroundColor(0xd2b48c)
        Text('3').width('40%').height(20).backgroundColor(0xd2b48c)
        Text('4').width('30%').height(20).backgroundColor(0xf5deb3)
        Text('5').width('20%').height(20).backgroundColor(0xd2b48c)
      }.width('90%').height(100).backgroundColor(0xafeeee)

      // 自适应拉伸
      Flex() {
        Text('flexBasis("auto")')
          .flexBasis('auto')
          .height(100)
          .backgroundColor(0xf5deb3)
        Text('flexBasis("auto")  width("40%")')
          .width('40%')
          .flexBasis('auto')
          .height(100)
          .backgroundColor(0xd2b48c)
        Text('flexBasis(100)')
          .fontSize(15)
          .flexBasis(100)
          .height(100)
          .backgroundColor(0xf5deb3)
        Text('flexBasis(100)')
          .fontSize(15)
          .flexBasis(100)
          .width(200)
          .height(100)
          .backgroundColor(0xd2b48c)
      }
      .width('90%')
      .height(120)
      .padding(10)
      .margin({ top: 10 })
      .backgroundColor(0xafeeee)

      // flexGrow 瓜分父组件的剩余空间
      Flex() {
        Text('flexGrow(2)')
          .flexGrow(2)
          .width(100)
          .height(100)
          .backgroundColor(0xf5deb3)

        Text('flexGrow(4)')
          .flexGrow(4)
          .width(100)
          .height(100)
          .backgroundColor(0xd2b48c)

        Text('flexGrow')
          .width(60)
          .height(100)
          .backgroundColor(0xf5deb3)
      }
      .width(300)
      .height(120)
      .padding(10)
      .margin({ top: 10 })
      .backgroundColor(0xafeeee)


      // flexShrink 父容器空间不足时，子组件的压缩比例
      Flex({direction:FlexDirection.Row}){
        Text('flexShrink(3)')
          .fontSize(15)
          .flexShrink(3)
          .width(200)
          .height(100)
          .backgroundColor(0xf5deb3)
        Text('no flexShrink')
          .width(200)
          .height(100)
          .backgroundColor(0xd2b48c)
        Text('flexShrink(2)')
          .flexShrink(2)
          .width(200)
          .height(100)
          .backgroundColor(0xf5deb3)
      }.width(300).height(120).padding(10).backgroundColor(0xafeeee)
      
    }
  }
}