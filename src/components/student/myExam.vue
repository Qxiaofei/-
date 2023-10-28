// 我的试卷页面
<template>
    <div id="myExam">
        <div class="title">   </div>
        <div class="wrapper">
            <ul class="top">
                <li class="order"><i class="el-icon-a-041" style="font-size: 20px;"> 待评测人员列表</i></li>
            </ul>
            <!-- 展示自评的信息 -->
            <ul class="paper" >
                <li class="item">
                    <h4>{{ pagination[3].bpjName }}</h4>
                    <a v-if="!pagination[3].score" class = "start" @click="toExamMsg(pagination[3],1)" >开始自评</a>
                    <a v-if="pagination[3].score" class = "end">已自评</a>
                </li>
            </ul>
            <hr v-if="pagination">
            <!-- 展示他评的信息 -->
            <ul class="paper" >
                <li
                    class="item"
                    v-for="(item, index) in pagination"
                    :key="index"
                >
                    <h4>{{ item.bpjName }}</h4>
                    <a v-if="!item.score" class = "start" @click="toExamMsg(item,2)" >开始评测</a>
                    <a v-if="item.score" class = "end">已评测</a>
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
            pagination: {},
            
        };
    },
    created() {
        this.getExamInfo();
    },
    // watch: {

    // },
    methods: {
        //获取当前所有测评信息
        getExamInfo() {
            this.$axios(
                `/api/exams/${this.$cookies.get("userId")}`
            )
                .then((res) => {
                    this.pagination = res.data.data;
                    console.log(this.pagination);
                })
                .catch((error) => {
                    console.log(error);
                });
        },
        //跳转到试卷详情页
        toExamMsg(exam1,exam2) {
            this.$router.push({
                path: "/answer",
                query: { bpjName: exam1.bpjName , role:exam2},
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
// .paper {
//     // h4 {
//     //     cursor: pointer;
//     // }
// }
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
.wrapper .top .order {
    cursor: pointer;
}
.wrapper .top .order:hover {
    color: #0195ff;
    border-bottom: 2px solid #0195ff;
}
.wrapper .top .order:visited {
    color: #0195ff;
    border-bottom: 2px solid #0195ff;
}
.item .info i {
    margin-right: 5px;
    color: #0195ff;
}
.item .info span {
    margin-right: 14px;
}
.paper .item {
    width: 200px;
    border-radius: 4px;
    padding: 20px 30px;
    border: 1px solid #eee;
    box-shadow: 0 0 4px 2px rgba(217, 222, 234, 0.3);
    transition: all 0.6s ease;
    margin-left: 40px;
    margin-bottom: 20px;
}
// .item {
// //   cursor: pointer;
// }
.paper .item:hover {
    box-shadow: 0 0 4px 2px rgba(140, 193, 248, 0.45);
    transform: scale(1.03);
}
.paper .item .info {
    font-size: 14px;
    color: #88949b;
}
.paper .item .name {
    font-size: 14px;
    color: #88949b;
}
.paper * {
    margin: 20px;
    // text-align: center;
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
    margin-bottom: 20px;
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
}
#myExam .title {
    margin: 20px;
}
#myExam .wrapper {
    background-color: #fff;
    margin-bottom: 50px;
    min-height: 500px;
}

</style>
