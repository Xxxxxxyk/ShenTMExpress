interface IADClass {
  imageUrl: string;
  time: number;
  jumpUrl: string;
}

export class ADClass implements IADClass {
  imageUrl: string = '';
  time: number = 0;
  jumpUrl: string = '';

  constructor(adClass?: IADClass) {
    this.imageUrl = adClass?.imageUrl ?? '';
    this.time = adClass?.time ?? 0;
    this.jumpUrl = adClass?.jumpUrl ?? '';
  }
}