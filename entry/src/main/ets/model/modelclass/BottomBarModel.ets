export class BottomBarModel {
  text: string = ''
  image: Resource = null
  select: boolean = false

  constructor(text: string, image: Resource, select: boolean) {
    this.text = text;
    this.image = image;
    this.select = select;
  }
}