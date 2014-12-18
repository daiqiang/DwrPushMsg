<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  
    <base href="<%=basePath%>">  
    <title>DWR  DEMO</title>  
    <meta http-equiv="pragma" content="no-cache">  
    <meta http-equiv="cache-control" content="no-cache">  
    <meta http-equiv="expires" content="0">      
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">  
    <meta http-equiv="description" content="This is my page">  
  </head>  
  <script type='text/javascript' src='dwr/engine.js'></script>  
  <script type='text/javascript' src='dwr/util.js'></script>  
  <script type="text/javascript" src="dwr/interface/MessagePush.js"></script>  
  
  <script type="text/javascript">
    //通过该方法与后台交互，确保推送时能找到指定用户  
    //delete by daiq 发现这个onPageLoad函数是多余的
    //function onPageLoad(){
       //var userId = '${userId}';
       //MessagePush.onPageLoad(userId);
    //}  
    //推送信息  
    function showMessage(autoMessage){  
           alert(autoMessage);
    }  
  </script>  
  
  <!-- dwr.engine.setNotifyServerOnPageUnload(true);这个方法的功能就是在销毁或刷新页面时销毁当前ScriptSession，这样就保证了服务端获取的ScriptSession集合中没有无效的ScriptSession对象。 -->
  <!-- modified by daiq 发现这个onload函数是多余的  <body onload="onPageLoad();dwr.engine.setActiveReverseAjax(true);dwr.engine.setNotifyServerOnPageUnload(true);">   -->
  <body onload="dwr.engine.setActiveReverseAjax(true);dwr.engine.setNotifyServerOnPageUnload(true);">
    This is my DWR DEOM page. <hr>  
    <br>  
    <div id="DemoDiv">demo</div>  
  </body>  
</html>