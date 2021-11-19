<template>
    <div>
        <b-card no-body class="mb-0">
            <b-tabs pills card vertical  v-model="gallery_active_tab">
            <b-tab>
            <template slot="title">
                <i class="fa fa-list fa-fw"></i> My Images
            </template>
            <b-card-text class="mx-3">
                <b-row align-v="center" class="modal-loader" v-if="loading_images">
                    <b-col>
                        <b-spinner></b-spinner>
                        <br><br>
                        <strong>Loading</strong>
                    </b-col>
                </b-row>
                <b-card class="mb-0">
                    <div slot="header">
                        <b-row>
                            <b-col sm="5" class="d-flex align-items-center">
                                <div>
                                    <i class='fa fa-file-image-o fa-fw'></i><strong>My Images</strong>
                                </div>
                            </b-col>
                            <b-col sm="7" class="text-right">
                                <!-- <b-button v-if="needs_saving" @click="saveChanges" variant="success" class="px-4" size="sm"><i class="fa fa-save fa-fw"></i>
                                    Save Changes To Images
                                </b-button> -->
                            </b-col>
                        </b-row>
                    </div>
                    <div class="alert alert-primary mb-0" role="alert" v-if="selected_files.length<=0">
                        <i class='fa fa-info-circle fa-fw'></i> No images saved yet. Try to upload some images or select from your gallery.
                    </div>
                    <b-row class="p-2 mb-0" v-if="selected_files.length > 0">
                        <b-col sm="2" v-for="(file, index) in selected_files" class="p-2 m-0 my-image-holder">
                            
                            <template v-if="file.type==1">
                                <img :src="assets_path.MEDIA_UPLOADS + file.new_file_name" class="img-fluid w-100" @click="displayImage(file)">
                                <i class="fa fa-times-circle text-danger" @click="deleteMyImage(index,file)"></i>
                            </template>
                            <template v-else>
                                <video class="img-fluid w-100" @click="displayImage(file)">
                                    <source :src="assets_path.MEDIA_UPLOADS + file.new_file_name" type="video/mp4">
                                    Your browser does not support the video tag.
                                </video>
                                <i class="fa fa-times-circle text-danger" @click="deleteMyImage(index,file)"></i>
                            </template>
                        </b-col>
                    </b-row>
                </b-card>
            </b-card-text>
            </b-tab>
            <b-tab>
                <template slot="title">
                    <i class="fa fa-picture-o fa-fw"></i> Gallery
                </template>
                <b-card-text class="mx-3">
                        <b-row class="mb-0">
                            <b-col sm="3">
                                <b-form-select v-model="selected_display_no" :options="options" size="sm" @change="changeDisplayNo"></b-form-select>
                            </b-col>
                            <b-col sm="6" offset-sm="3">
                                <b-input-group>
                                    <b-input-group-prepend>
                                        <b-input-group-text class="bg-dark"><i class="fa fa-search"></i></b-input-group-text>
                                    </b-input-group-prepend>
                                    <b-form-input
                                            type="text"
                                            class="form-control"
                                            placeholder="Search"
                                            autocomplete="off"
                                            size="sm"
                                            @keypress.native="searching"
                                            @keyup.native="search"
                                            v-model="search_term"
                                    />
                                    <b-input-group-append>
                                            <b-button @click="clearSearch" variant="secondary" class="px-4" size="sm" :disabled="search_term==''">
                                                <i class="fa fa-close"></i>
                                            </b-button>
                                            <!--<i class="fa fa-close"></i>-->
                                    </b-input-group-append>
                                </b-input-group>
                            </b-col>
                        </b-row>
                        <div class="alert alert-primary" role="alert" v-if="list.data.length<=0">
                            <i class='fa fa-info-circle fa-fw'></i> No images in your gallery yet. Try to upload some images.
                        </div>
                        <b-row class="p-2">
                            <b-col sm="2" v-for="(file, index) in list.data" class="p-2 m-0 gallery-image-holder">
                                <template v-if="file.type==1">
                                    <img :src="assets_path.MEDIA_UPLOADS + file.new_file_name" class="img-fluid w-100" @click="displayImage(file)">
                                    <i v-if="!checkIfImageIsSelected(file.id)" class="fa fa-check-circle text-success" @click="selectImage(index,file)"></i>
                                    <transition name="bounce">
                                    <i v-if="checkIfImageIsSelected(file.id)" class="fa fa-check-circle text-success selected" @click="selectImage(index,file)"></i>
                                    </transition>
                                </template>
                                <template v-else>
                                    <video class="img-fluid w-100" @click="displayImage(file)">
                                        <source :src="assets_path.MEDIA_UPLOADS + file.new_file_name" type="video/mp4">
                                        Your browser does not support the video tag.
                                    </video>
                                    <!-- <i class="fa fa-play-circle text-primary play-btn align-self-center"></i> -->
                                    <i v-if="!checkIfImageIsSelected(file.id)" class="fa fa-check-circle text-success" @click="selectImage(index,file)"></i>
                                    <transition name="bounce">
                                    <i v-if="checkIfImageIsSelected(file.id)" class="fa fa-check-circle text-success selected" @click="selectImage(index,file)"></i>
                                    </transition>
                                </template>
                            </b-col>
                        </b-row>
                        <nav v-if="list.total > 0">
                            <b-pagination
                                    :disabled="loading_gallery"
                                    @input="getAll"
                                    align="right"
                                    :total-rows="total_rows"
                                    :per-page="per_page"
                                    v-model="list.current_page"
                            >
                            </b-pagination>
                        </nav>
                    <b-row align-v="center" class="modal-loader" v-if="loading_gallery">
                        <b-col>
                            <b-spinner></b-spinner>
                            <br><br>
                            <strong>Loading</strong>
                        </b-col>
                    </b-row>
                </b-card-text>
            </b-tab>
            <b-tab>
                <template slot="title">
                    <i class="fa fa-cloud-upload fa-fw"></i> Upload Files
                </template>
                <b-card-text class="mx-3">
                    <b-tabs content-class="mt-3">
                        <b-tab active>
                            <template slot="title">
                                <i class="fa fa-image fa-fw"></i> Upload Files
                            </template>
                            <div class="input-group mb-3">
                                <div class="custom-file">
                                    <input type="file" :disabled="loading_upload" class="custom-file-input" id="files" ref="files" @change="handleFileUploads" multiple accept="image/*,video/mp4">
                                    <label class="custom-file-label" for="inputGroupFile02">Choose file</label>
                                </div>
                                <div class="input-group-append">
                                    <b-button variant="primary" disabled v-if="loading_upload" size="sm" class="float-right mr-3">
                                        <template>
                                            <b-spinner small type="grow"></b-spinner>
                                            Processing Upload...
                                        </template>
                                    </b-button>
                                    <button :disabled="countFilesToProcess()<=0" v-else class="btn btn-primary" @click="submitFiles"><i class="fa fa-cloud-upload fa-fw"></i> Start Upload</button>
                                </div>
                            </div>
                            <div class="d-flex justify-content-center" v-if="countMediaFiles()<=0">
                                <i class="fa fa-cloud-upload fa-fw text-muted upload-icon align-self-center"></i>
                            </div>
                            <div class="large-12 medium-12 small-12 cell" v-else>
                                <table class="table table-sm">
                                <thead class="thead-dark">
                                    <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Thumbnail</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Size</th>
                                    <th scope="col">Type</th>
                                    <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <template v-for="(file, key) in media_files">
                                    <tr v-if="!file.is_deleted">
                                        <th scope="row">{{ getId(key) }}</th>
                                        <td>
                                            <!-- <i v-if="!file.is_image" class='fa fa-film fa-fw' style="font-size:2.5rem;"></i> -->
                                            <video v-if="!file.is_image" class="image-thumbnail-upload">
                                                <source :src="file.full_path" type="video/mp4">
                                                Your browser does not support the video tag.
                                            </video>
                                            <img v-else :src="file.full_path" class="image-thumbnail-upload">
                                        </td>
                                        <td width="40%">
                                            <template v-if="file.percentage==0">{{ file.name }}</template>
                                            <template v-if="file.error_title!=''">
                                                <strong>{{ file.error_title }}: </strong>{{ file.error_content }}
                                            </template>
                                            <b-progress v-if="file.percentage>0" :variant="file.loading_color" :value="file.percentage" :max="max_upload_percentage" show-progress animated height="1.5rem">
                                                <b-progress-bar :value="file.percentage" v-if="file.percentage>0">
                                                    <strong v-if="file.error_title!=''">{{ file.name }} - ERROR!</strong>
                                                    <strong v-else>{{ file.name }} - {{ file.percentage }}%</strong>
                                                </b-progress-bar>
                                            </b-progress>
                                        </td>
                                        <td>
                                            {{ convertToMb(file.size) }}
                                        </td>
                                        <td>{{ file.type }}</td>
                                        <td>
                                            <b-button
                                                    variant="danger"
                                                    size="sm"
                                                    @click="removeFromFilesToUpload(file,key)"
                                                    v-if="!file.is_complete"
                                                    block 
                                                    :disabled="loading_upload"
                                            >
                                                <i class="fa fa-trash"></i> Remove
                                            </b-button>
                                            <b-button
                                                    variant="success"
                                                    size="sm"
                                                    v-else
                                                    block 
                                            >
                                                <i class="fa fa-check"></i> Completed
                                            </b-button>
                                        </td>
                                    </tr>
                                    </template>
                                </tbody>
                                </table>
                            </div>
                        </b-tab>
                    </b-tabs>
                </b-card-text>
            </b-tab>
            </b-tabs>
        </b-card>
        <!-- Modal Component -->
        <b-modal centered
                 v-model="display_image_modal" size="lg" body-class="p-0"
                 no-close-on-backdrop no-close-on-esc>
            <template slot="modal-title">
                <div>
                    <h5><i class='fa fa-file-image-o'></i>&nbsp;&nbsp;File View<span></span></h5>
                </div>
            </template>
            <div>
            <img v-if="selected_image.type==1" :src="assets_path.MEDIA_UPLOADS + selected_image.new_file_name" class="img-fluid w-100">
            <video v-else controls class="img-fluid w-100">
                <source :src="assets_path.MEDIA_UPLOADS + selected_image.new_file_name" type="video/mp4">
                Your browser does not support the video tag.
            </video>
            </div>
            <div slot="modal-footer" class="w-100">
                <div class="image-title">{{selected_image.original_file_name}}</div>
            </div>
        </b-modal>
    </div>
