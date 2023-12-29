// 构建布局
// 线性布局 Row/Column
// 对子元素的约束
// 拉伸
//  flexGrow 基于父容器的剩余空间分配来控制组件拉伸
//  flexShrink  设置父容器的压缩尺寸来控制组件压缩
// 缩放 aspectRatio  宽高比  aspectRatio=width/height
// 占比
// 1、 将子组件的宽高设置为父组件宽高的百分比
// 2、layoutWeight 子元素自适应占满剩余空间
// 隐藏  通过 displayPriority 属性来控制页面的显示和隐藏

@Entry
@Component
struct layoutDemo {
  build() {
    // 垂直方向间距 20
    // Column({ space: 20 }) {
    //   Text('space: 20').fontSize(15).fontColor(Color.Gray).width('90%')
    //   Row().width('90%').height(50).backgroundColor(0xF5DEB3)
    //   Row().width('90%').height(50).backgroundColor(0xD2B48C)
    //   Row().width('90%').height(50).backgroundColor(0xF5DEB3)
    // }.width('100%')

    // 横向间距 35
    // Row({ space: 35 }) {
    //   Text('space: 35').fontSize(15).fontColor(Color.Gray)
    //   Row().width('10%').height(150).backgroundColor(0xF5DEB3)
    //   Row().width('10%').height(150).backgroundColor(0xD2B48C)
    //   Row().width('10%').height(150).backgroundColor(0xF5DEB3)
    // }.width('90%')

    // HorizontalAlign.Start（Center,End） 子元素在水平方向左对齐
    // HorizontalAlign.Center 子元素在水平方居中对齐
    // HorizontalAlign.End 子元素在水平方向右对齐
    // Column(){
    //   Column().width('80%').height(50).backgroundColor(0xf5deb3)
    //   Column().width('80%').height(50).backgroundColor(0xd2b48c)
    //   Column().width('80%').height(50).backgroundColor(0xf5deb3)
    // }.width('100%').alignItems(HorizontalAlign.Start).
    // backgroundColor('rgb(242,242,242)')

    // VerticalAlign.Top 子元素在垂直方向顶部对齐
    // VerticalAlign.Center 子元素在垂直方向居中对齐
    // VerticalAlign.Bottom 子元素在垂直方向底部对齐
    // Row(){
    //   Column().width('20%').height(30).backgroundColor(0xf5deb3)
    //   Column().width('20%').height(30).backgroundColor(0xd2b48c)
    //   Column().width('20%').height(30).backgroundColor(0xf5deb3)
    // }.width('100%').height(200)
    // .alignItems(VerticalAlign.Top)
    // .backgroundColor('rgb(242,242,242)')

    // 子元素在垂直方向上的排列
    // FlexAlign.Start
    // FlexAlign.Center
    // FlexAlign.End
    // FlexAlign.SpaceAround 相邻元素之间距离相同。第一个元素到行首的距离和最后一个元素到行尾的距离是相邻元素之间距离的一半。
    // FlexAlign.SpaceBetween 相邻元素之间距离相同。第一个元素与行首对齐，最后一个元素与行尾对齐。
    // FlexAlign.SpaceEvenly 相邻元素之间的距离、第一个元素与行首的间距、最后一个元素到行尾的间距都完全一样。
    // Column(){
    //   Column().width('80%').height(50).backgroundColor(0xf5deb3)
    //   Column().width('80%').height(50).backgroundColor(0xd2b48c)
    //   Column().width('80%').height(50).backgroundColor(0xf5deb3)
    // }.width('100%').height(300)
    // .backgroundColor('rgb(242,242,242)')
    // .justifyContent(FlexAlign.SpaceEvenly)

    // 自适应拉伸
    // 常用空白填充组件 Blank
    // Column() {
    //   Row() {
    //     Text('Bluetooth').fontSize(20)
    //     Blank()
    //     Toggle({ type: ToggleType.Switch, isOn: true })
    //   }.backgroundColor(0xffffff).borderRadius(15).padding({ left: 12 }).width('100%')
    // }.backgroundColor(0xefefef).padding(20).width('100%')


    // 自适应缩放
    // 1、layoutWeight
    // Column(){
    //   Text('1:2:3').width('100%')
    //   Row(){
    //     Column(){
    //       Text('layoutWeight-1').textAlign(TextAlign.Center)
    //     }.layoutWeight(1).backgroundColor(0xf5deb3).height('10%')
    //     Column(){
    //       Text('layoutWeight-2').textAlign(TextAlign.Center)
    //     }.layoutWeight(2).backgroundColor(0xd2b48c).height('10%')
    //     Column(){
    //       Text('layoutWeight-3').textAlign(TextAlign.Center)
    //     }.layoutWeight(3).backgroundColor(0xf5deb3).height('10%')
    //   }
    // }
    // 2、使用百分比设置子组件
    Column(){
      Row(){
        Column(){
          Text('left width 20%').textAlign(TextAlign.Center)
        }.width('20%').backgroundColor(0xf5deb3).height('10%')
        Column(){
          Text('center width 50%').textAlign(TextAlign.Center)
        }.width('50%').backgroundColor(0xd2b48c).height('10%')
        Column(){
          Text('right width 30%').textAlign(TextAlign.Center)
        }.width('30%').backgroundColor(0xf5deb3).height('10%')
      }
    }

  }
}