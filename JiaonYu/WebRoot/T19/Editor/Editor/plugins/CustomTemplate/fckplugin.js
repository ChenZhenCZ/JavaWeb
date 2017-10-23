/*
 * For FCKeditor 2.3
 * 
 * File Name: fckplugin.js
 * 	Add a toolbar button to insert media.
 * 
 * File Authors:
 * 		Madpolice (madpolice_dong@163.com) 20060726
 */

// Register the related commands.

var FCKCustomTable = function()
{
	this.EditMode = FCK.EditMode;
}

FCKCustomTable.prototype.Execute = function()
{
    doGet(FCKConfig.BasePath + "plugins/CustomTemplate/CustomTemplate.html", "");
}

FCKCustomTable.prototype.GetState = function()
{
	return FCK_TRISTATE_OFF ;
}


function InitAjax(){
    var ajax = false;
    try {
        ajax = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (e) {
        try {
            ajax = new ActiveXObject("Microsoft.XMLHTTP");
        } catch (E) {
            ajax = false;
        }
    }
    if (!ajax && typeof XMLHttpRequest != 'undefined') {
        ajax = new XMLHttpRequest();
    }
    
    return ajax;
}

function doGet(fileName,msgId){
    //如果没有把参数msgID传进来
    if (typeof(msgId) == 'undefined')　{
    　　return false;
    }
    //需要进行Ajax的URL地址
    var url = fileName + msgId;
    var gethtml = "";
    //实例化Ajax对象
    var ajax = InitAjax();
    //使用Get方式进行请求
    ajax.open("GET", url, true);
    
    //获取执行状态
    ajax.onreadystatechange = function() {
        //如果执行是状态正常，那么就把返回的内容赋值给上面指定的层
        if (ajax.readyState == 4 && ajax.status == 200) {
            FCK.InsertHtml(ajax.responseText);
        }
    }
    //发送空
    ajax.send(null);
}

FCKCommands.RegisterCommand( 'CustomTemplate', new FCKCustomTable() ) ;

// Create the "Media" toolbar button.
var oFindItem		= new FCKToolbarButton( 'CustomTemplate', FCKLang['CustomTemplate'] ) ;
oFindItem.IconPath	= FCKConfig.PluginsPath + 'CustomTemplate/CustomTemplate.gif' ;

FCKToolbarItems.RegisterItem( 'CustomTemplate', oFindItem ) ;			// 'CustomTemplate' is the name used in the Toolbar config.