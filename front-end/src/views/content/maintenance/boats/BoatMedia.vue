<template>
    <div>
        <b-modal header-text-variant="light" header-bg-variant="dark" footer-bg-variant="dark" centered
                 v-model="media_modal_status.boat_media_modal_status" @close="closeModal" size="lg" body-class="p-0"
                 no-close-on-backdrop no-close-on-esc>
            <template slot="modal-title">
                <div>
                    <h5 class="parent_sign text-uppercase"><i class="fa fa-fw fa-file-image-o"></i> Boat Media
                        Files<span></span></h5>
                </div>
            </template>
            <div class="custom-modal-body">
                <b-row>
                    <b-col md="12">
                        <b-form-file
                                accept="image/*"
                                :placeholder="this.boat_setting.boat_media.length > 0 ? this.boat_setting.boat_media.length + ' files selected' : 'No file chosen'"
                                multiple :file-name-formatter="formatNames"></b-form-file>
                    </b-col>
                </b-row>
                <b-row class="my-3" v-if="boat_setting.boat_media.length > 0">
                    <b-col class="my-3" md="4" v-for="(img, index) in boat_setting.boat_media">
                        <i class="fa fa-close img-close-icon" @click="removeImage(index)"></i>
                        <b-img thumbnail fluid :src="thumbnail(img)" style="height:210px; object-fit: cover;"
                               alt="Image 1"></b-img>
                    </b-col>
                </b-row>
            </div>
        </b-modal>
    </div>
</template>

<script>
    export default {
        props: {
            media_modal_status: {
                type: [Array, Object],
                default: () => []
            },
            boat_setting: {
                type: [Array, Object],
                default: () => []
            }
        },
        data() {
            return {}
        },
        methods: {
            formatNames(files) {
                console.log(files);
                return this.generate_thumbnail(files);
            },
            generate_thumbnail(files) {
                files.forEach((image)=>{
                    this.boat_setting.boat_media.push(image);
                });
                if (this.boat_setting.boat_media.length === 1) {
                    return this.boat_setting.boat_media[0].name
                } else {
                    return `${this.boat_setting.boat_media.length} files selected`
                }
            },
            thumbnail(image) {
                return URL.createObjectURL(image);
            },
            removeImage(index){
                //console.log(this.boat_setting.boat_media);
                //this.boat_setting.boat_media.splice(index,1);
                //console.log(this.boat_setting.boat_media[index]);
                //delete this.boat_setting.boat_media[index];
                //alert(1);
            },
            closeModal() {

            }
        },
        mounted() {
        }
    }
</script>

<style scoped>
    /*CUSTOM*/
    .fa-close{
        position: absolute;
        top: -10px;
        right: 5px;
        background: #bf5353;
        padding: 3%;
        font-size: 14px !important;
        border-radius: 50%;
        color: #fff;
        cursor: pointer;
    }
</style>