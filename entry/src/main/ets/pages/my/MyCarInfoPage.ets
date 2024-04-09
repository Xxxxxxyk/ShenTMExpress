import { MyCarInfo } from '../../model/modelclass/MyCarInfo'
import { MyViewModel } from '../../viewmodel/Index'

@Entry
@Component
struct MyCarInfoPage {
  @State carInfo: MyCarInfo = null
  viewModel: MyViewModel = new MyViewModel()

  aboutToAppear() {
    this.getCarInfo();
  }

  async getCarInfo() {
    this.carInfo = await this.viewModel.getMyCarInfo()
  }

  build() {
    if (this.carInfo == null) {
      Column() {
        LoadingProgress().width(50).aspectRatio(1)
      }.width('100%').height('100%').backgroundColor($r('app.color.background_page'))
    } else {
      Column() {
        Image(this.carInfo.pictureList[1].url).width('100%')
          .borderRadius(8)
          .margin(15)

      }.width('100%').height('100%').backgroundColor($r('app.color.background_page'))
    }
  }
}