</template>

<script>
    import {bus} from '@/main.js'
    import {assets_path} from '@/config';
    import SwalMixin from '@/views/mixins/Swal.js'
    export default {
        name: 'media',
        inheritAttrs: false,
        mixins:[SwalMixin],
        props: {
            current_images: {
                type: [Array, Object],
                default: () => []
            }
        },
        data(){
            return {
                media_files:[],
                actual_media_files:[],
                upload_percentage:0,
                max_upload_percentage:100,
                video_files:[],
                gallery_active_tab:0,
                needs_saving:false,
                files: [],
                list: {
                    data: [],
                    from: 1,
                    to: 0,
                    current_page: 1,
                    total: 0,
                    per_page: 1,
                },
                loading_images: false,
                loading_upload: false,
                loading_gallery: false,
                display_image_modal:false,
                selected_image:{
                    full_path:''
                },
                searchTimeout: () => ({
                    type: Function,
                    default: () => ({})
                }),
                search_term: '',
                options: [
                    { value: 30, text: 'Display 30 records' },
                    { value: 60, text: 'Display 65 records' },
                    { value: 120, text: 'Display 120 records' }
                ],
                selected_display_no:30,
                assets_path:{}
            }
        },
        watch:{
            selected_files:{
                handler(val){
                    bus.$emit('mediaComponentUpdateSelectedImages',val);
                    this.$emit('mediaComponentUpdateSelectedImages', val)
                },
                deep: true
            },
            media_files:{
                handler(val){
                    ///console.log('watch',val);
                },
                deep:true
            }
        },
        computed: {
            per_page: function () {
                return parseInt(this.list.per_page);
            },
            total_rows: function () {
                return parseInt(this.list.total);
            },
            selected_files: function () {
                return this.current_images;
            },
        },
        created(){
            this.assets_path = assets_path;
        },
        mounted() {
            this.getAll();
        },
        methods: {
            getAll() {
                this.loading_gallery = true;
                this.axios.get('media/get_all' + '?page=' + this.list.current_page + '&per_page=' + this.selected_display_no + '&search=' + this.search_term).then(response => {
                    let result=response.data;
                    this.list=result
                    this.loading_gallery = false;
                }).catch(error => console.log(error));
            },
            searching() {
                clearTimeout(this.searchTimeout);
            },
            search() {
                this.searchTimeout = setTimeout(() => {
                    this.list.current_page=1;
                    this.getAll();
                    clearTimeout(this.searchTimeout);
                }, 1000);
            },
            clearSearch(){
                this.search_term=''
                this.getAll();
            },
            changeDisplayNo(){
                this.loading_gallery = true;
                this.list.current_page=1;
                this.getAll();
            },
            onImageChange(e) {
                console.log(e);
                let files = e.target.files || e.dataTransfer.files;
                if (!files.length)
                    return;
                    //console.log(files);

                for (let i = 0; i < files.length; i++) {
                        this.createImage(files[i]);
                }
            },
            createImage(file) {
                let reader = new FileReader();
                let data={};
                reader.onload = (e) => {
                    data.original_file_name=file.name;
                    data.full_path=e.target.result
                    this.files.push(data)
                };
                reader.readAsDataURL(file);
            },
            uploadImage(){
                console.log(this.files);
                if(this.files.length>0){
                    this.loading_upload = true;
                    this.axios.post('media/save',{files:this.files}).then(response => {
                        //console.log(response.data);

                        response.data.forEach(file => {
                            this.selected_files.push(file);
                        });
                        this.files=[];
                        this.gallery_active_tab=0;
                        this.loading_upload = false;
                        this.swal_transaction_completed_data.title="Upload Completed.";
                        this.swal_transaction_completed_data.text="Images were successfully uploaded."
                        this.needs_saving=true;
                        this.getAll();
                        this.swalTransactionCompleted();
                    });
                }else{
                    this.swalFieldsRequired();
                }

            },
            selectImage(index,file){
                //this.list.data.splice(index,1);
                this.selected_files.push(file);
                this.needs_saving=true;
                //this.getAll();
            },
            displayImage(file){
                console.log(file)
                this.selected_image=file;
                this.display_image_modal=true;
            },
            checkIfImageIsSelected(id){
                let check=this.selected_files.find(x => x.id==id);
                if(check)
                return true;

                return false;
            },
            deleteImageToUpload(index,file){
                this.files.splice(index,1);
            },
            deleteMyImage(index,file){
                console.log(this.selected_files);
                this.selected_files.splice(index,1);
                this.needs_saving=true;
                console.log(this.selected_files);
            },
            saveChanges() {
                this.swalConfirmSubmit((data)=>{
                    if (data.value) {
                        bus.$emit('mediaComponentSaveChangesClicked',this.selected_files);
                    }
                });
            },

            getId(key){
              return key+1;  
            },
            createThumb(file,data) {
                let reader = new FileReader();
                
                reader.onload = (e) => {
                    data.full_path=e.target.result;
                    this.media_files.push(data);
                    this.actual_media_files.push(file);
                };
                reader.readAsDataURL(file);
            },
            handleFileUploads(event){
                
                let data_files = Array.from(this.$refs.files.files);
                let files = event.target.files || event.dataTransfer.files;
                if(data_files.length>20){
                    this.swal_transaction_error_data.title='Upload Limit Error';
                    this.swal_transaction_error_data.text='Please upload 20 file/s at a time.';
                    this.swalRequestError();
                }else{
                    for( var i = 0; i < files.length; i++ ){
                            let data={
                                name:files[i].name,
                                percentage:0,
                                size:files[i].size,
                                type:files[i].type,
                                loading_color:'primary',
                                error_title:'',
                                error_content:'',
                                is_complete:false,
                                is_deleted:false,
                                is_image:files[i].type.split('/')[0] === 'image' ? true : false
                            }
                            this.createThumb(files[i],data);
                            
                    }
                }
                console.log(this.actual_media_files);
            },
            submitFiles(){
                this.loading_upload=true;
                let file_count=this.countFilesToProcess();
                let counter=0;
                this.media_files.forEach((val,index)=>{
                    if(!val.is_complete && !val.is_deleted){
                        val.error_title='';
                        val.error_content='';
                        val.loading_color='primary';
                        let formData = new FormData();
                        let file = this.actual_media_files[index];
                        formData.append('file', file);
                        this.axios.post( 'media/save_media',
                            formData,
                            {
                                headers: {
                                    'Content-Type': 'multipart/form-data'
                                },
                                onUploadProgress: ( progressEvent ) => {
                                    val.percentage = parseInt( Math.round( ( progressEvent.loaded * 100 ) / progressEvent.total ) );
                                }
                            }
                        ).then(()=>{
                            val.loading_color='success';
                            val.is_complete=true;
                            counter++;
                            (counter==file_count) ? this.loading_upload=false : '';
                        })
                        .catch(error => {
                            if(error.response.status==413){
                                val.error_title='Invalid File Size';
                                val.error_content='Sorry! Maximum allowed size for an image/video is 20MB';
                                val.loading_color='danger';

                            }else{
                                let error_message=error.response.data;
                                val.error_title=error_message.title;
                                val.error_content=error_message.content;
                                val.loading_color='danger';
                            }
                            counter++;
                            (counter==file_count) ? this.loading_upload=false : '';
                        })
                    }
                });
                //this.loading_upload=false;
            },
            convertToMb(size){
                let mb_size=size/1000000;
                return mb_size.toLocaleString('en-US',{minimumFractionDigits:2,maximumFractionDigits:2})+'Mb';
            },
            removeFromFilesToUpload(file,index){
                //this.actual_media_files.splice(index,1);
                this.media_files[index].is_deleted=true;
            },
            countFilesToProcess(){
                let result = this.media_files.filter(x=>x.is_deleted==false && x.is_complete==false).length;
                return result;
            },
            countMediaFiles(){
                let result = this.media_files.filter(x=>x.is_deleted==false).length;
                console.log(result);
                return result;
            }
        }
    }
