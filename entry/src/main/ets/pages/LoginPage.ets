import router from '@ohos.router'

@Entry
@Component
struct LoginPage {
  build() {
    Column() {
      Text('这里是登录页').fontSize(30)
        .onClick(() => {
          router.replaceUrl({ url: 'pages/HomePage' })
        })
    }.width('100%').height('100%')
  }
}