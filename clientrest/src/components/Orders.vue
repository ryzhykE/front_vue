<template>
    <div class="orders">
        <div >
            <ul class="ordersList" v-for="order in orders" v-bind:key="order.id">
                <li>
                    id: {{order.id}}. Brand: {{order.brand}}. Model: {{order.model}}. Price: {{order.price}}.
                    Status: {{order.status}}. Edit status:
                    <select v-on:change="getSelect(order.id)" v-model="selected.key" class="form-control" id="status">
                        <option value="sent">Send</option>
                        <option value="received">Get</option>
                    </select>
                </li>
            </ul>
        </div>
        <router-link to="/"><button type="submit" class="btn btn-primary">Back</button></router-link>
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
            getSelect: function(idOrder){
                var self = this
                axios.put('http://rest/user6/rest_task1/client/api/orders/', {
                            id: idOrder,
                            status: self.selected.key
                        }, this.config)
                        .then(function (response) {
                             console.log(response.data)
                            self.selected.key = ''
                            self.getOrders()

                        })
                        .catch(function (error) {
                            console.log(error)
                        });

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
            getOrders: function()
            {
                var self = this
                // console.log(self.id_user)
                if (!self.id_user)
                {
                    return false
                }
                axios.get('http://rest/user6/rest_task1/client/api/orders/' + self.id_user)
                        .then(function (response) {
                            // console.log(response.data);
                            if (Array.isArray(response.data))
                            {
                                self.orders = response.data
                            }
                            else{
                                alert(response.data)
                            }
                        })
                        .catch(function (error) {
                            console.log(error);
                        });
            }
        },
        created(){
            this.getIdUser()
            this.getOrders()
        }
    }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
    #status{
        width: 10%;
        display: inline;
    }
</style>