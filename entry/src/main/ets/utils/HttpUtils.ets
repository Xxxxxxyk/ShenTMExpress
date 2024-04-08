/**
 * 网络类
 */
import http from '@ohos.net.http'
import { BaseUrl } from '../constant/Constant'
import { BaseModel } from '../model/modelclass/BaseModel';

let request = http.createHttp()

async function httpRequest<T>(requestMethod: http.RequestMethod, requestUrl: string, extraData?: Object, baseUrl?: string): Promise<T> {
  if (baseUrl === undefined) {
    baseUrl = BaseUrl;
  }
  requestUrl = baseUrl + requestUrl
  try {
    let result: http.HttpResponse = await request.request(requestUrl, { method: requestMethod, extraData: extraData })
    console.log('message', result.result.toString());
    let data: BaseModel<T> = JSON.parse(result.result.toString()) as BaseModel<T>
    return data.data
  } catch (e) {
    console.log('message', e);
  }
}

export class HttpUtils {
  public static async get<T>(requestUrl: string, extraData?: Object): Promise<T> {
    return await httpRequest<T>(http.RequestMethod.GET, requestUrl, extraData)
  }

  public static async post<T>(requestUrl: string, extraData?: Object): Promise<T> {
    return await httpRequest<T>(http.RequestMethod.POST, requestUrl, extraData)
  }

  public static async put<T>(requestUrl: string, extraData?: Object): Promise<T> {
    return await httpRequest<T>(http.RequestMethod.PUT, requestUrl, extraData)
  }

  public static async delete<T>(requestUrl: string, extraData?: Object): Promise<T> {
    return await httpRequest<T>(http.RequestMethod.DELETE, requestUrl, extraData)
  }
}