//查询所有考试
<template>
  <div class="exam">
    <el-form :inline="true" class="demo-form-inline"  >
      <el-form-item label="用户姓名">
        <el-input v-model="userName" ></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="getExamInfo()" icon="el-icon-a-042" style="font-size: 20px;">查询</el-button>
        <el-button type="primary" @click="down()" icon="el-icon-download" style="font-size: 20px;">导出</el-button>
      </el-form-item>
    </el-form>

    <el-table :data="pagination" border>
      <el-table-column prop="name" label="姓名"  width="100"></el-table-column>
      <el-table-column prop="uass" label="uass" width="120" ></el-table-column>
      <el-table-column prop="selfevaluation" label="自测得分" width="100" ></el-table-column>
      <el-table-column prop="totalscore" label="他测得分" width="100" ></el-table-column>
      <el-table-column prop="totalNm" label="他测人数" width="100" ></el-table-column>
      <el-table-column prop="superior" label="上级评价得分" width="120"></el-table-column>
      <el-table-column prop="superiorNm" label="上级评价人数" width="120"></el-table-column>
      <el-table-column prop="equal" label="同级评价得分" width="120" ></el-table-column>
      <el-table-column prop="equalNm" label="同级评价人数" width="120" ></el-table-column>
      <el-table-column prop="subordinate" label="下级评价得分" width="120" ></el-table-column>
      <el-table-column prop="subordinateNm" label="下级评价人数" width="120" ></el-table-column>
    </el-table>
    <el-pagination
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="pagination.current"
      :page-sizes="[5, 10, 20, 30]"
      :page-size="pagination.size"
      layout="total, sizes, prev, pager, next, jumper"
      :total="pagination.total"
      class="page"
    >
    </el-pagination>
    <!-- 编辑对话框-->
  </div>
</template>

<script>
export default {
  data() {
    return {
      form: {}, //保存点击以后当前试卷的信息
      pagination: {
        //分页后的考试信息
        current: 1, //当前页
        total: null, //记录条数
        size: 5, //每页条数
      },
      downFile:{},
      userName:"",
    };
  },
  created() {
    this.getExamInfo();
    
  },
  methods: {
    getExamInfo() {
      if (this.userName == "" || this.userName == null){
        this.$axios(`/api/admin1/${this.pagination.current}/${this.pagination.size}`)
        .then((res) => {
          var size = this.pagination.size;
          var current = this.pagination.current;
          this.pagination = res.data.data.records;
          this.pagination.size = size;
          this.pagination.current = current;
        })
        .catch((error) => {});
      }
      else {
        this.$axios(`/api/admin1/${this.userName}`)
        .then((res) => {
          var size = this.pagination.size;
          var current = this.pagination.current;
          this.pagination = res.data.data;
          this.pagination.size = size;
          this.pagination.current = current;
        })
        .catch((error) => {});
      }
      
    },
    //改变当前记录条数
    handleSizeChange(val) {
      this.pagination.size = val;
      this.getExamInfo();
    },
    //改变当前页码，重新发送请求
    handleCurrentChange(val) {
      this.pagination.current = val;
      this.getExamInfo();
    },
    down(){
      this.$axios({  
        url:`/api/download`,  
        method: "get",  
        responseType: "blob"
      } )  
      .then((res) => {  
        if(res.headers['content-type'] !== 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8') {
          alert("不是application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")  
            throw new Error('Invalid content type');  
        }  
        var blob = new Blob([res.data], {type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8'});    
        var url = URL.createObjectURL(blob);    
        var a = document.createElement("a");    
        a.href = url;    
        a.download = "评测结果.xlsx";    
        document.body.appendChild(a);    
        a.click();    
    })  
    .catch((error) => {  
        console.error('Error downloading file: ', error);  
    }); 
    }
  },
};
</script>
<style lang="less" scoped>
.exam {
  padding: 0px 40px;
  .page {
    margin-top: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
  }
}
</style>
