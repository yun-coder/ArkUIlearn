// 媒体查询
// [media-type(媒体类型)][media-logic-operations(媒体逻辑操作)][media-feature（媒体特征）]
// 媒体逻辑操作符 and or not only

import mediaquery from '@ohos.mediaquery';

@Entry
@Component
struct MediaQueryDemo {
  // 当设备横屏时条件成立
  listener = mediaquery.matchMediaSync('(orientation:landscape)')
  // 当满足媒体查询条件时，触发回调
  onPortrait(mediaQueryResult){}

  build() {

  }
}