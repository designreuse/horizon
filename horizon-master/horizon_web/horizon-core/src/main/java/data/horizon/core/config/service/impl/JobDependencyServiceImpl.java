package data.horizon.core.config.service.impl;

import data.horizon.analysis.Job;
import data.horizon.core.config.dao.DependencyDAO;
import data.horizon.core.config.service.DependencyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.concurrent.CopyOnWriteArraySet;


/**
 * Created by huyang on 2016/1/15.
 */
@Service
public class JobDependencyServiceImpl implements DependencyService {

  @Autowired
  @Qualifier("jobDependencyDAOImpl")
  private DependencyDAO<Job> jobDependencyDAO;

  //虚拟根节点
  private final String START = "START";

  //存放所有的job
  private Map<String, Job> jobs;
  //按层级存放job
  private Map<Integer,Set<String>> nodes;
  //按job名称存放依赖关系
  private Map<String,Set<String>> links;
  //递归遍历过程中已经被访问的job
  private Map<String,Integer> traversed;
  //

  @Override
  public String getAllDependencyGraph() {
    this.jobs = new HashMap<String, Job>();
    this.nodes = new HashMap<Integer,Set<String>>();
    this.links = new HashMap<String,Set<String>>();
    this.traversed = new HashMap<String,Integer>();
    StringBuilder nodes = new StringBuilder();
    StringBuilder links = new StringBuilder();

    for(Job job:this.getRootJobs()){
      //增加虚拟开始节点和根节点的关系
      this.addLink(this.START,job.getName());
      getDenpendencyTreeToDown(job.getName(),1);
    }

    //拼接json格式的nodes
    for(Map.Entry<Integer,Set<String>> entry:this.nodes.entrySet()){
      nodes.append(entry.getKey()+":[");
      for(String job:entry.getValue()){
        nodes.append("'"+job+"',");
      }
      nodes.deleteCharAt(nodes.lastIndexOf(",")).append("],");
    }

    //拼接json格式的links
    for(Map.Entry<String,Set<String>> entry:this.links.entrySet()){
      for(String child:entry.getValue()){
        links.append("['"+entry.getKey()+"','"+child+"'],");
      }
    }

    this.restoreFactorySettings();
    //添加虚拟START节点
    nodes.deleteCharAt(nodes.lastIndexOf(",")).insert(0, "0:['"+this.START+"'],").insert(0,"nodes:{").append("}");
    links.deleteCharAt(links.lastIndexOf(",")).insert(0,"links:[").append("]");

    //拼接最终生成的json格式依赖图
    String dependencyGraph = "{" + nodes.toString() + "," + links.toString() + "}";
    return dependencyGraph;
  }

  @Override
  public String getOneDependencyGraph(String name) {
    return null;
  }


  /**
   * @param node
              节点名称
   * @param hierarchy
              节点层级
   * */
  private void getDenpendencyTreeToDown(String node,int hierarchy) {
    //标记节点在第hierarchy层已被访问
    this.traversed.put(node,hierarchy);
    this.addNode(node,hierarchy);
    Set<String> children = this.jobs.get(node).getByDependencyJob();
    if(children != null && children.size() > 0){
      int childHierarchy1 = hierarchy+1;
      for(String child:children){
        if(!this.traversed.containsKey(child)){
          this.addLink(node,child);
          this.getDenpendencyTreeToDown(child,childHierarchy1);
        }else {
          int childHierarychy0 = this.traversed.get(child);
          if(childHierarychy0 == childHierarchy1){
            this.addLink(node,child);
          }else {
            String childAlias = child+"|"+childHierarchy1+"|"+childHierarychy0;
            this.addNode(childAlias,childHierarchy1);
            this.addLink(node,childAlias);
          }
        }
      }
    }
  }


  //获取根节点(没有依赖的作业);从redis中获取所有的作业
  private List<Job> getRootJobs() {
    //存放所有的作业
    List<Job> jobList = this.jobDependencyDAO.getAll();
    List<Job> jobs = new ArrayList<Job>();
    for (Job job : jobList) {
      //转化为map格式的jobs
      this.jobs.put(job.getName(),job);
      if (job.getDependencyJob().size() == 0 && job.getByDependencyJob().size() != 0) {
        jobs.add(job);
      }
    }
    return jobs;
  }

  /**
   * 添加节点
   *@param node
            节点名称
   *@param hierarchy
            节点层级
   */
  private void addNode(String node,int hierarchy){
    //如果nodes中category层存在,直接添加节点
    if(this.nodes.containsKey(hierarchy)){
      this.nodes.get(hierarchy).add(node);
    }else{
      Set<String> set = new HashSet<String>();
      set.add(node);
      this.nodes.put(hierarchy,set);
    }
  }


  /**
   * 添加关系
   *@param node
            节点名称
   *@param child
            子节点名称
   */
  private void addLink(String node,String child){
      if(this.links.containsKey(node)){
        this.links.get(node).add(child);
      }else {
        Set<String> set = new HashSet<String>();
        set.add(child);
        this.links.put(node,set);
      }
  }

  //恢复出厂设置
  private void restoreFactorySettings() {
    this.jobs = null;
    this.nodes = null;
    this.links = null;
    this.traversed = null;
  }
}
