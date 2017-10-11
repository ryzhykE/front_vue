<template>
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <h4>Register form</h4>
            <div v-if="error !== ''" class="alert alert-danger">
                {{ error }}
            </div>
            <div v-if="success !== 'register success'">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="login">Login:</label>
                    <div class="col-sm-10">
                        <input v-model="login" type="login" class="form-control" id="login" placeholder="Enter login" name="login">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="password">Password:</label>
                    <div class="col-sm-10">
                        <input v-model="password" type="password" class="form-control" id="password" placeholder="Enter password" name="password">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="password_confirm">Password Conferm</label>
                    <div class="col-sm-10">
                        <input v-model="password_confirm" type="password" class="form-control" id="password_confirm" placeholder="Enter password" name="password_confirm">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button v-on:click="registration()" type="submit" class="btn btn-default">Submit</button>
                    </div>
                </div>
            </div>
            <div v-else class="success">
                <h4>Thank you {{login}}, for register</h4>
                <router-link class="link" to='/'>Back to main page</router-link>
            </div>
        </div>
    </div>
</template>

<script>
    import axios from 'axios'
    export default {
        name: 'register',
        data(){
            return {
                error: '',
                success: '',
                login: '',
                password: '',
                password_confirm: '',
                config: {
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    }
                }
            }
        },
        methods: {
            registration: function () {
                var self = this
                if (self.login && self.password && self.password_confirm)
                {
                    if (self.password.password < 7)
                    {
                        alert('Password should be at least 8 characters')
                    }
                    if(self.password != self.password_confirm)
                    {
                        alert('Password fields do not match')
                    } else {
                        var data = new FormData()
                        data.append('login', self.login)
                        data.append('password', self.password)
                        axios.post('http://192.168.0.15/~user12/rest/client/api/auth/', data, this.config)
                                .then(function (response) {
                                    self.success = response.data;
                                    self.error = response.data;
                                })
                                .catch(function (error) {
                                    console.log(error);
                                });
                    }

                }
                else{
                    alert('Enter field!')
                }
            }

        }
    }
</script>

<style scoped>
.success{
    color: darkblue;
    text-align: center;
}
</style>