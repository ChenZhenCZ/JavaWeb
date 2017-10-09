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
            pageSize: 5,//每页的记录行数（*）
            showToggle:true,//显示试图切换
            pageList: [5,10,15],//可供选择的每页的行数（*）
            sidePagination: "server", //分页方式：client客户端分页，server服务端分页（*）
            showRefresh:true,//刷新按钮
            showColumns:true,
            showExport: true,//显示导出按钮  
            exportDataType: "basic",//导出类型    
            //【样式设置】
            height: 500,//table高度
            //按需求设置不同的样式：5个取值代表5中颜色['active', 'success', 'info', 'warning', 'danger'];
            rowStyle: function (row, index) {
                var style = "";
                if (row.name=="小红") {style='success';}
                return { classes: style }
            }
        })
     }
}

var bstpTable=new BstpTable($("table"));
bstpTable.inint({})

//按楼盘查询楼栋
$(".search").click(function(){
    var searchArgs={
    		buildingsName:$("input[name='name']").val(),
    }
    bstpTable.inint(searchArgs)
})

//楼栋修改页面数据初始化
$(function(){
	$(".edit").click(function(){
		var data=$("#tb").bootstrapTable("getSelections");
		if(data.length==1){
			$("#buildingUpdate").fill(data[0]);	//数据填入模态框
			$("#modifybuilding").modal();	//打开模态框
		}else{
			toastr.warning("未选中行!");  
		}
	})
})
//楼栋修改
function buildingUpdate(){
	$.post("/EstateSales/building/update", 
		$("#buildingUpdate").serialize(),
		function(data) {
			if (data.controllerResult.result == "success") {
				$("#modifybuilding").modal('toggle');	//关闭模态框
				toastr.success("修改成功!"); 
			} else {
				toastr.error("修改失败!");  
			}
		}, "json"
	);
}
//关闭模态框后，刷新页面
$('#modifybuilding').on('hide.bs.modal', function () {
	$("#tb").bootstrapTable("refresh",{url:"/EstateSales/building/buildingList"});
	}
)

//楼栋冻结或修改
$(function(){
	$(".inOractive").click(function(){
		var data=$("#tb").bootstrapTable("getSelections");
		if(data.length==1){
			if(data[0].status=="冻结"){
				$.post("/EstateSales/building/inOractive", 
					{"buildingVO.id":data[0].id,"buildingVO.status":"激活"},
					function(data) {
						if (data.controllerResult.result == "success") {
							$("#tb").bootstrapTable("refresh",{url:"/EstateSales/building/buildingList"});
							toastr.success("该数据已激活!"); 
						} else {
							toastr.error("激活失败!"); 
						}
					}, "json"
				);
			}else{
				$.post("/EstateSales/building/inOractive", 
					{"buildingVO.id":data[0].id,"buildingVO.status":"冻结"},
					function(data) {
						if (data.controllerResult.result == "success") {
							$("#tb").bootstrapTable("refresh",{url:"/EstateSales/building/buildingList"});
							toastr.success("该数据已冻结!"); 
						} else {
							toastr.error("冻结失败!"); 
						}
					}, "json"
				);
			}
		}else{
			toastr.info("请选择需要冻结或激活的行!");  
		}
	})
})


//动态生成房号URL
$(function(){
	$(".addRoom").click(function(){
		var data=$("#tb").bootstrapTable("getSelections");
		if(data.length==1){
			$("#url").attr('href','/EstateSales/room/addRoom?buildingId='+data[0].id+'&buildingsId='+data[0].buildings.id);
		}else{
			toastr.warning("未选中行!");  
		}
	})
})



//查看房号
$(function(){
	$(".lookRooms").click(function(){
		var data=$("#tb").bootstrapTable("getSelections");
		if(data.length==1){
			$("#lookRooms").attr('href','/EstateSales/room/lookRooms?louDongId='+data[0].id);
		}else{
			toastr.warning("未选中行!");  
		}
	})
})

