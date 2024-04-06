import preferences from '@ohos.data.preferences'
import { Token } from '../constant/Index'

export class SPUtils {
  private static getSP(): Promise<preferences.Preferences> {
    return preferences.getPreferences(getContext(), Token)
  }

  /**
   * 添加key
   * @param key sp的key
   * @param value sp的value
   */
  public static async putValue(key: string, value: number | string | boolean) {
    let sp: preferences.Preferences = await this.getSP()
    sp.put(key, value)
    sp.flush()
  }

  /**
   * 获取数据
   * @param key 数据的key
   * @returns 返回的数据
   */
  public static async getValue(key: string): Promise<preferences.ValueType> {
    let sp: preferences.Preferences = await this.getSP();
    return sp.get(key, '');
  }
}