package data.horizon.model;

public class ResultModel {
  /**
   * 提示信息
   * */
  private String Msg;
  /**
   * 错误代码 1代表成功
   * */
  private int Code;
  /**
   * 返回数据
   */
  private Object Data;
  /**
   * 操作提示，默认code=1,msg=操作成功
   */
  public ResultModel(){
    this.Msg="操作成功";
    this.Code=1;
    this.Data=null;
  }
  /**
   *
   * @param code 操作代码
   * @param msg 操作提示信息
   */
  public ResultModel(int code,String msg){
    this.Msg=msg;
    this.Code=code;
  }
  public ResultModel(int code,String msg,Object data){
    this.Msg=msg;
    this.Code=code;
    this.Data=data;
  }
  public String getMsg() {
    return Msg;
  }

  public void setMsg(String msg) {
    Msg = msg;
  }

  public int getCode() {
    return Code;
  }

  public void setCode(int code) {
    Code = code;
  }
  public Object getData() {
    return Data;
  }
  public void setData(Object data) {
    Data = data;
  }
}
