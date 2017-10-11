<template>
    <div class="orders">
        <div class="col-md-offset-3 col-md-7 ">
            <router-link to="/"><h6>Main page</h6></router-link>
            <table class="table" v-for="order in orders">
                <thead>
                <tr class="active">
                    <td>Value</td>
                    <td>Car</td>
                </tr>
                </thead>
                <tbody>
                <tr class="success">
                    <td>Brand</td>
                    <td>{{order.brand}}</td>
                </tr>
                <tr class="success">
                    <td>Model</td>
                    <td>{{order.model}}</td>
                </tr>
                <tr class="success">
                    <td>Color</td>
                    <td>{{order.color}}</td>
                </tr>
                <tr class="success">
                    <td>Pricr</td>
                    <td>{{order.price}}</td>
                </tr>
                <tr class="success">
                    <td>Status</td>
                    <td>{{order.status}}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>

<script>
    import axios from 'axios'
    export default {
        name: 'Orders',
        data () {
            return {
                id_user: '',
                orders: [],
                order: {},
                selected: {},
                config: {
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    }
                }
            }
        },
        methods: {
            getIdUser: function(){
                var self = this
                if (localStorage['id'])
                {
                    self.id_user = JSON.parse(localStorage['id'])
                    return true
                }
                return false
            },
            getOrders: function()
            {
                var self = this
                if (!self.id_user)
                {
                    return false
                }
                axios.get('http://192.168.0.15/~user12/rest/client/api/order/' + self.id_user)
                    .then(function (response) {
                        if (Array.isArray(response.data))
                        {
                            self.orders = response.data
                        }
                    })
            },
        },
        created(){
            this.getIdUser()
            this.getOrders()
        }
    }
</script>

<style scoped>
    h6{
        text-align: center;
    }
</style>
