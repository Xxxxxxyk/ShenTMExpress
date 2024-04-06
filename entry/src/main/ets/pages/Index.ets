import { ADClass } from '../model/modelclass/ADClass';
import { IndexViewModel } from '../viewmodel/IndexViewModel';
import promptAction from '@ohos.promptAction';
import router from '@ohos.router';

@Entry
@Component
struct Index {
  @State defaultTime: number = 3;
  viewModel: IndexViewModel;
  adData: ADClass = new ADClass();
  @State imageUrl: string = ''
  timer: number = -1;

  aboutToAppear() {
    this.viewModel = new IndexViewModel()
    this.getAdData();
    this.timer = setInterval(() => {
      this.defaultTime--
      if (this.defaultTime == 0) {
        clearInterval(this.timer)
        router.pushUrl({ url: 'pages/LoginPage' })
        return
      }
    }, 1000)
  }

  build() {
    Stack({ alignContent: Alignment.TopEnd }) {
      Image(this.imageUrl === '' ? $r('app.media.start') : this.imageUrl)
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Contain)
      Text(this.defaultTime + '秒后跳过')
        .fontColor(Color.Black)
        .backgroundColor($r('app.color.background_page'))
        .margin({ top: 30, right: 20 })
        .padding(5)
        .borderRadius(10)
        .onClick(() => {
          clearInterval(this.timer)
          router.pushUrl({ url: 'pages/LoginPage' })
        })
    }.backgroundColor(Color.White).width('100%').height('100%')
  }

  async getAdData() {
    this.adData = await this.viewModel.getAD()
    if (this.adData) {
      this.defaultTime = this.adData.time
      this.imageUrl = this.adData.imageUrl
    }
  }
}
