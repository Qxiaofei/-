<!--学生考试首页-->
<template>
    <div id="student">
        <el-row class="padding-50">
            <el-col :span="24">
                <ul class="list">
                    <img
                        src="@/assets/033.png"
                        style="
                            width: 35px;
                            height: 35px;
                            margin: 13px -15px 0 10px;
                            -webkit-user-drag: none;
                            -khtml-user-drag: none;
                            -moz-user-drag: none;
                            user-drag: none;
                        "
                    />

                    <li class="logo"><span>员工职业发展行为测试系统</span></li>

                    <li
                        class="right"
                        @mouseenter="flag = !flag"
                        @mouseleave="flag = !flag"
                    >
                        <el-row>
                            <el-col :span="12">
                                <el-avatar
                                    shape="square"
                                    :size="50"
                                    :src="require('../../assets/img/avatar.png')"
                                    style="margin: 5px 5px 0 0;  "
                                ></el-avatar>
                            </el-col>
                            <el-col :span="12">
                                <a
                                    href="javascript:;"
                                    style="font-size: 15px; font-weight: 600"
                                    ><i
                                        class="iconfont icon-Userselect icon"
                                    ></i
                                    >{{ user.userName }}</a
                                >
                                <div class="msg" v-if="flag">
                                    <p @click="manage()">修改密码</p>
                                    <p class="exit" @click="exit()">退出</p>
                                </div>
                            </el-col>
                        </el-row>
                    </li>
                </ul>
            </el-col>
        </el-row>
        <!--路由区域-->
        <div class="main">
            <router-view></router-view>
        </div>
    </div>
</template>

<script>
import { mapState } from "vuex";
export default {
    components: {
        "v-footer": myFooter,
    },
    data() {
        return {
            flag: false,
            user: {},
        };
    },
    created() {
        this.userInfo();
    },
    methods: {
        exit() {
            //退出登录
            this.$router.push({ path: "/" }); //跳转到登录页面
            this.$cookies.remove("userName"); //清除cookie
            this.$cookies.remove("userId");
            this.$cookies.remove("rb_token"); //清除cookie
            this.$cookies.remove("rb_role");
        },
        manage() {
            //跳转到修改密码页面
            this.$router.push({ path: "/manager" });
        },
        userInfo() {
            let userName = this.$cookies.get("userName");
            this.user.userName = userName;
        },
        exam() {
            //跳转考试模式
            let isPractice = false;
            this.$store.commit("practice", isPractice);
            this.$router.push({ path: "/student" });
        },
    },
    computed: mapState(["isPractice"]),
};
</script>

<style scoped>
.right .icon {
    margin-right: 6px;
}
#student .padding-50 {
    margin: 0 auto;
    padding: 0 50px;
    box-shadow: 0 0 10px 4px rgba(1, 149, 255, 0.1);
    background-color: #fff;
}
.list a {
    text-decoration: none;
    color: #334046;
    font-size: 18px;
}
li {
    list-style: none;
    height: 60px;
    line-height: 60px;
}
#student .list {
    display: flex;
}
#student .list li {
    padding: 0 20px;
    cursor: pointer;
}
#student .list li:hover {
    background-color: #0195ff;
    transition: all 2s ease;
}
#student .list li:hover a {
    color: #fff;
}
#student .list .right {
    margin-left: auto;
    position: relative;
}
#student .list li.right :hover a {
    color: #000;
}
#student .list .logo {
    display: flex;
    font-weight: bold;
    color: black;
    font-size: 28px;
}
#student .list .logo i {
    font-size: 50px;
}
.right .msg {
    text-align: center;
    position: absolute;
    top: 60px;
    left: 0px;
    display: flex;
    flex-direction: column;
    border-radius: 2px;
    border-bottom: 3px solid #0195ff;
    background-color: #fff;
}
.right .msg p {
    height: 40px;
    line-height: 40px;
    width: 105px;
}
.right .msg p:hover {
    background-color: #0195ff;
}
</style>
