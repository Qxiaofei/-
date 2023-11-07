<!--考生答题界面-->
<template>
    <div id="answer">
        <!--顶部信息栏-->
        <!-- <div class="top">
            <ul class="item">
                <li>
                    <i class="el-icon-a-061" style="font-size: 32px;">
                        开始评价
                    </i>
                </li>
            </ul>
        </div> -->
        <div class="flexarea">
            <!--左边题目编号区-->
            <transition name="slider-fade">
                <div class="left" v-if="slider_flag">
                    <div class="l-top">
                        <a>当前被评价人：{{bpjName}}</a>
                    </div>
                    <ul class="l-top">
                        <li>
                            <a href="javascript:;"></a>
                            <span>当前</span>
                        </li>
                        <li>
                            <a href="javascript:;"></a>
                            <span>未答</span>
                        </li>
                        <li>
                            <a href="javascript:;"></a>
                            <span>已答</span>
                        </li>
                    </ul>
                    <div class="l-bottom">
                        <div class="item">
                            <ul>
                                <li
                                    v-for="(list, index1) in questions"
                                    :key="index1"
                                >
                                    <a
                                        href="javascript:;"
                                        @click="change(index1)"
                                        :class="{
                                            border:
                                                index == index1,
                                            bg:
                                                questions[index1].isClick ==true,
                                        }"
                                    >
                                        {{ index1 + 1 }}
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <el-button type="primary" style="width: 100%;font-size: 22px;margin: 25px 0 0 0;" icon="el-icon-a-061" @click="finishExam()">提交</el-button>
                    </div>
                </div>
            </transition>
            <!--右边选择答题区-->
            <transition name="slider-fade">
                <div class="right">
                    <div class="content">
                        <p class="topic">
                            <span class="number">{{ number }}</span>{{ showQuestion }}
                        </p>
                        <div>
                            <el-radio-group
                                v-model="radio[index]"
                                @change="getChangeLabel"
                            >
                                <el-radio :label="1" ><a>几乎从不</a></el-radio>
                                <el-radio :label="2"><a>极少</a></el-radio>
                                <el-radio :label="3"><a>偶尔</a></el-radio>
                                <el-radio :label="4"><a>很少</a></el-radio>
                                <el-radio :label="5"><a>间或</a></el-radio>
                                <el-radio :label="6"><a>多次</a></el-radio>
                                <el-radio :label="7"><a>还算经常</a></el-radio>
                                <el-radio :label="8"><a>经常</a></el-radio>
                                <el-radio :label="9"><a>通常</a></el-radio>
                                <el-radio :label="10"><a>几乎总是</a></el-radio>
                            </el-radio-group>
                        </div>
                    </div>
                    <div class="operation">
                        <ul class="end">
                            <li @click="previous()">
                                <span>上一题</span>
                            </li>
                            <li @click="next()">
                                <span>下一题</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </transition>
        </div>
    </div>
</template>

