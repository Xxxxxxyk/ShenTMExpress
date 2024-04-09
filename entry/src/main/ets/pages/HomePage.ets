import router from '@ohos.router'
import promptAction from '@ohos.promptAction'
import { BottomBarModel } from '../model/modelclass/BottomBarModel'
import { My } from './home/My';

@Entry
@Component
struct HomePage {
  @State currentSelect: number = 0;
  barlist: Array<BottomBarModel> = [
    new BottomBarModel('任务', $r('app.media.ic_tab_btn_task'), true),
    new BottomBarModel('消息', $r('app.media.ic_tab_btn_mess_nor'), false),
    new BottomBarModel('我的', $r('app.media.ic_tab_btn_mine_nor'), false)
  ]

  @Builder
  tabBarStyle(item: BottomBarModel, index: number) {
    Column() {
      Image(item.image).width(20).height(20).fillColor(
        this.currentSelect == index ? $r('app.color.primary') : $r('app.color.gray_8')
      )
      Text(item.text).margin({ top: 3 })
    }.justifyContent(FlexAlign.Center).alignItems(HorizontalAlign.Center)
  }

  build() {
    Tabs({ barPosition: BarPosition.End }) {
      ForEach(this.barlist, (item: BottomBarModel, index: number) => {
        TabContent() {
          if (index == 0) {

          } else if (index == 1) {

          } else {
              My()
          }
        }.tabBar(this.tabBarStyle(item, index)).backgroundColor(Color.White)
      })
    }.scrollable(false).onChange((index: number) => {
      this.currentSelect = index
    })
  }
}