<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div class="navbar navbar-default" role="navigation">
        <div class="navbar-inner">
            
            <a class="navbar-brand" href="javascript:void(0);"> <img alt="Charisma Logo" src="../managePlugin/img/logo20.png" class="hidden-xs"/>
                <span><font size="2">${session.agencyVO.name}</font></span></a>
            <!-- user dropdown starts -->
            <div class="btn-group pull-right">
                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-user"></i><span class="hidden-sm hidden-xs">${session.agencyVO.leader}</span>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="../agency/exit">退出登陆</a></li>
                </ul>
            </div>
        </div>
    </div>