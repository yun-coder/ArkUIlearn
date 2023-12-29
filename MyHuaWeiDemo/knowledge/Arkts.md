# ArkTs 语法范式

- @Builder/@BuilderParam：特殊的封装UI描述的方法，细粒度的封装和复用UI描述。
- @Extend/@Style：扩展内置组件和封装属性样式，更灵活地组合内置组件。
- stateStyles：多态样式，可以依据组件的内部状态的不同，设置不同样式。
- # 不允许调用没有用@Builder装饰的方法
- # 不允许switch语法，如果需要使用条件判断，请使用if
- # 不允许使用[?:]表达式

# 状态

- @State：@State装饰的变量拥有其所属组件的状态，可以作为其子组件单向和双向同步的数据源。当其数值改变时，会引起相关组件的渲染刷新。
- @Prop：@Prop装饰的变量可以和父组件建立单向同步关系，@Prop装饰的变量是可变的，但修改不会同步回父组件。
- @Link：@Link装饰的变量和父组件构建双向同步关系的状态变量，父组件会接受来自@Link装饰的变量的修改的同步，父组件的更新也会同步给@Link装饰的变量。
- @Provide/@Consume：@Provide/@Consume装饰的变量用于跨组件层级（多层组件）同步状态变量，可以不需要通过参数命名机制传递，通过alias（别名）或者属性名绑定。
- @Observed：@Observed装饰class，需要观察多层嵌套场景的class需要被@Observed装饰。单独使用@Observed没有任何作用，需要和@ObjectLink、@Prop连用。
- @ObjectLink：@ObjectLink装饰的变量接收@Observed装饰的class的实例，应用于观察多层嵌套场景，和父组件的数据源构建双向同步。

- AppStorage是应用程序中的一个特殊的单例LocalStorage对象，
  是应用级的数据库，和进程绑定，通过@StorageProp和@StorageLink装饰器可以和组件联动

# 像素单位

- 框架采用vp为基准数据单位
- px 屏幕物理像素单位
- vp 在实际宽度为1440物理像素的屏幕上，1vp约等于3px。
- fp 字体像素，与vp类似适用屏幕密度变化，随系统字体大小设置变化。
- lpx 视窗逻辑像素单位，lpx单位为实际屏幕宽度与逻辑宽度（通过designWidth配置）的比值，
  - designWidth默认值为720。当designWidth为720时，
  - 在实际宽度为1440物理像素的屏幕上，1lpx为2px大小

# 像素单位转换

- vp2px
- px2vp
- fp2px
- px2fp
- lpx2px
- px2lpx

# 尺寸设置

- width
- height
- size 设置宽高尺寸 单位vp  size({width:'30%',height:'50'})
- padding
- margin
- layoutWeight 权重分配
- constraintSize {minWidth,maxWidth,minHeight,maxHeight} 约束尺寸

# 位置设置

- align  元素内容在元素绘制绘制区域内的对齐方式 Alignment.Center
- direction  direction(Direction.Ltr)
- position position({x:10,y:10})
- markAnchor 元素在位置定位时的锚点  markAnchor({ x: 25, y: 25 })
- offset  offset({ x: 15, y: 30 })
- alignRules 相对容器的对齐规则