import Vue from 'vue'
import Router from 'vue-router'
import HomeView from '../views/HomeView.vue'
import Login from '../views/Login.vue'
import Logout from '../views/Logout.vue'
import Register from '../views/Register.vue'
import store from '../store/index.js'
import DashboardView from '../views/DashboardView.vue'
import RecipeDetailsView from '../views/RecipeDetailsView.vue'
import MyRecipesView from '../views/MyRecipesView.vue'
import MyMealsView from '../views/MyMealsView.vue'
import MealEditorView from '../views/MealEditorView.vue'
import SearchView from '../views/SearchView.vue'
import MealPlanDetailsView from '../views/MealPlanDetailsView.vue'
import MyMealPlansView from '../views/MyMealPlansView.vue'
Vue.use(Router)

/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: '/search',
      name: 'search',
      component: SearchView,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: '/dashboard',
      name: 'dashboard',
      component: DashboardView,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/dashboard/recipe/:id',
      name: 'recipe-details',
      component: RecipeDetailsView,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: '/dashboard/myrecipes',
      name: 'my-recipes',
      component: MyRecipesView,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/dashboard/mymeals',
      name: 'my-meals',
      component: MyMealsView,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/dashboard/mealeditor/:id',
      name: 'meal-editor',
      component: MealEditorView,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/dashboard/mymealplans/',
      name: 'my-meal-plans',
      component: MyMealPlansView,
      meta: {
        requiresAuth: true
      },
    },
    {
      path: '/dashboard/meal-plan-details/:id',
      name: 'meal-plan-details',
      component: MealPlanDetailsView,
      meta: {
        requiresAuth: true
      }
    },

    {
      path: "/login",
      name: "login",
      component: Login,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/logout",
      name: "logout",
      component: Logout,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/register",
      name: "register",
      component: Register,
      meta: {
        requiresAuth: false
      }
    }
  ]
})

router.beforeEach((to, from, next) => {
  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && store.state.token === '') {
    next("/login");
  } else {
    // Else let them go to their next destination
    next();
  }
});

export default router;
