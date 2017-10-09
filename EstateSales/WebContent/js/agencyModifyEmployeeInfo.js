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
            toolbar: '#toolbar',                //工具按钮用哪个容器
            locale:'zh-CN',//中文支持
            striped: true,      
            pagination:true,//是否开启分页（*）
            pageNumber:1,                       //初始化加载第一页，默认第一页
            pageSize: 5,                       //每页的记录行数（*）
            pageList: [5, 10,15,20],        //可供选择的每页的行数（*）
            uniqueId: "id",  //初始化加载第一页，默认第一页
            sidePagination: "server", //分页方式：client客户端分页，server服务端分页（*）
            clickToSelect: true,  //是否启用点击选中行
            showToggle:true,//显示试图切换
            showRefresh:true,//刷新按钮
            showColumns:true,
            showExport: true,//显示导出按钮
            //【样式设置】
            height: 500,//table的高度
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


  //注册新增按钮的事件
$("#btn_add").click(function () {
		$("#myModalLabel").text("新增");
		$('#myModal').modal();
});

$("#add").click(function(){
	$.post("/EstateSales/staff/updataStaff",
		$("#from1").serialize(),
		function(msg){
			$("#tb").bootstrapTable("refresh",{url:"/EstateSales/staff/agencyList"});
			 toastr.success('新增成功！');
		},"json")
});

//编辑
$("#btn_edit").click(function () {
	//取表格的选中行数据
	var data = $("#tb").bootstrapTable('getSelections');
    if (data.length == 1) {
        $("#f").fill(data[0]);
        $("#myModalLabel").text("编辑");
        $('#myModal2').modal();
        return;
    }else{
        toastr.warning('请选择有效数据');
        return;
    }
});

$("#update").click(function(){
	$.post("/EstateSales/staff/updataSta",
			$("#f").serialize(),
			function(msg){
				$("#tb").bootstrapTable("refresh",{url:"/EstateSales/staff/agencyList"});
				toastr.success('修改成功！');
			},
			"json")
})
//冻结
$("#btn_delete").click(function(){
	var data=$("#tb").bootstrapTable("getSelections");
	if(data.length==1){
		if(data[0].status=='冻结'){
			toastr.error('该数据已被冻结，无需再洗冻结');
		}else{
			$.post("/EstateSales/staff/del",
					{"emp.id":data[0].id},
					function(msg){
						$("#tb").bootstrapTable("refresh",{url:"/EstateSales/staff/agencyList"});
						toastr.error('该员工已冻结！');
					},
			"json")
		}
	}else{
		 toastr.warning('请选中您需要冻结的数据');
	}
})
//激活
$("#btn_ho").click(function(){
	var data=$("#tb").bootstrapTable("getSelections");
	if(data.length==1){
		if(data[0].status=='激活'){
			toastr.error('该员工已是激活状态,无需再洗激活！');
		}else{
			$.post("/EstateSales/staff/Jihuo",
					{"emp.id":data[0].id},
					function(msg){
						$("#tb").bootstrapTable("refresh",{url:"/EstateSales/staff/agencyList"});
						toastr.success('该员工已激活！');
					},
					"json")
		}
		
	}else{
		 toastr.warning('请选择有效数据');
	}
})

//初始化密码
$("#btn_pwd").click(function(){
	var data=$("#tb").bootstrapTable("getSelections");
	if(data.length==1){
		$.post("/EstateSales/staff/inpwd",
				{"emp.id":data[0].id},
				function(msg){
					$("#tb").bootstrapTable("refresh",{url:"/EstateSales/staff/agencyList"});
					toastr.success('密码初始化成功,密码为:123456');
				},
				"json")
	}else{
		 toastr.warning('请选择有效数据');
	}
})

