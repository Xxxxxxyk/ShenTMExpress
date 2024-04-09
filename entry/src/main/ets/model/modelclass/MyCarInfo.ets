export interface IMyCarInfo {
  /**
   * 载重
   */
  allowableLoad: string;

  /**
   * 所属机构名称
   */
  currentOrganName: string;

  /**
   * 车辆编号
   */
  id: string;

  /**
   * 车牌号码
   */
  licensePlate: string;

  /**
   * 图片
   */
  pictureList: PictureList[];

  /**
   * 车辆类型名称
   */
  truckType: string;
}

export interface PictureList {
  /**
   * 图片url
   */
  url: string;
}

export class MyCarInfo implements IMyCarInfo {
  allowableLoad: string;
  currentOrganName: string;
  id: string;
  licensePlate: string;
  pictureList: PictureList[];
  truckType: string;

  constructor(car: IMyCarInfo) {
    this.allowableLoad = car.allowableLoad
    this.currentOrganName = car.currentOrganName
    this.id = car.id
    this.licensePlate = car.licensePlate
    this.pictureList = car.pictureList
    this.truckType = car.truckType
  }

  toString(): string {
    return `this.allowableLoad=${this.allowableLoad} currentOrganName=${this.currentOrganName}
       this.id=${this.id} this.licensePlate=${this.licensePlate} this.pictureList=${this.pictureList} this.truckType${this.truckType}`
  }
}