<script>
import { mapState } from "vuex";
export default {
    data() {
        return {
            role:0,//评价模式，1为自评，2为他评
            questions:{},
            showQuestion: [], //当前显示题目信息
            score: 0, //答题总分数
            bg_flag: false, //已答标识符,已答改变背景色
            isFillClick: false, //选择题是否点击标识符
            slider_flag: true, //左侧显示隐藏标识符
            radio: [], //保存考生所有选择题的选项
            title: "请选择正确的选项",
            index: 0, //全局index
            bpjName:"",
            userInfo: {
                //用户信息
                name: null,
                id: null,
            },
            examData: {
                //考试信息
                // source: null,
                // totalScore: null,
            },
            number: 1, //题号
            topic1Answer: [], //学生选择题作答编号,
        };
    },
    created() {
        this.getExamData();
    },
    methods: {
        finishExam() {
            var i = 0;
            for(i;i<this.questions.length;i++){
                if (this.questions[i]["isClick"] != true){
                    alert("请全部评测完成后再提交");
                    break;
                }
            }
            if (i>=this.questions.length){
                this.commit();    
            }
        },
        getExamData() {
            //获取当前试卷所有信息
            this.bpjName = this.$route.query.name;
            let role = this.$route.query.role; //获取路由传递过来的考试标志
            this.role = role;
            let bpjId = this.$route.query.Id;
            let pjId = this.$cookies.get("userId");
            this.$axios(`/api/Qexams/${role}/${pjId}/${bpjId}`).then((res) => {
                if (res.data.code == 10000) {
                    alert("该评价人已评价完毕，不可再次评价"),
                    this.$router.push({
                        path: "/user",
                    });
                } 
                else{
                    this.questions= res.data.data;
                    this.showQuestion = this.questions[0].qu;
                }
            });
        },
        change(index) {
            //选择题
            this.index = index;
            this.isFillClick = true;
            let len = this.questions.length;
            if (this.index < len) {
                if (this.index <= 0) {
                    this.index = 0;
                }
                // console.log(`总长度${len}`);
                // console.log(`当前index:${index}`);
                this.showQuestion = this.questions[this.index].qu; //获取题目信息
                this.number = this.index + 1;
            } else if (this.index >= len) {
                this.index = len-1;
            }
        },
    
        getChangeLabel(val) {
            //获取选择题作答选项
            this.radio[this.index] = val; //当前选择的序号
            this.questions[this.index]["isClick"] = true;
        },
        previous() {
            //上一题
            this.index--;
            this.change(this.index);
 
        },
        next() {
            //下一题
            this.index++;
            this.change(this.index);
        },
        commit() {
            var i =0;
            this.score = 0;
            for (i;i<this.questions.length;i++){
                this.score += this.radio[i];
            }
            // this.$router.push({ path: "/student" });
            //提交成绩信息
            switch(this.role){
                case '1':
                    this.$axios({
                        url: "/api/selfExamsScore",
                        method: "put",
                        data: {
                        selfevaluation:this.score,
                        userId:this.$cookies.get("userId"),
                    },
                    }).then((res) => {
                        if (res.data.code == 200) {
                            alert("提交成功"),
                            this.$router.push({
                                path: "/user",
                            });
                        }
                    });
                    break;
                case '2':
                    this.$axios({
                        url: "/api/othersExamsScore",
                        method: "put",
                        data: {
                        score:this.score,
                        bpjid:this.$route.query.Id,
                        pjid:this.$cookies.get("userId"),
                    },
                    }).then((res) => {
                        if (res.data.code == 200) {
                            this.$message({
                                    message: '提交成功',
                                    type: 'success'
                                }),
                            this.$router.push({
                                path: "/user",
                            });
                        }
                    });
                    break;
            }
            
        },
    },
    computed: mapState(["isPractice"]),
};
</script>

<style lang="less">
.iconfont.icon-time {
    color: CornflowerBlue;
    margin: 0px 6px 0px 20px;
}
.analysis {
    margin-top: 20px;
    .right {
        color: #2776df;
        font-size: 18px;
        border: 1px solid #2776df;
        padding: 0px 6px;
        border-radius: 4px;
        margin-left: 20px;
    }
    ul li:nth-child(2) {
        margin: 20px 0px;
    }
    ul li:nth-child(3) {
        padding: 10px;
        background-color: #d3c6c9;
        border-radius: 4px;
    }
}
.analysis span:nth-child(1) {
    font-size: 18px;
}
.mark {
    position: absolute;
    width: 4px;
    height: 4px;
    content: "";
    background-color: red;
    border-radius: 50%;
    top: 0px;
    left: 22px;
}
.border {
    position: relative;
    border: 1px solid #ff90aa !important;
}
.bg {
    background-color: #5188b8 !important;
}
.fill .el-input {
    display: inline-flex;
    width: 150px;
    margin-left: 20px;
    .el-input__inner {
        border: 1px solid transparent;
        border-bottom: 1px solid #eee;
        padding-left: 20px;
    }
}
/* slider过渡效果 */
.slider-fade-enter-active {
    transition: all 0.3s ease;
}
.slider-fade-leave-active {
    transition: all 0.3s cubic-bezier(1, 0.5, 0.8, 1);
}
.slider-fade-enter,
.slider-fade-leave-to {
    transform: translateX(-100px);
    opacity: 0;
}

