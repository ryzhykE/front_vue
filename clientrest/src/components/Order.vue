<template>
    <div class="container">
        <div v-if="success != 'success'">
            <p>Hello {{ login }} !</p>
            <div class="about">
                <h4>Car</h4>
                    <p>Model - {{car.model}} </p>
                    <p>Brand - {{car.brand}} </p>
                    <p>Color - {{car.color}} </p>
                    <p>Price - {{car.price}} </p>
            </div>
            <fieldset disabled>
                <div class="col-md-4" >
                    <div class="form-group row">
                        <label for="id_car">ID CAR</label>
                        <input class="form-control" type="text" id="id_car" v-model="car.id">
                    </div>
                    <div class="form-group row">
                        <label for="inputFname">Name</label>
                            <input class="form-control" type="text" id="inputFname" v-model="login">
                    </div>
                </div>
            </fieldset>
            <div class="form-order">
                <button type="submit" class="btn btn-success" v-on:click="getOrder()">Submit</button>
            </div>
        </div>
        <div v-else>
            <h2>Thank you !<br>
                <router-link to='/'>Main page</router-link>
            </h2>
        </div>
    </div>
</template>

<script>
    import axios from 'axios'
    export default {
        name: 'order',
        data () {
            return {
                car: {},
                login: '',
                id_user: '',
                config: {
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    }
                },
                success: ''
            }
        },
        methods:{
            isEmpty: function(obj){
                for (var key in obj) {
                    return false;
                }
                return true;
            },
            getCar: function()
            {
                var self = this
                if (JSON.stringify(self.$route.params.obj) != '"[object Object]"')
                {
                    self.car = self.$route.params.obj
                    localStorage['car'] = JSON.stringify(self.car)
                }
                else{
                    self.car = JSON.parse(localStorage['car'])
                }

            },
            getIdUser: function(){
                var self = this
                if (localStorage['id'])
                {
                    self.id_user = JSON.parse(localStorage['id'])
                    return true
                }
                return false
            },
            getLogin: function(){
                var self = this
                if (localStorage['login'])
                {
                    self.login = JSON.parse(localStorage['login'])
                    return true
                }
                return false
            },
            getOrder: function(){
                var self = this
                var data = new FormData();
                if(self.id_user == '') {
                    alert('Plese, bak to main page and register');
                }else {
                    data.append('id_car', self.car.id);
                    data.append('id_user', self.id_user);
                    axios.post('http://rest/user6/rest_task1/client/api/order/', data, self.config)
                            .then(function (response) {
                                self.success = 'success'
                            })
                            .catch(function (error) {
                                console.log(error);
                            });
                }

            }
        },
        created(){
            this.getCar()
            this.getLogin()
            this.getIdUser()
        }
    }
</script>


<style scoped>

</style>