import { ADJson } from '../constant/Constant';
import { ADClass } from '../model/modelclass/ADClass';
import { SPUtils } from '../utils/SPUtils';

export class IndexViewModel {
  /**
   * 获取广告数据
   */
  async getAD(): Promise<ADClass> {
    let adJson: string = await SPUtils.getValue(ADJson) as string
    if (adJson === '') {
      return null
      // return new Promise<ADClass>((resolve, reject) => {
      //   resolve(new ADClass({
      //     time: 10,
      //     imageUrl: 'https://pics0.baidu.com/feed/bd3eb13533fa828b411b549201b59039960a5ac4.jpeg@f_auto?token=aa8728a4a10f989bb2933b5bf4ac9edf',
      //     jumpUrl: 'https://www.baidu.com'
      //   }))
      // });
    } else {
      return new Promise<ADClass>((resolve, reject) => {
        resolve(new ADClass({
          time: 10,
          imageUrl: 'https://pics0.baidu.com/feed/bd3eb13533fa828b411b549201b59039960a5ac4.jpeg@f_auto?token=aa8728a4a10f989bb2933b5bf4ac9edf',
          jumpUrl: 'https://www.baidu.com'
        }))
      });

    }
  }


  /**
   * 校验本地存不存在广告
   * @returns
   */
  checkLocalHasAD(): boolean {
    return false;
  }
}