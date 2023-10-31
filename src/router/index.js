import Vue from 'vue'
import Router from 'vue-router'
Vue.use(Router)



const VueRouterPush = Router.prototype.push

Router.prototype.push = function push (to) {
  return VueRouterPush.call(this, to).catch(err => err)
}

export default new Router({
  routes: [
    {
      path: '/',
      name: 'login', //登录界面
      component: () => import('@/components/common/login')
    },
    {
      path: '/index', //管理端
      component: () => import('@/components/admin/index'),
      children: [
        {
          path: '/', //首页默认路由
          component: () => import('@/components/common/hello')
        },
        {
          path: '/selectExam', //查询测评结果
          component: () => import('@/components/admin/selectExam')
        },
        {
          path: '/resetPWD', //密码重置
          component: () => import('@/components/admin/resetPWD')
        }
      ]
    },
    {
      path: '/user',
      component: () => import('@/components/user/index'),
      children: [
        {path:"/",component: ()=> import('@/components/user/myExam')},
        {path: '/answer',component: () => import('@/components/user/answer')},
        {path: '/manager', component: () => import('@/components/user/manager')},
      ]
    },
    {
      path: '/pass',
      component: () => import('@/components/user/index'),
      children: [
        {path:"/",component: ()=> import('@/components/user/manager')},
      ]
    }
    
  ]
})
