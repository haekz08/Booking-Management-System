<template>
    <div>
        <b-row>
            <b-col>
                <div class="text-uppercase font-weight-bold font-italic mb-1" style="color:#b56868;">Profile Photo (max
                    10mb):
                </div>
                <b-img style="width:250px; height:233px !important; object-fit: cover;" thumbnail fluid
                       :src="previewImage" alt="Profile Image"></b-img>
                <input type="file" accept="image/*" ref="fileInput" @change="onFileChange" class="d-none">
                <b-row class="pt-1">
                    <b-col>
                        <b-button-group size="sm">
                            <b-button
                                    class="border"
                                    variant="default"
                                    :pressed="true"
                                    @click="$refs.fileInput.click()"
                                    :disabled="is_uploading"
                            >
                                Select Photo
                            </b-button>

                            <b-button
                                    variant="primary"
                                    :pressed="true"
                                    @click="saveProfilePicture"
                                    :disabled="is_uploading"
                            >
                                <template v-if="!is_uploading">
                                    Upload Photo
                                </template>
                                <template v-else>
                                    <b-spinner small type="grow"></b-spinner>
                                    Uploading Photo
                                </template>
                            </b-button>
                        </b-button-group>
                    </b-col>
                </b-row>
            </b-col>
        </b-row>
    </div>
</template>

<script>
    import {bus} from '@/main';
    import {assets_path} from '@/config';
    import SwalMixin from '@/views/mixins/Swal.js'

    export default {
        name: "Index",
        mixins: [SwalMixin],
        data() {
            return {
                previewImage: "",
                selectedFile: null,
                is_uploading: false
            }
        },
        created() {
            let user = JSON.parse(this.$store.state.user);
            console.log(user)
            if (user.image != null) {
                this.previewImage = assets_path.ORIGNAL_IMAGE_PATH + user.image;
            } else {
                this.previewImage = assets_path.DEFAULT_IMAGE;
            }
        },
        methods: {
            onFileChange(e) {
                const file = e.target.files[0];
                let mb_size = file.size / 1000000;
                if (mb_size > 10) {
                    this.swal_transaction_warning_data.text = "Image size is greater than 10mb!";
                    this.swalTransactionWarning();
                    return;
                }
                this.previewImage = URL.createObjectURL(file);
                this.selectedFile = e.target.files[0];
            },
            saveProfilePicture() {
                if (this.selectedFile != null) {
                    const formData = new FormData()
                    formData.append('photo', this.selectedFile, this.selectedFile.name);
                    this.is_uploading = true;
                    this.axios.post('maintenance/user/upload_profile_picture', formData, {
                        headers: {
                            'Content-Type': 'multipart/form-data'
                        },
                        onUploadProgress: progressEvent => {
                            // console.log(parseInt(Math.round((progressEvent.loaded * 100) / progressEvent.total)));
                        }
                    }).then(
                        response => {
                            this.selectedFile = null;
                            this.swal_transaction_completed_data.text = "Image Successfully Uploaded!";
                            this.is_uploading = false;
                            bus.$emit('update_avatar', response.data);
                            this.swalTransactionCompleted();
                        }
                    ).catch(error => {
                        this.swal_transaction_error_data.text = error.response.data.error.photo[0];
                        this.swalRequestError();
                        this.is_uploading = false;
                    });
                } else {
                    this.swal_transaction_warning_data.text = "Select New Image!"
                    this.swalTransactionWarning();
                    this.is_uploading = false;
                }
            }
        }
    }
</script>

<style scoped>

</style>