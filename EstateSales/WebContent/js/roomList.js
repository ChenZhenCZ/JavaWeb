class BstpTable{
    constructor(obj) {
        this.obj=obj;
    }
    inint(searchArgs){
         //---先销毁表格 ---
         this.obj.bootstrapTable('destroy');  
         //---初始化表格,动态从服务器加载数据--- 
         this.obj.bootstrapTable({
            //【发出请求的基础信息】
            method: 'post',
            contentType: "application/x-www-form-urlencoded",
            //【查询设置】
            /* queryParamsType的默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort
                              设置为 ''  在这种情况下传给服务器的参数为：pageSize,pageNumber */
            queryParamsType:'', 
            queryParams: function queryParams(params) {  
              var param = {  
                  pageNumber: params.pageNumber,    
                  pageSize: params.pageSize
              }; 
              for(var key in searchArgs){
                  param[key]=searchArgs[key]
              }  
              return param;                   
            }, 
            //【其它设置】
            clickToSelect: true,  //是否启用点击选中行
            toolbar: '#toolbar', //工具按钮用哪个容器
            locale:'zh-CN',//中文支持
            pagination: true,//是否开启分页（*）
            pageNumber:1,//初始化加载第一页，默认第一页
            pageSize: 10,//每页的记录行数（*）
            showToggle:true,//显示试图切换
            pageList: [10,20,30],//可供选择的每页的行数（*）
            sidePagination: "server", //分页方式：client客户端分页，server服务端分页（*）
            showRefresh:true,//刷新按钮
            showColumns:true,
            showExport: true,//显示导出按钮  
            exportDataType: "basic",//导出类型    
            //【样式设置】
            height: 467,//table高度
            //按需求设置不同的样式：5个取值代表5中颜色['active', 'success', 'info', 'warning', 'danger'];
            rowStyle: function (row, index) {
                var style = "";
                if (row.sale_status=="待售"){
                	{style='active';}
                }
                if(row.sale_status=="已售"){
                	{style='success';}
                }
                if(row.sale_status=="保留"){
                	{style='danger';}
                }
                return { classes: style }
            }
        })
     }
}

var bstpTable=new BstpTable($("table"));
bstpTable.inint({})

$(".search").click(function(){
    var searchArgs={
         name:$("input[name='name']").val(),
    }
    bstpTable.inint(searchArgs)
})


//设置弹出框参数
$(function(){
	toastr.options = {  
        closeButton: false,  
        debug: false,  
        progressBar: false,  
        positionClass: "toast-center-center",  
        onclick: null,  
        showDuration: "300",  //显示动作时间 
        hideDuration: "1000", //隐藏动作时间 
        timeOut: "1000",  	  //自动关闭超时时间 
        extendedTimeOut: "1000",  
        showEasing: "swing",  
        hideEasing: "linear",  
        showMethod: "fadeIn",  
        hideMethod: "fadeOut"  
    };  
})

