@Preview
@Component
export struct CardView {
  isText: boolean = false;
  @BuilderParam cardItem: () => void

  build() {
    Column() {
      if (this.cardItem) {
        this.cardItem()
      }
    }.width('100%').backgroundColor(Color.White)
    .borderRadius(8)
    .alignItems(HorizontalAlign.Start)
  }
}