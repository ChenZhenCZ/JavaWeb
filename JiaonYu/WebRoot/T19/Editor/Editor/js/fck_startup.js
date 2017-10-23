﻿/*
 * FCKeditor - The text editor for internet
 * Copyright (C) 2003-2004 Frederico Caldeira Knabben
 * 
 * Licensed under the terms of the GNU Lesser General Public License:
 * 		http://www.opensource.org/licenses/lgpl-license.php
 * 
 * For further information visit:
 * 		http://www.fckeditor.net/
 * 
 * This file has been compacted for best loading performance.
 */
var NS;if (!(NS=window.parent.__FCKeditorNS)) NS=window.parent.__FCKeditorNS=new Object();
Array.prototype.addItem=function(item){var i=this.length;this[i]=item;return i;};Array.prototype.indexOf=function(value){for (var i=0;i<this.length;i++){if (this[i]==value) return i;};return-1;};String.prototype.startsWith=function(value){return (this.substr(0,value.length)==value);};String.prototype.endsWith=function(value,ignoreCase){var L1=this.length;var L2=value.length;if (L2>L1) return false;if (ignoreCase){var oRegex=new RegExp(value+'$','i');return oRegex.test(this);}else return (L2==0||this.substr(L1-L2,L2)==value);};String.prototype.remove=function(start,length){var s='';if (start>0) s=this.substring(0,start);if (start+length<this.length) s+=this.substring(start+length,this.length);return s;};String.prototype.trim=function(){return this.replace(/(^\s*)|(\s*$)/g,'');};String.prototype.ltrim=function(){return this.replace(/^\s*/g,'');};String.prototype.rtrim=function(){return this.replace(/\s*$/g,'');};String.prototype.replaceNewLineChars=function(replacement){return this.replace(/\n/g,replacement);};
FCK_STATUS_NOTLOADED=window.parent.FCK_STATUS_NOTLOADED=0;FCK_STATUS_ACTIVE=window.parent.FCK_STATUS_ACTIVE=1;FCK_STATUS_COMPLETE=window.parent.FCK_STATUS_COMPLETE=2;FCK_TRISTATE_OFF=window.parent.FCK_TRISTATE_OFF=0;FCK_TRISTATE_ON=window.parent.FCK_TRISTATE_ON=1;FCK_TRISTATE_DISABLED=window.parent.FCK_TRISTATE_DISABLED=-1;FCK_UNKNOWN=window.parent.FCK_UNKNOWN=-1000;FCK_TOOLBARITEM_ONLYICON=window.parent.FCK_TOOLBARITEM_ONLYTEXT=0;FCK_TOOLBARITEM_ONLYTEXT=window.parent.FCK_TOOLBARITEM_ONLYTEXT=1;FCK_TOOLBARITEM_ICONTEXT=window.parent.FCK_TOOLBARITEM_ONLYTEXT=2;FCK_EDITMODE_WYSIWYG=window.parent.FCK_EDITMODE_WYSIWYG=0;FCK_EDITMODE_SOURCE=window.parent.FCK_EDITMODE_SOURCE=1;
var s=navigator.userAgent.toLowerCase();var FCKBrowserInfo={IsIE:s.Contains('msie'),IsIE7:s.Contains('msie 7'),IsGecko:s.Contains('gecko/'),IsSafari:s.Contains('safari'),IsOpera:s.Contains('opera')};FCKBrowserInfo.IsGeckoLike=FCKBrowserInfo.IsGecko||FCKBrowserInfo.IsSafari||FCKBrowserInfo.IsOpera;if (FCKBrowserInfo.IsGecko){var sGeckoVersion=s.match(/gecko\/(\d+)/)[1];FCKBrowserInfo.IsGecko10=sGeckoVersion<20051111;}
var FCKScriptLoader=new Object();FCKScriptLoader.IsLoading=false;FCKScriptLoader.Queue=new Array();FCKScriptLoader.AddScript=function(scriptPath){FCKScriptLoader.Queue[FCKScriptLoader.Queue.length]=scriptPath;if (!this.IsLoading) this.CheckQueue();};FCKScriptLoader.CheckQueue=function(){if (this.Queue.length>0){this.IsLoading=true;var sScriptPath=this.Queue[0];var oTempArray=new Array();for (i=1;i<this.Queue.length;i++) oTempArray[i-1]=this.Queue[i];this.Queue=oTempArray;this.LoadFile(sScriptPath);}else{this.IsLoading=false;if (this.OnEmpty) this.OnEmpty();};};if (FCKBrowserInfo.IsSafari){FCKScriptLoader.LoadFile=function(filePath){if (filePath.lastIndexOf('.css')>0){this.CheckQueue();return;};var oXmlRequest=new XMLHttpRequest();oXmlRequest.open("GET",filePath,false);oXmlRequest.send(null);if (oXmlRequest.status==200){try{eval(oXmlRequest.responseText);}catch (e){alert('Error parsing '+filePath+': '+e.message);};}else alert('Error loading '+filePath);this.CheckQueue();};}else{FCKScriptLoader.LoadFile=function(filePath){var e;if (filePath.lastIndexOf('.css')>0){e=document.createElement('LINK');e.rel='stylesheet';e.type='text/css';}else{e=document.createElement("script");e.type="text/javascript";};document.getElementsByTagName("head")[0].appendChild(e);if (e.tagName=='LINK'){if (FCKBrowserInfo.IsIE) e.onload=FCKScriptLoader_OnLoad;else FCKScriptLoader.CheckQueue();e.href=filePath;}else{e.onload=e.onreadystatechange=FCKScriptLoader_OnLoad;e.src=filePath;};};function FCKScriptLoader_OnLoad(){if (this.tagName=='LINK'||!this.readyState||this.readyState=='loaded') FCKScriptLoader.CheckQueue();};};
var FCKURLParams=new Object();var aParams=document.location.search.substr(1).split('&');for (var i=0;i<aParams.length;i++){var aParam=aParams[i].split('=');var sParamName=aParam[0];var sParamValue=aParam[1];FCKURLParams[sParamName]=sParamValue;}
var FCK=new Object();FCK.Name=FCKURLParams['InstanceName'];FCK.Status=FCK_STATUS_NOTLOADED;FCK.EditMode=FCK_EDITMODE_WYSIWYG;FCK.LoadLinkedFile=function(){var oDocument=window.parent.document;var eLinkedField=oDocument.getElementById(FCK.Name);var colElementsByName=oDocument.getElementsByName(FCK.Name);var i=0;while (eLinkedField||i==0){if (eLinkedField&&(eLinkedField.tagName=='INPUT'||eLinkedField.tagName=='TEXTAREA')){FCK.LinkedField=eLinkedField;break;};eLinkedField=colElementsByName[i++];};};FCK.LoadLinkedFile();var FCKTempBin=new Object();FCKTempBin.Elements=new Array();FCKTempBin.AddElement=function(element){var iIndex=this.Elements.length;this.Elements[iIndex]=element;return iIndex;};FCKTempBin.RemoveElement=function(index){var e=this.Elements[index];this.Elements[index]=null;return e;};FCKTempBin.Reset=function(){var i=0;while (i<this.Elements.length) this.Elements[i++]==null;this.Elements.length=0;}
var FCKConfig=FCK.Config=new Object();if (document.location.protocol=='file:'){FCKConfig.BasePath=unescape(document.location.pathname.substr(1));FCKConfig.BasePath=FCKConfig.BasePath.replace(/\\/gi,'/');FCKConfig.BasePath='file://'+FCKConfig.BasePath.substring(0,FCKConfig.BasePath.lastIndexOf('/')+1);FCKConfig.FullBasePath=FCKConfig.BasePath;}else{FCKConfig.BasePath=document.location.pathname.substring(0,document.location.pathname.lastIndexOf('/')+1);FCKConfig.FullBasePath=document.location.protocol+'//'+document.location.host+FCKConfig.BasePath;};FCKConfig.EditorPath=FCKConfig.BasePath.replace(/editor\/$/,'');try{FCKConfig.ScreenWidth=screen.width;FCKConfig.ScreenHeight=screen.height;}catch (e){FCKConfig.ScreenWidth=800;FCKConfig.ScreenHeight=600;};FCKConfig.ProcessHiddenField=function(){this.PageConfig=new Object();var oConfigField=window.parent.document.getElementById(FCK.Name+'___Config');if (!oConfigField) return;var aCouples=oConfigField.value.split('&');for (var i=0;i<aCouples.length;i++){if (aCouples[i].length==0) continue;var aConfig=aCouples[i].split('=');var sKey=unescape(aConfig[0]);var sVal=unescape(aConfig[1]);if (sKey=='CustomConfigurationsPath') FCKConfig[sKey]=sVal;else if (sVal.toLowerCase()=="true") this.PageConfig[sKey]=true;else if (sVal.toLowerCase()=="false") this.PageConfig[sKey]=false;else if (!isNaN(sVal)) this.PageConfig[sKey]=parseInt(sVal);else this.PageConfig[sKey]=sVal;};};function FCKConfig_LoadPageConfig(){var oPageConfig=FCKConfig.PageConfig;for (var sKey in oPageConfig) FCKConfig[sKey]=oPageConfig[sKey];};function FCKConfig_PreProcess(){var oConfig=FCKConfig;if (oConfig.AllowQueryStringDebug&&(/fckdebug=true/i).test(window.top.location.search)) oConfig.Debug=true;if (!oConfig.PluginsPath.endsWith('/')) oConfig.PluginsPath+='/';if (typeof(oConfig.EditorAreaCSS)=='string') oConfig.EditorAreaCSS=[oConfig.EditorAreaCSS];};FCKConfig.ToolbarSets=new Object();FCKConfig.Plugins=new Object();FCKConfig.Plugins.Items=new Array();FCKConfig.Plugins.Add=function(name,langs,path){FCKConfig.Plugins.Items.AddItem([name,langs,path]);};FCKConfig.ProtectedSource=new Object();FCKConfig.ProtectedSource.RegexEntries=new Array();FCKConfig.ProtectedSource.Add=function(regexPattern){this.RegexEntries.AddItem(regexPattern);};FCKConfig.ProtectedSource.Protect=function(html){function _Replace(protectedSource){var index=FCKTempBin.AddElement(protectedSource);return '<!--{PS..'+index+'}-->';};for (var i=0;i<this.RegexEntries.length;i++){html=html.replace(this.RegexEntries[i],_Replace);};return html;};FCKConfig.ProtectedSource.Revert=function(html,clearBin){function _Replace(m,opener,index){var protectedValue=clearBin?FCKTempBin.RemoveElement(index):FCKTempBin.Elements[index];return FCKConfig.ProtectedSource.Revert(protectedValue,clearBin);};return html.replace(/(<|&lt;)!--\{PS..(\d+)\}--(>|&gt;)/g,_Replace);};FCKConfig.ProtectedSource.Add(/<!--[\s\S]*?-->/g);
var FCKeditorAPI;function FCKeditorAPI_GetInstance(instanceName){return this.__Instances[instanceName];};if (!window.parent.FCKeditorAPI){FCKeditorAPI=window.parent.FCKeditorAPI=new Object();FCKeditorAPI.__Instances=new Object();FCKeditorAPI.Version='2.0';FCKeditorAPI.GetInstance=FCKeditorAPI_GetInstance;}else FCKeditorAPI=window.parent.FCKeditorAPI;FCKeditorAPI.__Instances[FCK.Name]=FCK;
if (FCKLang&&window.document.dir.toLowerCase()!=FCKLang.Dir.toLowerCase()) window.document.dir=FCKLang.Dir;if (FCKConfig.ForcePasteAsPlainText) FCK.Events.AttachEvent("OnPaste",FCK.Paste);if (FCKPlugins.ItemsCount>0){FCKScriptLoader.OnEmpty=CompleteLoading;FCKPlugins.Load();}else CompleteLoading();function CompleteLoading(){FCKToolbarSet.Name=FCKURLParams['Toolbar']||'Default';FCKToolbarSet.Load(FCKToolbarSet.Name);FCKToolbarSet.Restart();FCK.AttachToOnSelectionChange(FCKToolbarSet.RefreshItemsState);FCK.SetStatus(FCK_STATUS_COMPLETE);if (typeof(window.parent.FCKeditor_OnComplete)=='function') window.parent.FCKeditor_OnComplete(FCK);};
