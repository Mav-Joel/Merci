<template>
  <div id="app">
    <v-app>
      <v-main>
        <v-container fluid fill-height>
          <v-layout align-center justify-center>
            <v-flex xs12 sm8 md4>
              <div class="justify-center">
                <v-card class="align-center justify-center">
                  <div class="container">
                    <div class="card">
                      <div class="imgBx">
                        <img src="file:///C:/Users/barba/OneDrive/Bureau/1077114.png">
                      </div>
                      <div class="contentBx">
                        <h2>Name </h2>
                        <p>{{ user.username }}</p>
                        <p>{{ user.email }}</p>
                        <p>{{ out }} hours</p>
                        <p>{{ clocked }}</p>
                        <br />
                        <v-card-actions>
                          <v-btn outlined rounded text v-on:click="postClocks()">
                            Start
                          </v-btn>
                        </v-card-actions>
                        <v-card-actions>
                          <v-btn outlined rounded text v-on:click="stopClocks()"> Stop </v-btn>
                        </v-card-actions>

                        <div class="color">
                          <h3>workingtime :</h3>
                          <span></span>
                          <span></span>
                          <span></span>
                        </div>
                        <a href="#">clock start</a>
                        <a href="#">clock stop</a>
                      </div>
                    </div>
                  </div>

                </v-card>
              </div>
            </v-flex>
          </v-layout>
        </v-container>
      </v-main>
    </v-app>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      user: {
        username: "username",
        email: "email",
      },
      out: 0,
      clocked: "Not clocked in",

      time: new Date(),
      status: false,
    };
  },

  mounted() {

    localStorage.present = false
    axios({
      method: "get",
      url: `http://localhost:4000/api/users/${localStorage.id}`,
      format: "json",
      headers: {
        Authorization: `Bearer ${localStorage.token}`,
      },
    }).then(({ data }) => {
      this.user.email = data.data.email;
      this.user.username = data.data.username;

      console.log(this.user);
    });
  },

  methods: {
    postClocks() {
      const headers = {
        Authorization: `Bearer ${localStorage.token}`,
      };

      const milliSecDate = new Date().getTime();
      const currentTime = new Date(milliSecDate)
      console.log(currentTime)
      localStorage.start = currentTime.getHours()

      axios.post('http://localhost:4000/api/clocks/', {
        clock: {
          time: currentTime,
          status: true,
          user: localStorage.id
        }
      }, { headers }).then(({ data }) => {
        console.log(data)
        this.clocked = "Clocked in"

      })
    },

    stopClocks() {
      const headers = {
        Authorization: `Bearer ${localStorage.token}`,
      };

      const milliSecDate = new Date().getTime();
      const currentTime = new Date(milliSecDate)
      this.out = currentTime.getHours() - localStorage.start

      axios.post('http://localhost:4000/api/clocks/', {
        clock: {
          time: currentTime,
          status: false,
          user: localStorage.id
        }
      }, { headers }).then(({ data }) => {
        console.log(data)
        this.clocked = "Clocked out"
      })
    },
  },
};
</script>
<style>
.v-main {
  max-width: 100%;
  max-height: 50%;
}

.center {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 5vh;
}


@import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');


* {
  font-family: 'Poppins', sans-serif;
}

body {
  display: flex;
  justify-content: center;
  align-items: center;
}

.container {
  position: relative;
}

.container .card {
  position: relative;
  width: 320px;
  height: 450px;
  background: #232323;
  border-radius: 20px;
  overflow: hidden;
}

.container .card:before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #2843dc;
  clip-path: circle(150px at 80% 20%);
  transition: 0.5s ease-in-out;
}

.container .card:hover:before {
  clip-path: circle(300px at 80% -20%);
}

.container .card:after {
  position: absolute;
  top: 30%;
  left: -20%;
  font-size: 12em;
  font-weight: 800;
  font-style: italic;
  color: rgba(255, 255, 25, 0.05)
}

.container .card .imgBx {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  z-index: 10000;
  width: 100%;
  height: 220px;
  transition: 0.5s;
}

.container .card:hover .imgBx {
  top: 0%;
  transform: translateY(0%);

}

.container .card .imgBx img {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%) rotate(-25deg);
  width: 270px;
}

.container .card .contentBx {
  position: absolute;
  bottom: 0;
  width: 100%;
  height: 100px;
  text-align: center;
  transition: 1s;
  z-index: 10;
}

.container .card:hover .contentBx {
  height: 210px;
}

.container .card .contentBx h2 {
  position: relative;
  font-weight: 600;
  letter-spacing: 1px;
  color: #fff;
  margin: 0;
}

.container .card .contentBx p {
  position: relative;
  font-weight: 600;
  letter-spacing: 1px;
  color: #fff;
  margin: 0;
}

.container .card .contentBx .size,
.container .card .contentBx .color {
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 8px 20px;
  transition: 0.5s;
  opacity: 0;
  visibility: hidden;
  padding-top: 0;
  padding-bottom: 0;
}

.container .card:hover .contentBx .size {
  opacity: 1;
  visibility: visible;
  transition-delay: 0.5s;
}

.container .card:hover .contentBx .color {
  opacity: 1;
  visibility: visible;
  transition-delay: 0.6s;
}

.container .card .contentBx .size h3,
.container .card .contentBx .color h3 {
  color: #fff;
  font-weight: 300;
  font-size: 14px;
  text-transform: uppercase;
  letter-spacing: 2px;
  margin-right: 10px;
}

.container .card .contentBx a {
  display: inline-block;
  padding: 10px 20px;
  margin: 0 5px;
  background: #fff;
  border-radius: 4px;
  margin-top: 10px;
  text-decoration: none;
  font-weight: 600;
  color: #111;
  opacity: 0;
  transform: translateY(50px);
  transition: 0.5s;
  margin-top: 0;
}

.container .card:hover .contentBx a {
  opacity: 1;
  transform: translateY(0px);
  transition-delay: 0.75s;

}
</style>
