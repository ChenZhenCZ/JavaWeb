<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/18
  Time: 19:29
  To change this template use File | Settings | File Templates.
--%>
<%
    String path=request.getContextPath();
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>分页实例</title>
    <link rel="stylesheet"  href="${pageContext.request.contextPath }/css/bootstrap.min.css">
    <link rel="stylesheet"  href="${pageContext.request.contextPath }/css/jquery.bootgrid.min.css">
    <link rel="stylesheet"  href="${pageContext.request.contextPath }/css/bootstrapValidator.css">
    <link rel="stylesheet"  href="${pageContext.request.contextPath }/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet"  href="${pageContext.request.contextPath }/css/bootstrap-responsive.min.css">
</head>
<body>
<div class="container">
    <div id="content" class="col-lg-10 col-sm-10">
        <!-- content starts -->
        <div>
            <ul class="breadcrumb">
                <li><a href="javascript:void(0)">首页</a></li>
                <li><a href="javascript:void(0)">分页实例</a></li>
            </ul>
        </div>

        <div class="row">
            <!-- 表格 -->
            <div class="col-xs-12">
                <table id="grid-data" class="table table-condensed table-hover table-striped">
                    <thead>
                    <tr>
                        <th data-radio="true"></th>
                        <th data-column-id="id" >编号</th>
                        <th data-column-id="name" >用户名称</th>
                        <th data-column-id="password" >密码</th>
                        <th data-column-id="commands" data-formatter="commands" data-sortable="false">操作</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>

<!--分页-->
<script>
    $(document).ready(function(){
        var grid = $("#grid-data").bootgrid({
            ajax:true,
            post: function ()
            {
                return {
                    id: "b0df282a-0d67-40e5-8558-c9e93b7befed"
                };
            },
            url:"${pageContext.request.contextPath }/uers/Uerslist",


            formatters: {

                "sex": function(column, row)
                {
                    if(row.sex==0){
                        //alert(row.sex);
                        return "女";
                    }else if(row.sex==1){
                        return "男";
                    }
                },
                "commands": function(column, row)
                {
                    return "<button type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.id + "\">编辑<span class=\"fa fa-pencil\"></span></button> " +
                        "<button type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-id=\"" + row.id + "\">删除<span class=\"fa fa-trash-o\"></span></button>";
                }

            }


        }).on("loaded.rs.jquery.bootgrid", function()
        {
            grid.find(".command-edit").on("click", function(e)
            {
                $(".stumodal").modal();
                $.post("${pageContext.request.contextPath }/student/getStudentInfo",{id:$(this).data("row-id")},function(str){
                    $("#id1").val(str.id);
                    $("#name2").val(str.name);
                    $("#sex2").val(str.sex);
                    $("#age2").val(str.age);
                    $("#birthday2").val(str.birthday);
                    $("#email2").val(str.email);
                    $("#idcard2").val(str.idcard);

                });
            }).end().find(".command-delete").on("click", function(e)
            {

                if (confirm("你确定提交吗？")) {
                    alert("点击了确定");
                }
                else {
                    alert("点击了取消");
                }

                alert("你确定删除: " + $(this).data("row-id"));
                $.post("${pageContext.request.contextPath }/stu/delStu",{stuId:$(this).data("row-id")},function(){
                    alert("删除成功");
                    $("#grid-data").bootgrid("reload");
                });
            });
        });
    });

    $(document).ready(function(){
        $("#add").click(function(){
            $(".addmodal").modal();
        });
    });
</script>

</body>
<script  type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.12.3.min.js"></script>
<script  type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script  type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.bootgrid.min.js"></script>
<script  type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap-datetimepicker.min.js"></script>
<script  type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrapValidator.js"></script>
</html>
