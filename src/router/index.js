import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '../views/Login.vue'
import Register from '../views/Register.vue'
import RegisterSuccess from '../views/RegisterSuccess.vue'
import About from '../views/About.vue'
import UserPage from '../views/UserPage.vue'
import Settings from '../views/Settings.vue'
import Analyse from '../views/Analyse.vue'
import NewTool from '../views/NewTool.vue'
import NewParty from '../views/newParty.vue'
import JoinParty from '../views/joinParty.vue'
import TierTool from '../components/TierTool';
import CompTool from '../components/CompTool';
import Info from '../views/Info';

Vue.use(VueRouter)

const routes = [{
    path: '/login',
    name: 'login',
    component: Login
  },
  {
    path: '/',
    redirect: '/login'
  },
  {
    path: '/register',
    component: Register,
  },
  {
    path: '/register/success',
    component: RegisterSuccess,
  },
  {
    path: '/register/help',
    component: Info
  },
  {
    path: '/about',
    name: 'about',
    component: About
  },
  {
    path: '/user/:id',
    name: 'user',
    component: UserPage,
    children: [{
      path: '0/:tool_id',
      component: TierTool
    },
    {
      path: '3/:tool_id',
      component: CompTool
    }]
  },
  {
    path: '/user/:id/settings',
    name: 'settings',
    component: Settings
  },
  {
    path: '/user/:id/analysis',
    name: 'analyse',
    component: Analyse
  },
  {
    path: '/user/:id/:party_id/new',
    name: 'newtool',
    component: NewTool
  },
  {
    path: '/user/:id/create',
    name: 'newparty',
    component: NewParty
  },
  {
    path: '/user/:id/join',
    name: 'joinparty',
    component: JoinParty
  },
  {
    path: '*',
    component: Register
  }
]

const router = new VueRouter({
  routes,
  mode: 'history'
})

export default router