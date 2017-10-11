<template>
    <div class="product_section" >
        <table class="table">
            <thead>
            <tr class="active">
                <td>Value</td>
                <td>Car</td>
            </tr>
            </thead>
            <tbody>
            <tr class="success">
                <td>ID</td>
                <td>{{ car.id }}</td>
            </tr>
            <tr class="success">
                <td>Brand</td>
                <td>{{ car.brand }}</td>
            </tr>
            <tr class="success">
                <td>Model</td>
                <td>{{ car.model }}</td>
            </tr>
            <tr class="success">
                <td>Year</td>
                <td>{{ car.year }}</td>
            </tr>
            <tr class="success">
                <td>Engine</td>
                <td>{{ car.engine }}</td>
            </tr>
            <tr class="success">
                <td>Color</td>
                <td>{{ car.color }}</td>
            </tr>
            <tr class="success">
                <td>Price</td>
                <td>{{ car.price }}</td>
            </tr>
            <tr class="success">
                <td>Speed</td>
                <td>{{ car.maxSpeed }}</td>
            </tr>
            </tbody>
            <div class="btnPreOr" v-if="checkUser != ''">
                <router-link :to="{name: 'order', params: { obj: car }}"><button class="btn btn-primary">Order</button></router-link>
            </div>
        </table>
    </div>
</template>

<script>
    import axios from 'axios'
    import Order from './Order'
    export default {
        name: 'carSingle',
        props: ["car", "checkUser"],
        data() {
            return {

            }
        }
    }
</script>

<style scoped>

tr {
    height: 10px;
}

</style>