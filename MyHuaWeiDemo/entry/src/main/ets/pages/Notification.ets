//  创建通知

import notificationManager from '@ohos.notificationManager';
import image from '@ohos.multimedia.image';

@Entry
@Component
struct NotificationDemo {
  // 普通文本通知类型
  publishNotification() {
    let notificationRequest: notificationManager.NotificationRequest = {
      id: 1,
      slotType: notificationManager.SlotType.SERVICE_INFORMATION,
      content: {
        contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: {
          title: '通知内容标题',
          text: '通知内容详情',
          additionalText: '通知附加内容'
        }
      }
    }
    notificationManager.publish(notificationRequest).then(() => {
      console.info('publish success')
    }).catch((err) => {
      console.error(`publish failed,dcode:${err.code},message:${err.message}`)
    })
  }

  //  图片通知类型
  async publishPictureNotification() {
    let resourceManager = getContext(this).resourceManager;
    let imageArray = await resourceManager.getMediaContent($r('app.media.icon').id);
    let imageResource = image.createImageSource(imageArray.buffer);
    let pixelMap = await imageResource.createPixelMap();

    let notificationRequest: notificationManager.NotificationRequest = {
      id: 1,
      content: {
        contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_PICTURE,
        picture: {
          title: '图片内容标题',
          text: '通知内容',
          expandedTitle: '展开时的内容',
          briefText: '通知概要内容，对通知内容的总结',
          picture: pixelMap
        }
      }
    }

    notificationManager.publish(notificationRequest).then(() => {
      console.info('publish success')
    }).catch((err) => {
      console.error(`publish failed,dcode:${err.code},message:${err.message}`)
    })
  }


  // 进度条通知类型
  async publishRateNotification() {
    notificationManager.isSupportTemplate('downloadTemplate').then((data) => {
      console.info(`[ANS] is supportTemplate success`)
      let isSupportTpl: Boolean = data
      if (isSupportTpl) {
        // name 字段固定配置为 downloadTemplate
        let template = {
          name: 'downloadTemplate',
          data: {
            progressValue: 60,
            progressMaxValue: 100
          }
        }

        let notificationRequest = {
          id: 1,
          content: {
            contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: '文件下载：**.txt',
              text: 'senTemplate',
              additionalText: '60%'
            }
          },
          template: template
        }

        notificationManager.publish(notificationRequest).then(() => {
          console.info('publish success')
        }).catch((err) => {
          console.error(`publish failed,decode is:${err.code},message is ${err.message}`)
        })

      }
    }).catch((err) => {
      console.error(`[ANS] is supportTemplate faild,error[${err}]`)
    })
  }

  build() {
    Column() {
      Button('发送通知').onClick(() => {
        // this.publishNotification()
        this.publishPictureNotification()
      })
    }.width('100%')
  }
}