<template>
    <div class="row">
        <div class="col-md-5 col-md-offset-5 login-form">
            <div v-if="error !== ''" class="alert alert-danger">
                {{ error }}
            </div>

            <div v-if="checkUser == ''">
                <div class="form-group">
                    <div class="col-md-2">
                        <router-link to="/register"><a class="navbar-brand" href="http://localhost:8080/#/register/">Register</a></router-link>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-4">
                        <input v-model="login" type="login" class="form-control" id="login" placeholder="Login" name="login">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-4">
                        <input v-model="password" type="password" class="form-control" id="password" placeholder="Password" name="password">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-2">
                        <button v-on:click="loginUser()" type="submit" class="btn btn-default">Submit</button>
                    </div>
                </div>
            </div>
            <div v-else class="form-group">
                <div class="form-group">
                    <div class="col-md-5">
                        <router-link to="/orders"><button type="submit" class="btn btn-success">My Orders</button></router-link>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-5">
                        <button v-on:click="logoutUser()" type="submit" class="btn btn-success">Logout</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import axios from 'axios'
    export default {
        name: 'loginForm',
        data(){
            return {
                login: '',
                password: '',
                id: '',
                hash: '',
                error: '',
                checkUser: '',
            }
        },
        methods: {
            loginUser: function(){
                var self = this
                self.error = ''
                if (self.login && self.password)
                {
                    axios.put('http://rest/user6/rest_task1/client/api/auth/', {
                                login: self.login,
                                password: self.password
                            }, this.config)
                            .then(function (response) {
                                 //console.log(response.data.hash);
                                //console.log(response.data.id);
                                if (response.data.id && response.data.hash)
                                {
                                    self.id = response.data.id
                                    self.hash = response.data.hash
                                    localStorage['id'] = JSON.stringify(self.id)
                                    localStorage['hash'] = JSON.stringify(self.hash)
                                    localStorage['login'] = JSON.stringify(self.login)
                                    self.checkUserA()
                                    self.$parent.getCheck()
                                    return true
                                }
                                else {
                                    self.error = response.data
                                }
                            })
                            .catch(function (error) {
                                console.log(error);
                            });
                }
                else
                {
                    self.error = 'Check all fields!'
                }
            },
            checkUserA: function()
            {
                var self = this
                if (localStorage['id'] && localStorage['hash'])
                {
                    self.id = JSON.parse(localStorage['id'])
                    self.hash = JSON.parse(localStorage['hash'])
                    axios.get('http://rest/user6/rest_task1/client/api/auth/' + self.id)
                            .then(function (response) {
                                if (response.data !== false)
                                {
                                    if (self.hash === response.data)
                                    {
                                        self.checkUser = 1;
                                        return true
                                    }
                                }
                            })
                            .catch(function (error) {
                                console.log(error);
                            });
                }
                else{
                    return false
                }
            },
            logoutUser: function()
            {
                var self = this
                if (localStorage['id'] && localStorage['hash'])
                {
                    delete localStorage['id']
                    delete localStorage['hash']
                    delete localStorage['login']
                    self.checkUser = ''
                    self.$parent.getCheck()
                    return true
                }
                else{
                    return false
                }
            },


        },
        created(){
            this.checkUserA()
        }
    }
</script>


<style scoped>

    .login-form{
        padding-bottom: 20px;
    }
</style>