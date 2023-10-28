<!--
 * @Description: 
 * @Author: Rabbiter
 * @Date: 2023-03-08 20:38:49
-->
<template>
    <div class="index">
        <div class="hello">
            <!-- <i
                class="iconfont el-icon-a-011"
                style="font-size: 32px; color: black"
            ></i>
            <span> 很高兴遇见你, {{ user.userName }}。</span> -->
        </div>
        <div style="margin-top: 20px; font-size: 24px">
            <h1>欢迎登录 员工职业发展行为测试系统后台</h1>
            <br />
            <!-- <img
                :src="require('@/assets/img/admin_bg.jpg')"
                style="margin-top: 10px; width: 60vw"
            /> -->
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            user: {
                //用户信息
                userName: null,
                userId: null,
            },
        };
    },
    created() {
        this.getUserInfo();
    },
    methods: {
        getUserInfo() {
            //获取用户信息
            let userName = this.$cookies.get("userName");
            let userId = this.$cookies.get("userId");
            this.user.userName = userName;
            this.user.userId = userId;
        },
    },
};
</script>


<style lang="less" scoped>
.index {
    margin-left: 70px;
    .hello {
        font-size: 20px;
        color: #726f70;
    }
}
</style>

