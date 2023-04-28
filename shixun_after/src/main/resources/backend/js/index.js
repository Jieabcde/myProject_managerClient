/* 自定义trim */
function trim (str) {  //删除左右两端的空格,自定义的trim()方法
  return str == undefined ? "" : str.replace(/(^\s*)|(\s*$)/g, "")
}

//获取url地址上面的参数
function requestUrlParam(argname){
  var url = location.href //获取完整的请求url路径
  var arrStr = url.substring(url.indexOf("?")+1).split("&") //表示从？后面开始截取  &为分隔符
  for(var i =0;i<arrStr.length;i++)
  {
      // 利用这种方式来只查找id参数
      var loc = arrStr[i].indexOf(argname+"=")
      if(loc!=-1){//  ！=-1 说明找到了   一般从员工页点过来肯定会找到
          return arrStr[i].replace(argname+"=","").replace("?","")
      }
  }
  return ""
}
