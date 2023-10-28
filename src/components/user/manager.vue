<!--管理中心-->
<template>
  <div id='manager'>
    <el-form :model="ruleForm2" status-icon :rules="rules2" ref="ruleForm2" label-width="100px" class="demo-ruleForm">
      <h3 class="alter">修改你的密码</h3>
        <el-form-item label="密码" prop="pass" class="pass">
        <el-input type="password" v-model="ruleForm2.pass" autocomplete="off" placeholder="不少于8位，包含大写字母、小写字母和数字"></el-input>
      </el-form-item>
      <el-form-item label="确认密码" prop="checkPass">
        <el-input type="password" v-model="ruleForm2.checkPass" autocomplete="off" placeholder="不少于8位，包含大写字母、小写字母和数字"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm('ruleForm2')" icon="el-icon-a-051" style="font-size: 20px;">提交</el-button>
        <el-button @click="resetForm('ruleForm2')" icon="el-icon-a-031" style="font-size: 20px;">重置</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
  export default {
    data() {
      var validatePass = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入密码'));
        } else {
          if (!this.validatePassword(this.ruleForm2.pass)){
            callback(new Error('密码不符合规范'));
          } else{
          if (this.validatePassword(this.ruleForm2.pass)) {
            this.$refs.ruleForm2.validateField('checkPass');
          }}
          callback();
        }
      };
      var validatePass2 = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请再次输入密码'));
        } else if (value !== this.ruleForm2.pass) {
          callback(new Error('两次输入密码不一致!'));
        } else {
          callback();
        }
      };
      return {
        ispass: true,
        ruleForm2: {
          pass: '',
          checkPass: ''
        },
        rules2: {
          pass: [
            { validator: validatePass, trigger: 'blur' }
          ],
          checkPass: [
            { validator: validatePass2, trigger: 'blur' }
          ]
        }
      };
    },
    methods: {
      validatePassword(password) {
        // 检查密码长度 
        if (password.length < 8) { return false;  } 
        // 检查是否包含至少一个数字  
        if (!/[0-9]/.test(password)) {  return false; }  
         // 检查是否包含至少一个大写字母  
        if (!/[A-Z]/.test(password)) {  return false;  }  
        // 检查是否包含至少一个小写字母  
        if (!/[a-z]/.test(password)) {  return false;  } 
        // 如果所有条件都满足，则返回true  
        return true;  
      },
      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            this.$axios({ //修改密码
              url: '/api/userPWD',
              method: 'put',
              data: {
                passWord: require('crypto').createHash('sha256').update(this.ruleForm2.pass).digest('hex'),
                userId: this.$cookies.get("userId")
              }
            }).then(res => {
              if(res.data != null ) { //修改成功提示
                this.$message({
                  message: '密码修改成功...',
                  type: 'success'
                }),
                this.$router.push({ path: "/user" });
              }
            })
          } else {
            console.log('error submit!!');
            return false;
          }
        });
      },
      resetForm(formName) {
        this.$refs[formName].resetFields();
      }
    }
  }
</script>

<style scoped>
#manager .pass  label{
  color: red;
  font-size: 20px;
}
#manager {
  width: 600px;
  margin: 0 auto;
  margin-top: 100px;
  text-align: center;
  /* margin-bottom: 300px; */
  min-height:75vh;
}
#manager .alter {
  margin: 30px 0px;
}
</style>