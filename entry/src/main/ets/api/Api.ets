import { LoginParams } from '../model/params/LoginParams'
import { HttpUtils } from './HttpUtils'

export const login = (params: LoginParams) => {
  return HttpUtils.post<string>('/driver/login/account', params)
}
