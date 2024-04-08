export interface ILoginParams {
  /**
   * 登录账号
   */
  account: string;

  /**
   * 登录密码
   */
  password: string;
}

export class LoginParams implements ILoginParams {
  constructor(params: ILoginParams) {
    this.account = params.account
    this.password = params.password
  }

  account: string;
  password: string;
}
