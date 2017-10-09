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
            url: '/EstateSales/sale/salelist',
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
            },
            
            //【设置列】
            columns: [
            	{radio: true},
             {field: 'customer.name',title: '客户名称'},
             {field: 'sale_time',title: '销售时间',
            	 formatter:function(value,row) {
              	    if (row.created_time == undefined || row.created_time == null || row.created_time == '') {
              	        return "";
              	    } else {
              	        var date = new Date(row.created_time); // 获取js的Date对象
              	        var year = date.getFullYear().toString();
              	        var month = (date.getMonth() + 1);
              	        var day = date.getDate().toString();
              	        var hour = date.getHours().toString();
              	        var minutes = date.getMinutes().toString();
              	        var seconds = date.getSeconds().toString();
              	        if (month < 10) {
              	            month = "0" + month;
              	        }
              	        if (day < 10) {
              	            day = "0" + day;
              	        }
              	        return year + "-" + month + "-" + day;
              	    }
              	}
             },
             {field: 'unit_price',title: '销售单价'}, 
             {field: 'room.name',title: '房号'},
             {field: 'discount',title: '销售折扣'}, 
             {field: 'total_cost',title: '销售总价'},
             {field: 'emp.name',title: '员工姓名'},
             {field: 'created_time',title: '创建时间',
            	 formatter:function(value,row) {
         	    if (row.created_time == undefined || row.created_time == null || row.created_time == '') {
         	        return "";
         	    } else {
         	        var date = new Date(row.created_time); // 获取js的Date对象
         	        var year = date.getFullYear().toString();
         	        var month = (date.getMonth() + 1);
         	        var day = date.getDate().toString();
         	        var hour = date.getHours().toString();
         	        var minutes = date.getMinutes().toString();
         	        var seconds = date.getSeconds().toString();
         	        if (month < 10) {
         	            month = "0" + month;
         	        }
         	        if (day < 10) {
         	            day = "0" + day;
         	        }
         	        return year + "-" + month + "-" + day;
         	    }
         	}
             },
             {field: 'status',title: '状态'}, 
            ]
        })
     }
}

var bstpTable=new BstpTable($("table"));
bstpTable.inint({})



//完善资料
$("#btn_ziliao").click(function(){
	var data=$("#tb_departments").bootstrapTable("getSelections");
	if(data.length==1){
		 $("#f").fill(data[0]);
		$('#myModal').modal();
	}else{
		toastr.warning("请选择有效数据!");
	}
 })
$("#update").click(function(){
	$.post("/EstateSales/sale/updatesale",
			$("#f").serialize(),
			function(data){
				if(data.msg!="失败"){
					$("#tb_departments").bootstrapTable("refresh",{url:"/EstateSales/sale/salelist"});
					toastr.success("完善资料成功！");
				}else{
					toastr.error("房号不存在,完善资料失败！");
				}
			},
			"json")
})

//查看详情
$("#btn_xiang").click(function(){
	var data=$("#tb_departments").bootstrapTable("getSelections");
	if(data.length==1){
		 var s =data[0].id;
		window.location.href="http://localhost:8080/EstateSales/sale/salexiangqing?" +
		""+"sale.id="+encodeURI(s);
	}else{
		toastr.warning("请选择有效数据!");
	}
 })