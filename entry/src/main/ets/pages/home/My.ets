import { CardItem } from '../../widget/CardItem'
import { CardView } from '../../widget/CardView'
import router from '@ohos.router'

@Preview
@Component
export struct My {
  @Builder
  createCardItem() {
    CardItem({ menuText: '车辆信息', onItemClick: () => {
      router.pushUrl({ url:'pages/my/MyCarInfoPage' })
    } })
    CardItem({ menuText: '任务数据' })
    CardItem({ menuText: '系统设置', needLine: false })
  }

  build() {
    RelativeContainer() {
      Image($r('app.media.bg_page_my')).width('100%')
        .id('bg_img').alignRules({
        left: { anchor: '__container__', align: HorizontalAlign.Start },
        top: { anchor: '__container__', align: VerticalAlign.Top }
      })

      Column() {
        Image($r('app.media.ic_avatar_driver')).width(67).aspectRatio(1)
        Text('威震天').fontSize(18).fontColor(Color.White).margin({ top: 8 }).fontWeight(600)
        Text('司机编号：67409881').fontSize(14).fontColor(Color.White).margin({ top: 8 })
        Text('手机号：177 9998 8765').fontSize(14).fontColor(Color.White).margin({ top: 8 })
      }.width('100%').id('userPhoto').alignRules({
        middle: { anchor: 'bg_img', align: HorizontalAlign.Center },
        top: { anchor: 'bg_img', align: VerticalAlign.Top }
      }).margin({ top: 49 })

      Column() {
        Column() {
          Text('- 本月任务 -').fontSize(14).fontColor($r('app.color.text_secondary')).margin({ top: 15 })
          Row() {
            Column() {
              Text('18').fontColor(Color.Black).fontSize(18)
              Text('任务总量').fontColor(Color.Black).fontSize(12)
                .margin({ top: 13 })
            }.height('100%').justifyContent(FlexAlign.Center)
            .layoutWeight(1)

            Column() {
              Text('16').fontColor(Color.Black).fontSize(18)
              Text('完成任务量').fontColor(Color.Black).fontSize(12)
                .margin({ top: 13 })
            }.height('100%').layoutWeight(1).justifyContent(FlexAlign.Center)

            Column() {
              Text('3987').fontColor(Color.Black).fontSize(18)
              Text('运输里程(km)').fontColor(Color.Black).fontSize(12)
                .margin({ top: 13 })
            }.height('100%').layoutWeight(1).justifyContent(FlexAlign.Center)
          }.width('100%').layoutWeight(1).justifyContent(FlexAlign.SpaceAround)
        }.backgroundColor(Color.White)
        .width('100%')
        .height('100%')
        .borderRadius(8)
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .height(134)
      .id('mouth_task')
      .alignRules({
        left: { anchor: '__container__', align: HorizontalAlign.Start },
        top: { anchor: 'bg_img', align: VerticalAlign.Center }
      })
      .margin({ top: 70 })
      .padding({ left: 15, right: 15 })

      CardView({ cardItem: this.createCardItem }).id('menu_list').alignRules({
        left: { align: HorizontalAlign.Start, anchor: '__container__' },
        top: { align: VerticalAlign.Bottom, anchor: 'mouth_task' }
      }).padding({ left: 15, right: 15 }).margin({ top: 15 })

    }.backgroundColor($r('app.color.background_page')).width('100%').height('100%')
  }
}