.operation .end li {
    text-align: center;
    width: 100px;
    height: 35px;
    cursor: pointer;
    margin: 0 100px;
    font-size: 25px;
    border-radius: 15%;
    background-color: CornflowerBlue;
    color: #fff;
}
.operation {
    background-color: #fff;
    border-radius: 4px;
    padding: 10px 0px;
    margin-right: 10px;
}
.operation .end {
    display: flex;
    justify-content: center;
    align-items: center;
    color: CornflowerBlue;
}
.content .number {
    font-size: 20px;
    color:floralwhite;
    display: inline-flex;
    justify-content: center;
    align-items: center;
    width: 25px;
    height: 25px;
    background-color: CornflowerBlue;
    border-radius: 4px;
    margin-right: 4px;
}
.content {
    padding: 0px 20px;
}
.content .topic {
    padding: 20px 0px;
    padding-top: 30px;
    font-size: 25px;
}
.right .content {
    background-color: #fff;
    margin: 10px;
    margin-left: 0px;
    height: 470px;
}
.content .el-radio-group label {
    color: #000;
    margin: 5px 0px;
}
.content .el-radio-group {
    display: flex;
    flex-direction: column;
}
.right .title p {
    margin-left: 20px;
}
.flexarea {
    display: flex;
}
.flexarea .right {
    flex: 1;
}
.auto-right {
    margin-left: auto;
    color: #2776df;
    margin-right: 10px;
}
.right .title {
    margin-right: 10px;
    padding-right: 30px;
    display: flex;
    margin-top: 10px;
    background-color: #fff;
    height: 50px;
    line-height: 50px;
}
.clearfix {
    clear: both;
}
.l-bottom .final {
    cursor: pointer;
    display: inline-block;
    text-align: center;
    background-color: CornflowerBlue;
    width: 240px;
    margin: 20px 0px 20px 10px;
    border-radius: 4px;
    height: 30px;
    line-height: 30px;
    color: #fff;
    margin-top: 22px;
}
#answer .left .item {
    padding: 0px;
    font-size: 16px;
}
.l-bottom {
    border-radius: 4px;
    background-color: #fff;
    padding-top: 20px;
}
.l-bottom .item p {
    margin-bottom: 15px;
    margin-top: 10px;
    color: #000;
    margin-left: 10px;
    letter-spacing: 2px;
}
.l-bottom .item li {
    width: 15%;
    margin-left: 5px;
    margin-bottom: 10px;
}
.l-bottom .item {
    display: flex;
    flex-direction: column;
}
.l-bottom .item ul {
    margin-left: 20px;
    width: 100%;
    margin-bottom: -8px;
    display: flex;
    justify-content: left;
    flex-wrap: wrap;
}
.l-bottom .item ul li a {
    position: relative;
    justify-content: center;
    display: inline-flex;
    align-items: center;
    width: 30px;
    height: 30px;
    border-radius: 50%;
    background-color: #fff;
    border: 1px solid #eee;
    text-align: center;
    color: #000;
    font-size: 16px;
}
.left .l-top {
    display: flex;
    justify-content: space-around;
    padding: 16px 0px;
    border: 1px solid #eee;
    border-radius: 4px;
    margin-bottom: 10px;
    background-color: #fff;
}
.left {
    width: 260px;
    height: 100%;
    margin: 10px 10px 0px 10px;
}
.left .l-top li:nth-child(2) a {
    border: 1px solid #eee;
}
.left .l-top li:nth-child(3) a {
    background-color: #5188b8;
    border: none;
}
.left .l-top li:nth-child(4) a {
    position: relative;
    border: 1px solid #eee;
}
.left .l-top li:nth-child(4) a::before {
    width: 4px;
    height: 4px;
    content: " ";
    position: absolute;
    background-color: red;
    border-radius: 50%;
    top: 0px;
    left: 16px;
}
.left .l-top li {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}
.left .l-top li a {
    display: inline-block;
    padding: 10px;
    border-radius: 50%;
    background-color: #fff;
    border: 1px solid #ff90aa;
}
#answer .top {
    background-color: CornflowerBlue;
}
#answer .item {
    color: #fff;
    display: flex;
    padding: 20px;
    font-size: 20px;
}
#answer .top .item li:nth-child(1) {
    margin-right: 10px;
}
#answer .top .item li:nth-child(3) {
    position: relative;
    margin-left: auto;
}
#answer {
    padding-bottom: 30px;
    min-height: 85vh;
}
.icon20 {
    font-size: 20px;
    font-weight: bold;
}
.item .msg {
    padding: 10px 15px;
    border-radius: 4px;
    top: 47px;
    right: -30px;
    color: #6c757d;
    position: absolute;
    border: 1px solid rgba(0, 0, 0, 0.15);
    background-color: #fff;
}
.item .msg p {
    font-size: 16px;
    width: 200px;
    text-align: left;
}
.el-radio__inner {  
  width: 20px;  
  height: 20px;  
}
.el-radio a {  
  font-size: 20px;
}
</style>
