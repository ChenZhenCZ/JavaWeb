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
            url: '/EstateSales/cous/couslist',
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
            exportDataType: "basic",//导出类型 
            clickToSelect:true,
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
             {field: 'name',title: '名称'},
             {field: 'gender',title: '性别'},
             {field: 'birthday',title: '生日',
            	 formatter:function(value,row) {
              	    if (row.birthday == undefined || row.birthday == null || row.birthday == '') {
              	        return "";
              	    } else {
              	        var date = new Date(row.birthday); // 获取js的Date对象
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
             {field: 'email',title: '邮箱'},
             {field: 'phone',title: '手机号码'}, 
             {field: 'identity_id',title: '身份证号'},
             {field: 'address',title: '联系地址'},
             {field: 'customer_type',title: '客户类型'},
             {field: 'together',title: '共同购房人'}, 
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
             }
            ]
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

  //注册新增按钮的事件
$("#btn_add").click(function () {
		$("#myModalLabel").text("新增");
		$('#myModal').modal();
});

//注册修改按钮的事件
$("#btn_edit").click(function () {
	//取表格的选中行数据
	var data = $("#tb_departments").bootstrapTable('getSelections');
    if (data.length == 1) {
        $("#f").fill(data[0]);
        $('#myModal2').modal();
        return;
    }else{
        toastr.warning('请选择有效数据');
        return;
    }
});
$("#update").click(function(){
	$.post("/EstateSales/cous/update",
			$("#f").serialize(),
			function(msg){
				$("#tb_departments").bootstrapTable("refresh",{url:"/EstateSales/cous/couslist"});
				toastr.success('修改成功！');
			},
			"json")
})


//上传电子合同
var conId="";
$("#btn_contarct").click(function () {
	var data = $("#tb_departments").bootstrapTable('getSelections');
	 if (data.length == 1) {
		 conId=data[0].id;
		 $('#modalLogo').modal("toggle");
	  }else{
		  toastr.warning('请选择有效数据');
	 }
});
$('#contarctlogo').fileinput({//上传地址
    language: 'zh',
    uploadUrl: '/EstateSales/cous/contract',
    allowedFileExtensions : ['jpg', 'png','gif'],
    uploadExtraData:
    	function(previewId, index) {   //额外参数的关键点
    	var data = {
    			conId:conId
    	};
        return data;
}
})
$('#contarctlogo').on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功		
	
	 $("#modalLogo").modal("toggle");
	 toastr.success('上传成功！');
})