</script>
<style>
.gallery-image-holder i, .my-image-holder i, .upload-image-holder i{
    position: absolute;
    top:0;
    right:0;
    font-size:22px;
    background-image: radial-gradient(at center, #fff 40%, transparent 40%);
    cursor: pointer;
    opacity:0;
    transition: all 0.2s ease;

}
.gallery-image-holder .selected{
    opacity:1!important;
}
.gallery-image-holder img, .my-image-holder img, .upload-image-holder img{
  object-fit: cover;
  height: 8vw;
  cursor: pointer;
  transition: all 0.5s ease;
}
.gallery-image-holder video, .my-image-holder video{
  object-fit: cover;
  height: 8vw;
  cursor: pointer;
  transition: all 0.5s ease;
}
.gallery-image-holder:hover > i, .my-image-holder:hover > i, .upload-image-holder:hover > i{
    opacity:1;
}
.gallery-image-holder:hover > img, .gallery-image-holder:hover > video, .my-image-holder:hover > img, .my-image-holder:hover > video, .upload-image-holder:hover > img{
    padding:5px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
.play-btn-holder{
    position:absolute;
    z-index: 3;
    width: 100%;
    left:0;
    top:0;
    height:100%;
    text-align: center;
    margin:0;
    padding:0;
}
.play-btn{
    opacity: 1!important;
    font-size: 3rem!important;
    -webkit-text-stroke-width: 2px;
   -webkit-text-stroke-color: #fff;
}
.image-thumbnail-upload{
    width: 50px;
    height: 50px;
    object-fit: cover;
}
.tabs{
    min-height: 500px;
}
.tab-content .tab-pane:focus{
    outline: none;
}
.upload-icon{
    font-size:360px;
    opacity: .2
}
.bounce-enter-active {
  animation: bounce-in .5s;
}
.bounce-leave-active {
  animation: bounce-in .5s reverse;
}
.tab-content {
    margin-top: -1px!important;
}
@keyframes bounce-in {
  0% {
    transform: scale(0);
  }
  50% {
    transform: scale(1.5);
  }
  100% {
    transform: scale(1);
  }
}
</style>
