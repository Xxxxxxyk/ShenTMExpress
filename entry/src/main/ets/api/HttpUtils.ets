/**
 * 网络类
 */
import http from '@ohos.net.http'
import { BaseUrl, Token } from '../constant/Constant'
import { BaseModel } from '../model/modelclass/BaseModel';
import { SPUtils } from '../utils/SPUtils';

let request = http.createHttp()

async function httpRequest<T>(requestMethod: http.RequestMethod, requestUrl: string, extraData?: Object, baseUrl?: string): Promise<T> {
  if (baseUrl === undefined) {
    baseUrl = BaseUrl;
  }
  requestUrl = baseUrl + requestUrl

  try {
    let token: string = AppStorage.Get<string>(Token)
    let result: http.HttpResponse = await request.request(requestUrl, { method: requestMethod, extraData: extraData
    , header: { 'Authorization': token } })
    console.log('message', result.result.toString());
    let data: BaseModel<T> = JSON.parse(result.result.toString()) as BaseModel<T>
    return data.data
  } catch (e) {
    console.log('message', e);
  }
}

export class HttpUtils {
  public static get<T>(requestUrl: string, extraData?: Object): Promise<T> {
    return httpRequest<T>(http.RequestMethod.GET, requestUrl, extraData)
  }

  public static post<T>(requestUrl: string, extraData?: Object): Promise<T> {
    return httpRequest<T>(http.RequestMethod.POST, requestUrl, extraData)
  }

  public static put<T>(requestUrl: string, extraData?: Object): Promise<T> {
    return httpRequest<T>(http.RequestMethod.PUT, requestUrl, extraData)
  }

  public static delete<T>(requestUrl: string, extraData?: Object): Promise<T> {
    return httpRequest<T>(http.RequestMethod.DELETE, requestUrl, extraData)
  }
}