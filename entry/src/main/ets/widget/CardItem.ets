@Preview
@Component
export struct CardItem {
  isText: boolean = false
  menuText: string = ''
  needLine: boolean = true
  onItemClick?: () => void

  build() {
    Column() {
      Row() {
        Text(this.menuText).fontSize(16).fontColor(Color.Black).margin({ left: 15 })
          .layoutWeight(1)
        Stack() {
          Image($r('app.media.ic_btn_more')).width(24).aspectRatio(1)
            .visibility(this.isText ? Visibility.None : Visibility.Visible)
          Text('更多').fontColor(Color.Black)
            .visibility(!this.isText ? Visibility.None : Visibility.Visible)
        }.margin({ right: 15 })

      }.height(59).width('100%')

      Divider().height(1).color($r('app.color.gray_3')).visibility(this.needLine ? Visibility.Visible : Visibility.None)
    }
    .onClick(() => {
      if (this.onItemClick) {
        this.onItemClick()
      }
    })
  }
}