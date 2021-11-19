<template>
    <div>
        <b-row v-for="(guest, index) in guest_list" class="m-0 p-0" >
            <b-col class="m-0 p-0" v-if="guest.cabin.id!=-1">
                <table class="table table-sm table-bordered">
                <thead>
                    <tr>
                        <td scope="col" class="text-muted">Description</td>
                        <td scope="col" class="text-right text-muted">Amount</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <h6 class="mb-0 pb-0 font-weight-bold text-uppercase">
                                {{(guest.last_name.value!='') ? guest.last_name.value : 'Guest ' + (index+1)}}, {{(guest.first_name.value!='') ? guest.first_name.value : 'Guest'}}
                            </h6>
                            <div>{{guest.cabin.cabin_description.cabin_type.name}} - {{guest.cabin.cabin_description.code}}</div>
                            <div class="small text-muted">
                                <span>
                                <template>Occupancy: {{guest.occupancy}}</template>
                                </span>
                            </div>
                        </td>
                        <td class="text-right">
                            &euro; {{guest.original_amount_due.toLocaleString('en-US',{ minimumFractionDigits: 2 })}}
                        </td>
                    </tr>
                    <template v-if="guest.discounts.length!=0">
                    <tr>
                        <td colspan="2">
                            <span class="d-block h6 text-danger m-0">
                                Less:
                            </span>
                        </td>
                    </tr>
                    <tr v-for="discount in guest.discounts">
                        <td>
                            {{discount.discount_description}}
                        </td>
                        <td class="text-right">
                            <span class="d-block h6 text-danger">
                            - &euro; {{discount.total.toLocaleString('en-US',{ minimumFractionDigits: 2 })}}
                            </span>
                        </td>
                    </tr>
                    </template>
                    <tr>
                        <td>
                            <h6 class="font-weight-bold text-uppercase m-0">TOTAL</h6>
                        </td>
                        <td class="text-right">
                            <h6 class="font-weight-bold text-uppercase m-0">&euro; {{guest.amount_due.toLocaleString('en-US',{ minimumFractionDigits: 2 })}}</h6>
                        </td>
                    </tr>
                </tbody>
                </table>
            </b-col>
        </b-row>
    </div>
</template>

<script>
    export default {
        name: 'guests',
        props: {
            guests: {
                type: [Array, Object],
                default: () => []
            }
        },
        computed: {
            guest_list: function () {
                return this.guests;
            }
        },
        data() {
            return {
                
            }
        },
        created() {
        },
        methods: {
            
        }
    }
</script>


<style scoped>

</style>