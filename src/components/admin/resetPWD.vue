//查询所有题库
<template>
  <div class="exam">
    <el-form :inline="true" class="demo-form-inline"  >
      <el-form-item label="用户编号">
        <el-input v-model="userId" placeholder="请输入用户8位员工编号"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="reSetPWD()"  style="font-size: 20px;">密码重置</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
export default {
  name:"exam",
  data() {
    return {
        userId:"",
    };
  },
  created() {
  },
  methods: {
    reSetPWD(){
      this.$axios(
        `/api/admin/${this.userId}`
      )
        .then((res) => {
          let resData = res.data.data;
          if (resData != null)   {
              this.$message({
                message: '密码已重置',
                type: 'success'
              })
            }
          else{
            this.$message({
              message: '用户不存在',
              type: 'error'
            })
          }
        },)
    },
  }
};
</script>
<style lang="less" scoped>
.exam {
  padding: 0px 40px;
  


}

</style>
