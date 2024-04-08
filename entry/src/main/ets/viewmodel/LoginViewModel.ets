import { LoginParams } from '../model/params/LoginParams';
import { HttpUtils } from '../utils/HttpUtils';
import promptAction from '@ohos.promptAction';

export class LoginViewModel {
  /***
   * 校验内容账号密码是不是空的
   */
  checkUserNameAndPassword(userName: string, password: string) {
    return userName !== '' && password !== '';
  }


  async login(userName: string, password: string) {
    let params: LoginParams = new LoginParams({
      account: userName,
      password: password
    });
    let token: string = await HttpUtils.post<string>('/driver/login/account', params)
    promptAction.showToast({ message: token })
  }
}