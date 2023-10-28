// 我的试卷页面
<template>
    <div id="myExam">
        <div class="title">   </div>
        <div class="wrapper">
            <ul class="top">
                <li class="order"><i class="el-icon-a-041" style="font-size: 20px;"> 待评测人员列表（按照姓名拼音排序）</i></li>
            </ul>
            <!-- 展示自评的信息 -->
            <ul v-if="selfEva[0]" class="paper" >
                <li  class="item"
                    v-for="(item, index) in selfEva"
                    :key="index">
                    <h4>{{ item.name }}-金融科技部</h4>
                    <a v-if="!item.selfevaluation" class = "start" @click="toExamMsg1()" >开始自评</a>
                    <a v-if="item.selfevaluation" class = "end">已自评</a>
                </li>
            </ul> 
            <hr v-if="selfEva[0]">
            <!-- 展示未测评的信息 -->
            <ul class="paper" >
                <li
                    class="item"
                    v-for="(item, index) in otherEva1"
                    :key="index"
                >
                    <h4>{{ item.bpjName }}-金融科技部</h4>
                    <a class = "start" @click="toExamMsg2(item)" >开始评测</a>
                </li>
            </ul>
            <hr>
             <ul class="top">
                <li class="order"><i class="el-icon-a-041" style="font-size: 20px;"> 已评测人员列表（按照姓名拼音排序）</i></li>
            </ul>
            <!-- 展示已测评的信息 -->
            <ul class="paper" >
                <li
                    class="item"
                    v-for="(item, index) in otherEva2"
                    :key="index"
                >
                    <h4 v-if="item.score">{{ item.bpjName }}-金融科技部</h4>
                    <a class = "end">已评测</a>
                </li>
            </ul>
        </div>
        <div style="height:20px"></div>
    </div>
</template>

<script>
export default {
    // name: 'myExam'
    data() {
        return {
            userName:[],
            selfEva:{},
            otherEva1: {},
            otherEva2: {},
            
        };
    },
    created() {
        this.userName = this.$cookies.get("userName")
        this.getExamInfo();
    },
    // watch: {

    // },
    methods: {
        //获取当前所有测评信息
        getExamInfo() {
            //获取是否需要自评
            this.$axios(
                `/api/selfExams/${this.$cookies.get("userId")}`
            )
                .then((res) => {
                    this.selfEva = res.data.data;
                    console.log(this.selfEva);
                })
                .catch((error) => {
                    console.log(error);
                });
            //获取未评测信息
            this.$axios(
                `/api/exams1/${this.$cookies.get("userId")}`
            )
                .then((res) => {
                    this.otherEva1 = res.data.data;
                    console.log(this.otherEva1);
                })
                .catch((error) => {
                    console.log(error);
                });
            //获取已评测
            this.$axios(
                `/api/exams2/${this.$cookies.get("userId")}`
            )
                .then((res) => {
                    this.otherEva2 = res.data.data;
                    console.log(this.otherEva2);
                })
                .catch((error) => {
                    console.log(error);
                });

        },
        //跳转到评测详情页
        toExamMsg1() {
            this.$router.push({
                path: "/answer",
                query: { role:1},
            });
        },
        toExamMsg2(exam2) {
            this.$router.push({
                path: "/answer",
                query: { Id:exam2.bpjId, role:2},
            });
        },
    },
};
</script>

<style lang="less" scoped>
.pagination {
    padding: 20px 0px 30px 0px;
    .el-pagination {
        display: flex;
        justify-content: center;
    }
}
.start{
    color: rgb(16, 132, 185);
    cursor: pointer;
    
}
hr{
    border-top: 0px solid slategray;  
}
.end{
        color:gray
}

.item .info i {
    margin-right: 5px;
    color: #0195ff;
}
.item .info span {
    margin-right: 14px;
}
.paper .item {
    width: 160px;
    border-radius: 4px;
    padding: 20px 20px;
    border: 1px solid #eee;
    box-shadow: 0 0 4px 2px rgba(217, 222, 234, 0.3);
    transition: all 0.6s ease;
    margin-left: 20px;
    margin-bottom: 20px;    
    text-align: center;
}
// .item {
// //   cursor: pointer;
// }
.paper .item:hover {
    box-shadow: 0 0 4px 2px rgba(140, 193, 248, 0.45);
    transform: scale(1.03);
}
.paper h4{
    margin-top: 0px;
    margin-left: 0px;
    // text-align: left;
}
.paper * {
    margin-left: 20px;
    margin-right: 20px;
    margin-top: 15px;
    margin-bottom: 15px;
}

.wrapper .paper {
    display: flex;
    justify-content: flex-start;
    flex-wrap: wrap;

}
.top .el-icon-search {
    position: absolute;
    right: 10px;
    top: 10px;
}
.top .icon {
    position: relative;
}
.wrapper .top {
    border-bottom: 1px solid #eee;
    margin-bottom: 0px;
}
#myExam .search-li {
    margin-left: auto;
}
.top .search-li {
    margin-left: auto;
}
.top li {
    display: flex;
    align-items: center;
}
.top .search {
    margin-left: auto;
    padding: 10px;
    border-radius: 4px;
    border: 1px solid #eee;
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
    transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
}
.top .search:hover {
    color: #0195ff;
    border-color: #0195ff;
}
.wrapper .top {
    display: flex;
}
.wrapper .top li {
    margin: 20px;
}
#myExam {
    width: 980px;
    margin: 0 auto;
    height: auto;
    min-height: 85vh;
    
}
#myExam .title {
    margin: 20px;
}
#myExam .wrapper {
    background-color: #fff;
    margin-bottom: 50px;
    min-height: 10vh;
}

</style>
