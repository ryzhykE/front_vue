<template>
    <div class="main">
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">ShopCar</a>

                </div>
                <loginForm></loginForm>
            </div>
        </nav>
        <div class="container">
        <div class="row content">

            <div class="col-md-12  well">

                <div class="form-group col-sm-2" id="select1">
                <select id="model"  class="form-control" v-model="model" >
                    <option value="">Model</option>
                    <option v-for="model in  options.models" :value="model.value">
                        {{model.title}}
                    </option>
                </select>
                </div>

            <div class="form-group col-sm-2">
                <select id="color" class="form-control" v-model="color">
                    <option value="">Color</option>
                    <option v-for="color in  options.colors" :value="color.value">
                        {{color.title}}
                    </option>
                </select>
            </div>

                <div class="form-group col-sm-2">
                    <select id="year" class="form-control" v-model="year">
                        <option value="">Year</option>
                        <option v-for="year in  options.years" :value="year.value">
                            {{year.title}}
                        </option>
                    </select>
                </div>

            <div class="form-group col-sm-2">
                <select id="engine" class="form-control" v-model="engine">
                    <option value="">Engine</option>
                    <option v-for="engine in  options.engines" :value="engine.value">
                        {{engine.title}}
                    </option>
                </select>
            </div>

            <div class="form-group col-sm-2">
                <select id="price" class="form-control" v-model="price">
                 <option value="">Price</option>
                 <option v-for="price in  options.prices" :value="price.value">
                    {{price.title}}
                </option>
                </select>
            </div>
            <button class="btn btn-primary col-sm-2 pull-right" id="clear" type="submit" v-on:click="greet()">X Clear</button>
            </div>
            <div class = "col-xs-6 col-md-3">
                <ul class="nav nav-tabs nav-stacked">
                    <li class="menu-nav" v-for="car in cars">
                        <span v-on:click="getOneCar(car.id)">
                            <a href="#"># {{car.id}} / Brand-{{car.brand}} / Model-{{car.model}}</a>
                        </span>
                    </li>
                </ul>
            </div>
            <div class = "col-xs-6 col-md-5">
                <h6>Filter Car</h6>
                <carSingle   v-for="car in filteredProducts" :car="car" :checkUser="checkUser"></carSingle>
            </div>
            <div class = "col-xs-6 col-md-4">
                <h6>One Car</h6>
                <span v-if="car !== ''">
                    <carSingle  :car="car"  :checkUser="checkUser"></carSingle>
                </span>
                <span v-else >
                    <p>
                        Choose car in left menu !
                    </p>
                </span>
            </div>
        </div>
        </div>
    </div>
</template>
<script>
    import axios from 'axios';
    import CarSingle from './CarSingle'
    import Car from './Cars'
    import Login from './Login'
    export default {
        name: 'CarSingle',
        name: 'Car',
        data() {
            return {
                errors: [],
                cars: [],
                car: '',
                checkUser: '',
                id: '',
                hash: '',
                model: '',
                year: '',
                engine: '',
                price: '',
                color: '',
                options: {
                    models: [
                        {
                            value:'M5',
                            title:'M5'
                        },
                        {
                            value:'Corola',
                            title:'Corola'
                        },
                        {
                            value:'Gran',
                            title:'Gran'
                        },
                        {
                            value:'BMW X4',
                            title:'BMW X4'
                        },
                        {
                            value:'A4',
                            title:'A4'
                        },
                        {
                            value:'Audi TT',
                            title:'Audi TT'
                        },
                        {
                            value:'S5',
                            title:'S5'
                        },
                    ],
                    engines: [
                        {
                            value:'1600',
                            title:'1600 см3'

                        },
                        {
                            value:'2500',
                            title:'2500 см3'
                        },
                        {
                            value:'3200',
                            title:'3200 см3'
                        }
                    ],
                    years: [
                        {
                            value:'2011',
                            title:'Year 2011'

                        },
                        {
                            value:'2015',
                            title:'Year 2015'
                        },
                        {
                            value:'2016',
                            title:'Year 2016'
                        }
                    ],
                    colors: [
                        {
                            value:'Red',
                            title:'Red color'
                        },
                        {
                            value:'Grey',
                            title:'Grey color'
                        },
                        {
                            value:'Black',
                            title:'Black color'
                        },
                    ],
                    prices: [
                        {
                            value:'1200',
                            title:'1200 $'
                        },
                        {
                            value:'2900',
                            title:'2900 $'
                        },
                        {
                            value:'5000',
                            title:'5000 $'
                        },
                        {
                            value:'10000',
                            title:'10000 $'
                        },
                    ],

                },

                config: {
                    headers: {'Content-Type': 'application/x-www-form-urlencoded'
                    }
                },
            }
        },
        methods: {
            getAll: function(){
                var self = this
                axios.get('http://192.168.0.15/~user12/rest/client/api/Cars/', this.config)
                        .then(function (response) {
                            if (response.status == 200) {
                                self.cars = response.data;
                            }
                        })
                        .catch(function (error) {
                            console.log(error);
                        });
            },
            getCheck: function(){
                var self = this
                if (localStorage['id'] && localStorage['hash'])
                {
                    self.checkUser = 1
                }
            },
            getOneCar: function(id){
                var self = this
                axios.get('http://192.168.0.15/~user12/rest/client/api/Cars/' + id +'/', this.config)
                        .then(function (response) {
                            if (response.status == 200) {
                                self.car = response.data;
                                console.log(response.data);
                            }
                        })
                        .catch(function (error) {
                            console.log(error);
                        });
            },

            greet: function () {
                if(this.model != '')
                {
                    this.model = ''
                }
                if(this.year != '')
                {
                    this.year = ''
                }
                if(this.engine != '')
                {
                    this.engine = ''
                }
                if(this.color != '')
                {
                    this.color = ''
                }
                if(this.price != '')
                {
                    this.price = ''
                }

            }
        },
        computed: {
            filteredProducts () {
                var self = this

                var checkEngine = (el) => {
                    if (self.engine == "") return true
                    if (el.engine.indexOf(self.engine) != -1) return true
                    return false
                }
                var checkYear = (el) => {
                    if (self.year == "") return true
                    if (el.year.indexOf(self.year) != -1) return true
                    return false
                }
                var checkModel = (el) => {
                    if (self.model == "") return true
                    if (el.model == self.model) return true
                    return false
                }
                var checkColor = (el) => {
                    if (self.color == "") return true
                    if (el.color == self.color) return true
                    return false
                }
                var checkPrice = (el) => {
                    if (self.price == "") return true
                    if (el.price == self.price) return true
                    return false
                }

                var ressultArr = [];
                this.ressultArr = this.cars

                var result = this.cars.filter((el,k) => {
                    el.key = k;
                return checkEngine(el) && checkModel(el) && checkColor(el) && checkYear(el) && checkPrice(el)
            })
                return result;
            }
        },
        created(){
            this.getAll()
            this.getCheck()
           
        },
    components:{
        'carSingle': CarSingle,
        'loginForm': Login,
        'car': Car,
    },
    }
</script>
<style>
    .content {
        margin-top: 10%;
    }
    .menu-nav {
        border: 1px solid green;
        height:30px;
        text-align: center;
    }
    .menu-nav a {
        text-decoration: none;
        font-size: 15px;
        color: black;
    }
    h6{
        text-align: center;
        font-weight: bold;
        font-size: 16px;
    }
</style>
