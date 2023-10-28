<!-- 用户登录界面 -->
<template>
    <div id="login" @keyup.enter="login()" >
        <div class="bg"></div>
        <el-row class="main-container">
            <el-col :lg="8" :xs="16" :md="10" :span="10">
                <div class="top" style="color: black">
                    <span class="el-icon-a-061 title"> 员工职业发展行为测试系统</span>
                </div>
                <br />
                <div class="bottom">
                    <div class="container">
                        <p class="title">账 号 登 录</p>
                        <el-form
                            :label-position="labelPosition"
                            label-width="80px"
                            :model="formLabelAlign"
                        >
                            <el-form-item label="用户名" class="custom-form-item">
                                <el-input
                                    v-model="formLabelAlign.username"
                                    placeholder="请输入UASS或8位员工编号"
                                ></el-input>
                            </el-form-item>
                            <el-form-item label="密码">
                                <el-input
                                    v-model="formLabelAlign.password"
                                    placeholder="请输入密码"
                                    type="password"
                                    @keyup.enter="login()" 
                                ></el-input>
                            </el-form-item>
                            <div class="submit">
                                <el-button
                                    type="primary"
                                    class="row-login"
                                    @click="login()"
                                    >登录</el-button
                                >
                            </div>
                        </el-form>
                    </div>
                </div>
            </el-col>
        </el-row>
    </div>
</template>

<script>
import { mapState } from "vuex";
export default {
    name: "login",
    data() {
        return {
            labelPosition: "left",
            formLabelAlign: {
                username: "",
                password: "",
            },
        };
    },
    methods: {
        //用户登录请求后台处理
        login() {
            if (
                this.formLabelAlign.username == undefined ||
                this.formLabelAlign.username == ""
            ) {
                this.$message("请输入用户名");
                return;
            }
            // if (
            //     !/^\d+$/.test(this.formLabelAlign.username) ||
            //     this.formLabelAlign.username.toString().length != 8
            // ) {
            //     this.$message("用户名有误");
            //     return;
            // }
            if (this.formLabelAlign.password == "") {
                this.$message("请输入密码");
                return;
            }
            // alert(require('crypto').createHash('sha256').update(this.formLabelAlign.password).digest('hex'))
            this.$axios({
                url: `/api/login`,
                method: "post",
                data: {
                    username:this.formLabelAlign.username,
                    password:require('crypto').createHash('sha256').update(this.formLabelAlign.password).digest('hex'),
                },
            })
                .then((res) => {
                    let resData = res.data.data;
                    if (resData != null)   {
                            this.$cookies.set("userId", resData.userId);
                            this.$cookies.set("userName", resData.userName);
                            this.$cookies.set("role", resData.role);
                            if (resData.userUass == "admin"){
                                this.$message({
                                    message: '登陆成功',
                                    type: 'success'
                                }),
                                this.$router.push({ path: "/index" });
                            }
                            else {
                                if (this.formLabelAlign.password == "123456"){
                                    this.$message({
                                        message: '登陆成功，请修改初始密码',
                                        type: 'success'
                                    }),
                                    this.$router.push({ path: "/pass" });
                                }
                                else{
                                    this.$message({
                                        message: '登陆成功',
                                        type: 'success'
                                    }),
                                    this.$router.push({ path: "/user" });
                                }
                            }
                    }
                    if (resData == null) {
                        //错误提示
                        this.$message({
                            showClose: true,
                            type: "error",
                            message: "用户名或者密码错误",
                        });
                    }
                })
                .catch((e) => {
                    console.log(e);
                    if (
                        e.response == undefined ||
                        e.response.data == undefined
                    ) {
                        this.$message({
                            showClose: true,
                            message: e,
                            type: "error",
                            duration: 5000,
                        });
                    } else {
                        this.$message({
                            showClose: true,
                            message: e.response.data,
                            type: "error",
                            duration: 5000,
                        });
                    }
                });
        },
    },
    computed: mapState(["userInfo"]),
    mounted() {},
};
</script>

<style lang="less" scoped>
// .remind {
//     border-radius: 4px;
//     padding: 10px 20px;
//     display: flex;
//     position: fixed;
//     right: 20px;
//     bottom: 50%;
//     flex-direction: column;
//     color: #606266;
//     background-color: #fff;
//     border-left: 4px solid #409eff;
//     box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
// }
.container {
    margin-bottom: 32px;
}
.container .el-radio-group {
    margin: 30px 0px;
}
a:link {
    color: #ff962a;
    text-decoration: none;
}
#login {
    font-size: 14px;
    color: #000;
    background-color: #fff;
}
#login .bg {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    overflow-y: auto;
    height: 100%;
    background: url("../../assets/img/loginbg.jpg") center top / cover no-repeat;
    background-color: #b6bccdd1 !important;
}
#login .main-container {
    display: flex;
    justify-content: center;
    align-items: center;
}
#login .main-container .top {
    margin-top: 100px;
    font-size: 30px;    
    display: flex;
    justify-content: center;
}
#login .main-container .top span {
    color: rgb(247, 247, 242);
}

#login .top .icon-kaoshi {
    font-size: 80px;
}
#login .top .title {
    margin-top: 20px;
}
#login .bottom {
    display: flex;
    justify-content: center;
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    opacity: 0.85;
}
#login .bottom .title {
    text-align: center;
    font-size: 30px;
}
.bottom .container .title {
    margin: 30px 0px;
}

.bottom .container el-form{
    font-size: 25px;
}

.bottom .submit .row-login {
    width: 100%;
    background-color: #04468b;
    border-color: #04468b;
    margin: 20px 0px 10px 0px;
    padding: 15px 20px;
}
.bottom .submit {
    display: flex;
    justify-content: center;
}
</style>
