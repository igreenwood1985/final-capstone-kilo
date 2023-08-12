<template>
  <div id="login">
    <form @submit.prevent="login">
      <div class="form-elements">

         
      <h1 >KiloPlanner</h1>
      <h2>Welcome</h2>
      <div role="alert" v-if="invalidCredentials" class="invalid-entry">
        Invalid username and password!
      </div>
      <div role="alert" v-if="this.$route.query.registration" class="invalid-entry">
        Thank you for registering, please sign in.
      </div>
      <div class="form-input-group">
        <label for="username">Username</label>
        <b-input type="text" size="sm" id="username" v-model="user.username" required autofocus />
      </div>
      <div class="form-input-group">
        <label for="password">Password</label>
        <b-input type="password" size="sm" id="password" v-model="user.password" required />
      </div>
      <b-button type="submit" variant="primary" class="sign-in-btn">Sign in</b-button>
      <p>
      <router-link :to="{ name: 'register' }" class="sign-up-link"><br>Need an account? Sign up.</router-link></p>
      </div>
    </form>
  </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/dashboard");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>

<style scoped>

h1 {
  font-size: 1rem;
  text-decoration: underline;
  font-family: saira;
}

h2 {
  font-size: 1.5rem;
  font-family: bitter;
}
.form-input-group {
  margin-bottom: 1rem;
  font-family: bitter;
}
label {
  margin-right: 0.5rem;
}

form {
  border: 2px solid black;
  text-align: center;
  height: 86.29vh;
  background-image: linear-gradient(to right, #e5e7eb, #0d6efd);
  display: flex;
  align-items: center;
  justify-content: center;
}

.form-elements {
  border: 1px solid gray;
  background-color: white;
  border-radius: 20px;
  padding: 50px;
  height: 25rem;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-around;
}

.invalid-entry {
  color: red;
}

.sign-in-btn, .sign-up-link {
  font-family: montserrat;
}

</style>