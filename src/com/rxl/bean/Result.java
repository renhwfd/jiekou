package com.rxl.bean;

public class Result {
	//  "666666" 成功 ，其他均为失败
	private String code;
	// 失败信息，成功时不返回
	private String error;
	//数据
	private Object data;
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	public Result(String code, String error){
		this.code = code;
		this.error = error;
	}
	public static Result getSuccessResult(){
		return new Result("666666",null);
	}
	public static Result getErrorResult(){
		return new Result("-1","数据异常");
	}
}
