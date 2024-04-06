import router from '@ohos.router'
import promptAction from '@ohos.promptAction'

@Entry
@Component
struct HomePage {
  build() {
    Column() {
      Text('这里是首页').fontSize(30)
    }.width('100%').height('100%')
  }

  onBackPress() {
    promptAction.showToast({ message: '回登录页' })
    router.back({
      url: 'pages/LoginPage'
    })
  }
}