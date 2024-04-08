import router from '@ohos.router'

@Entry
@Component
struct LoginPage {
  /**
   * 当前的登录模式,是不是账号密码登录
   */
  @State currentLoginTypeIsPassword: boolean = false
  @State userNameplaceholder: string = '请输入手机号'
  @State passwordplaceholder: string = '请输入验证码'
  @State userNameErrorMessage: string = ''
  @State passwordErrorMessage: string = ''

  build() {
    Column() {
      Text('神TM快递')
        .fontSize(18)
        .margin({ top: 20 })
        .fontWeight(600)
        .width('100%')
        .textAlign(TextAlign.Center)

      Row() {
        Text(this.currentLoginTypeIsPassword ? '账号登录' : '手机号登录').fontSize(24)
        Text(!this.currentLoginTypeIsPassword ? '账号登录👉' : '手机号登录👉').fontSize(16).onClick(() => {
          this.currentLoginTypeIsPassword = !this.currentLoginTypeIsPassword
          if (this.currentLoginTypeIsPassword) {
            this.userNameplaceholder = '清输入账号'
            this.passwordplaceholder = '清输入密码'
          } else {
            this.userNameplaceholder = '请输入手机号'
            this.passwordplaceholder = '请输入验证码'
          }
        }).fontColor($r('app.color.primary'))
      }.width('100%').margin({ top: 50 }).justifyContent(FlexAlign.SpaceBetween)

      TextInput({ placeholder: this.userNameplaceholder })
        .textInputStyle(11, 55)
      Text(this.userNameErrorMessage).margin({ top: 13 }).fontColor($r('app.color.primary'))
        .visibility(this.userNameErrorMessage === '' ? Visibility.Hidden : Visibility.Visible)
      Stack({ alignContent: Alignment.End }) {
        TextInput({ placeholder: this.passwordplaceholder })
          .textInputStyle(4, 20, InputType.Number)
        Divider()
          .height(26)
          .width(10)
          .color($r('app.color.border'))
          .vertical(true)
          .margin({ right: 100, top: 15 })
          .visibility(this.currentLoginTypeIsPassword ? Visibility.None : Visibility.Visible)
        Text('获取验证码')
          .margin({ right: 15, top: 15 })
          .fontSize(14)
          .visibility(this.currentLoginTypeIsPassword ? Visibility.None : Visibility.Visible)
      }

      Text(this.passwordErrorMessage).margin({ top: 13 }).fontColor($r('app.color.primary'))
        .visibility(this.passwordErrorMessage === '' ? Visibility.Hidden : Visibility.Visible)

      Button('登录').width('100%').margin({ top: 20 }).height(50).backgroundColor($r('app.color.primary'))
    }.width('100%').height('100%').alignItems(HorizontalAlign.Start).padding({ left: 33, right: 33 })
  }
}

@Extend(TextInput)
function textInputStyle(maxLength: number, topMargin: number, inputType?: InputType) {
  .maxLength(maxLength)
  .type(inputType ?? InputType.Normal)
  .borderWidth({ bottom: 1 })
  .borderColor($r('app.color.primary'))
  .backgroundColor(Color.Transparent)
  .borderRadius(0)
  .padding({ left: 0 })
  .margin({ top: topMargin })
}