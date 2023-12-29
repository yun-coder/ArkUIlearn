// List 创建列表
// List 包含 ListItem 和 ListItemGroup 两种子组件
// 默认是垂直方向，如果是水平滚动列表场景 将List的 listDirection属性设置为 Axis.Horizontal
// 自适应构建不同行数或者列数的列表 lanes(1) 或者  lanes({minLength:200,maxLength:300})
// sticky 吸顶或者吸底效果  StickyStyle.Header  StickyStyle.Footer
// 使用懒加载渲染列表时 List组件提供了 cachedCount 参数用于设置列表项缓存数只在LazyForEach有效
