import { LoginParams } from '../model/params/LoginParams';
import { HttpUtils } from '../api/HttpUtils';
import promptAction from '@ohos.promptAction';
import { login } from '../api/Api';
import { SPUtils } from '../utils/SPUtils';
import { Token } from '../constant/Constant';
import router from '@ohos.router';

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
    let token: string = await login(params)
    AppStorage.SetOrCreate(Token, token)
    SPUtils.putValue(Token, token)
    router.replaceUrl({ url: 'pages/HomePage' })
  }
}