
//LOCAL SET UP
 let site_url="http://127.0.0.1:8000";
 let server_client_secret="G3Hd2RKOKtBDKLSta5hxaD4PyiKylNcyOx5qEyoPw"
let paypal_src="https://www.paypal.com/sdk/js?client-id=AeuWnkbYXiPsosy2HtioTAvkyv228lbF4Zl-lDxvG5XoBH10Q9W3nNwnMu1B2HDgQYdCrAuCrfJfuFTzu&disable-funding=credit,card&currency=EUR"

// let live_site_url="https://backend.mshbookingengine.com";
// export const assets_path = Object.freeze({
//     ORIGNAL_IMAGE_PATH: live_site_url+"/storage/images/original/",
//     THUMBNAIL_IMAGE_PATH: live_site_url+"/storage/images/thumbnail/",
//     DEFAULT_IMAGE: live_site_url+"/storage/default.png",
//     DEFAULT_THUMBNAIL_IMAGE: live_site_url+"/storage/default_thumbnail.png",
//     MEDSAILING_ASSETS: live_site_url+"/storage/medsailing_assets/",
//     MEDIA_UPLOADS: live_site_url+"/storage/media_uploads/"
// });

export const assets_path = Object.freeze({
    ORIGNAL_IMAGE_PATH: site_url+"/storage/images/original/",
    THUMBNAIL_IMAGE_PATH: site_url+"/storage/images/thumbnail/",
    DEFAULT_IMAGE: site_url+"/storage/default.png",
    DEFAULT_THUMBNAIL_IMAGE: site_url+"/storage/default_thumbnail.png",
    MEDSAILING_ASSETS: site_url+"/storage/medsailing_assets/",
    MEDIA_UPLOADS: site_url+"/storage/media_uploads/"
});
export const client_details = Object.freeze({
    CLIENT_ID: "2",
    CLIENT_SECRET: server_client_secret
});
export const server_details = Object.freeze({
    SERVER_URL: site_url+"/api/",
});
export const paypal_details = Object.freeze({
    PAYPAL_URL: paypal_src,
});
