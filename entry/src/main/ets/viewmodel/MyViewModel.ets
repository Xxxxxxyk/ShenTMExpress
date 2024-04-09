import { HttpUtils } from '../api/HttpUtils'
import { MyCarInfo } from '../model/Index';

export class MyViewModel {
  /**
   * 获取车辆信息
   */
  async getMyCarInfo() {
    let carInfo: MyCarInfo = await HttpUtils.get<MyCarInfo>('/driver/users/truck');
    return carInfo;
  }
}