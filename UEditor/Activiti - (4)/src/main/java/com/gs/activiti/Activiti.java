package com.gs.activiti;

import junit.framework.TestCase;
import org.activiti.engine.*;
import org.activiti.engine.impl.cfg.StandaloneProcessEngineConfiguration;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.junit.Test;

import java.util.List;

/**
 * Created by Administrator on 2017/10/11.
 */
public class Activiti extends TestCase {

    private ProcessEngine processEngine;

    /**
     * 数据表的规则：
     * act_分类
     * 分类如下：
     * evt: event 事件
     * ge: general 通用数据
     * hi: history 历史数据
     * id: identity 身份数据
     * procdef: process definition 流程定义数据
     * re: repository 静态数据
     * ru: runtime 运行时数据
     *
     * ACT_RE_*: 'RE'表示repository。 这个前缀的表包含了流程定义和流程静态资源 （图片，规则，等等）。
     ACT_RU_*: 'RU'表示runtime。 这些运行时的表，包含流程实例，任务（Task），变量，异步任务，等运行中的数据。 Activiti只在流程实例执行过程中保存这些数据， 在流程结束时就会删除这些记录。 这样运行时表可以一直很小速度很快。
     ACT_ID_*: 'ID'表示identity。 这些表包含身份信息，比如用户，组等等。
     ACT_HI_*: 'HI'表示history。 这些表包含历史数据，比如历史流程实例， 变量，任务等等。
     ACT_GE_*: 'GE'表示General。通用数据， 用于不同场景下。

     初始化好的流程引擎对象最终可以执行相应的流程。
     流程的创建有两种方式，手动创建xml文档，使用可视化的流程设计工具
     Activiti提供的一个war：activiti-explorer.war，提供网页版流程设计器
     IDE集成开发工具的插件：IDEA-acti    Eclipse：activiti

     // 使用ProcessEngine对象，此对象是Activiti的核心对象，所有功能都依赖于此对象
     HistoryService historyService = processEngine.getHistoryService(); // 历史记录相关的服务
     IdentityService identityService = processEngine.getIdentityService(); // 用户、组（角色）信息相关的服务
     RepositoryService repositoryService = processEngine.getRepositoryService();
     RuntimeService runtimeService = processEngine.getRuntimeService();
     TaskService taskService = processEngine.getTaskService();
     */

    /**
     * 1、创建好流程定义和流程图
     * 2、获取到流程引擎对象
     * 3、流程部署（把流程定义放入到activiti的执行环境中，把流程定义保存到相关的数据表中）
     *  使用RespositoryService来部署流程图
     *  影响的表：d_activiti.act_ge_bytearray,
     *  d_activiti.act_re_deployment,
     *  d_activiti.act_re_procdef(主要的表， name_, key_)
     * 4、启动流程
     *  RuntimeService用于启动流程
     *  d_activiti.act_hi_actinst
     *  d_activiti.act_hi_procinst 流程历史记录
     *  d_activiti.act_hi_taskinst 任务历史记录
     *  d_activiti.act_ru_execution 任务的执行数据
     *  d_activiti.act_ru_task 当前任务的执行数据
     * 5、获取任务并执行任务
     *  TaskService
     */
    @Override
    protected void setUp() throws Exception {
        /**
         * ProcessEngineConfiguration为Activiti流程引擎的配置器类
         */
        ProcessEngineConfiguration cfg = new StandaloneProcessEngineConfiguration()
                .setJdbcUrl("jdbc:mysql://localhost:3306/d_activiti")
                .setJdbcUsername("root")
                .setJdbcPassword("123456")
                .setJdbcDriver("com.mysql.jdbc.Driver")
                // 设置是否自动更新数据库里的数据表
                /**
                 * ProcessEngineConfiguration.DB_SCHEMA_UPDATE_TRUE   如果没有数据表，则创建数据表，如果有，则直接使用
                 * ProcessEngineConfiguration.DB_SCHEMA_UPDATE_FALSE  如果没有数据表，则抛出异常，如果有，则直接使用
                 * ProcessEngineConfiguration.DB_SCHEMA_UPDATE_CREATE_DROP  如果没有数据表，则创建数据表，如果有，则先删除再创建表
                 */
                .setDatabaseSchemaUpdate(ProcessEngineConfiguration.DB_SCHEMA_UPDATE_TRUE);
        processEngine = cfg.buildProcessEngine(); // 通过配置器构建流程引擎，activiti自动到配置的数据库中创建28张表
        String pName = processEngine.getName();
        String ver = ProcessEngine.VERSION;
        System.out.println("ProcessEngine [" + pName + "] Version: [" + ver + "]");
    }

    @Test
    public void testDeploy() {
        RepositoryService repositoryService = processEngine.getRepositoryService();
        repositoryService.createDeployment().addClasspathResource("diagrams/goods_apply.bpmn20.xml").deploy(); //  先读取流程定义文件，再完成部署
    }

    @Test
    public void testStartProcess() {
        RuntimeService runtimeService = processEngine.getRuntimeService();
        ProcessInstance processInstance = runtimeService.startProcessInstanceByKey("goods_apply"); // 启动流程
    }

    @Test
    public void testListTask() {
        // 获取当前需要执行的任务，用于查询出指定用户的所有待办任务
        TaskService taskService = processEngine.getTaskService();
        List<Task> taskList =  taskService.createTaskQuery().list();
        for (Task task : taskList) {
            task.setAssignee("emp1"); // 把任务指派给指定的用户
            taskService.complete(task.getId()); // 完成任务
            System.out.println(task.getName());
        }
    }

    @Test
    public void testLeaveProcessDeploy() {
        RepositoryService repositoryService = processEngine.getRepositoryService();
        repositoryService.createDeployment().addClasspathResource("diagrams/leave_process.bpmn20.xml").deploy();
    }

    @Test
    public void testStartLeaveProcess() {
        RuntimeService runtimeService = processEngine.getRuntimeService();
        runtimeService.startProcessInstanceByKey("leave_process");
    }

    /**
     * assignee 指派的人
     * candidate 候选人
     */
    @Test
    public void testSubmit() {
        TaskService taskService = processEngine.getTaskService();
        // taskAssinee是指只去查找指定用户的任务。
        // 根据登录的用户名去查找此用户的待办任务
        List<Task> taskList = taskService.createTaskQuery().taskAssignee("emp").list();
        for (Task task : taskList) {
            taskService.complete(task.getId()); // 用户去执行此用户下的所有任务
        }
    }

    @Test
    public void testCheck() {
        TaskService taskService = processEngine.getTaskService();
        List<Task> taskList = taskService.createTaskQuery().taskAssignee("boss").list();
        for (Task task : taskList) {
            taskService.complete(task.getId());
        }
    }

}
