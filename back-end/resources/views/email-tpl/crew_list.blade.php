<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Boat Manifest - Medsailing</title>
    <!-- Fonts -->
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <!-- Styles -->
</head>
<body>

<div class="p-4 bg-white" style="max-width:980px; width: 980px;  margin: 0 auto;">
    <table style="width:100%;">
        <tr>
            <td style="text-align:left; vertical-align: bottom;">
                <img src="{{url('/storage/medsailing_assets/medsailing-logo.png')}}" width="120px" height="95.2px"
                     class="medsailing-logo-print" alt="Medsailing Logo">
            </td>
            <td style="text-align:center; vertical-align: bottom;">
                <h6 style="font-size:14px; margin:0px;">MED SAILING HOLIDAYS CY LTD</h6>
                <p style="font-size:14px; margin:0px;">Karantoki Building, 5th floor, Flat/Office 13 Nicosia, Larnaka
                    1065 Cyprus</p>
                <p style="font-size:14px; margin:0px;">
                    Contact Number : +44 20 3289 9366
                </p>
            </td>
            <td style="text-align:right; width:165px; vertical-align: bottom;">
            </td>
        </tr>
    </table>
    <table style="width:100%;">
        <tr style="background-color:#20a8d8 !important; border: 1px solid #c8ced3 !important;">
            <td colspan="2" style="color:#fff; font-size:14px; padding:8px;">
                <strong>TRIP DETAILS</strong>
            </td>
        </tr>
        <tr style="border: 1px solid #c8ced3 !important; border-bottom:none !important;">
            <td style="padding:10px;">
                <h6 style="color: #20a8d8 !important; font-size:14px; margin:0px;">Itinerary Brand</h6>
                <h3 style="margin:0px; padding:0px; font-weight: bold; font-size: 1.75rem;">
                    {{$data->itinerary_brand->description}}
                    <span style="font-size: 14px; margin: 0px; color: #73818f !important; display:block;">{{$data->itinerary_country->name}}</span>
                </h3>
            </td>
            <td style="padding:10px;">
                <h6 style="color: #20a8d8 !important; font-size:14px; margin:0px;">Boat Model</h6>
                <h3 style="margin:0px; padding:0px; font-weight: bold; font-size: 1.75rem;">
                    {{$data->itinerary_boat->boat_brand->name}}
                    <span style="font-size: 14px; margin: 0px; color: #73818f !important; display:block;">
                        {{$data->itinerary_boat->boat_type->name}}
                    </span>
                </h3>
            </td>
        </tr>
        <tr style="border: 1px solid #c8ced3 !important; border-top:none !important;">
            <td style="padding:10px;">
                <h6 style="color: #20a8d8 !important; font-size:14px; margin:0px;">Check In</h6>
                <h3 style="margin:0px; padding:0px; font-weight: bold; font-size: 1.75rem;">
                    {{$data->itinerary_city_from->name}}
                    <span style="font-size: 14px; margin: 0px; color: #73818f !important; display:block;">
                        {{$data->port_from->name}}
                    </span>
                </h3>
                <span style="font-size: 0.875rem; font-weight: 500; margin: 0px; display:block; padding-bottom: 5px;">
                     {{$data->check_in['other_formats']['format_2']}}
                    </span>
            </td>
            <td style="padding:10px;">
                <h6 style="color: #20a8d8 !important; font-size:14px; margin:0px;">Check out</h6>
                <h3 style="margin:0px; padding:0px; font-weight: bold; font-size: 1.75rem;">
                    {{$data->itinerary_city_to->name}}
                    <span style="font-size: 14px; margin: 0px; color: #73818f !important; display:block;">
                        {{$data->port_to->name}}
                    </span>
                </h3>
                <span style="font-size: 0.875rem; font-weight: 500; margin: 0px; display:block; padding-bottom: 5px;">
                {{$data->check_out['other_formats']['format_2']}}
                </span>
            </td>
        </tr>
        <tr style="background-color:#20a8d8 !important; border: 1px solid #c8ced3 !important;">
            <td colspan="2" style="color:#fff; font-size:14px; padding:8px;">
                <strong>GUEST DETAILS</strong>
            </td>
        </tr>
        <tr style="">
            <td colspan="2" style="padding:0px;">
                <table border="1" style="width: 100%; border: 1px solid #c8ced3 !important; margin-bottom:8px;">
                    <thead style="background-color: #f0f3f5 !important; border-bottom: 1px solid #c8ced3 !important;">
                    <tr>
                        <th style="text-align: left; font-size: 13px;padding: 8px;">Name</th>
                        <th style="text-align: left; font-size: 13px;padding: 8px;">Passport Details</th>
                        <th style="text-align: left; font-size: 13px;padding: 8px;">Other Details</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($data->itinerary_bookings as $key_ib => $row_ib)
                        @foreach($row_ib['guests'] as $key_guest => $row_guest)
                            <tr style="border: 1px solid #c8ced3 !important;">
                                <td style="width:34%; font-size: 14px; color: #000 !important; padding: 8px;">
                                    <p style="margin:0px;">
                                        <span style="color: #73818f !important; font-weight: 400;">Name : </span>
                                        {{($row_guest['guest_details']['full_name'] !=' ') ? $row_guest['guest_details']['full_name'] : 'Guest'}}
                                    </p>
                                    <p style="margin:0px;">
                                        <span style="color: #73818f !important; font-weight: 400;">Birth Date : </span>
                                        {{$row_guest['guest_details']['birth_date']['default']=='' ? 'none':$row_guest['guest_details']['birth_date']['other_formats']['format_1']}}
                                        | {{$row_guest['guest_details']['birth_date']['other_formats']['format_2']==0 ? 'none':$row_guest['guest_details']['birth_date']['other_formats']['format_2']+' years old.'}}
                                    </p>
                                    <p style="margin:0px;">
                                        <span style="color: #73818f !important; font-weight: 400;">Contact Details : </span>
                                        {{$row_guest['guest_details']['phone_number']=='' ? 'none':$row_guest['guest_details']['phone_number']}}
                                        | {{$row_guest['guest_details']['email']=='' ? 'none':$row_guest['guest_details']['email']}}
                                    </p>
                                </td>
                                <td style="width:22%; font-size: 14px; color: #000 !important; padding: 8px;">
                                    <p style="margin:0px;">
                                        <span style="color: #73818f !important; font-weight: 400;">Passport # : </span>
                                        {{$row_guest['guest_details']['passport_number']=='' ? 'none':$row_guest['guest_details']['passport_number']}}
                                    </p>
                                    <p style="margin:0px;">
                                        <span style="color: #73818f !important; font-weight: 400;">Exp. Date : </span>
                                        {{$row_guest['guest_details']['expiration_date']=='' ? 'none':$row_guest['guest_details']['expiration_date']}}
                                    </p>
                                    <p style="margin:0px;">
                                        <span style="color: #73818f !important; font-weight: 400;">Nationality : </span>
                                        {{$row_guest['guest_details']['nationality_id']=='' ? 'none':$row_guest['guest_details']['nationality_details']['description']}}
                                    </p>
                                </td>
                                <td style="width:22%; font-size: 14px; color: #000 !important; padding: 8px;">
                                    <p style="margin:0px;">
                                        <span style="color: #73818f !important; font-weight: 400;">Place of Birth : </span>
                                        {{$row_guest['guest_details']['pob_country']=='' ? 'none':$row_guest['guest_details']['pob_country']}}
                                        ,
                                        {{$row_guest['guest_details']['pob_city']=='' ? 'none':$row_guest['guest_details']['pob_city']}}
                                    </p>
                                    <p style="margin:0px;">
                                        <span style="color: #73818f !important; font-weight: 400;">Current Residency : </span>
                                        {{$row_guest['guest_details']['current_residency']=='' ? 'none':$row_guest['guest_details']['current_residency']}}
                                    </p>
                                </td>
                            </tr>
                        @endforeach
                    @endforeach

                    @foreach($data->itinerary_crews as $key_crew => $row_crew)
                        <tr style="border: 1px solid #c8ced3 !important;">
                            <td style="width:34%; font-size: 14px; color: #000 !important; padding: 8px;">
                                <p style="margin:0px;">
                                    <span style="color: #73818f !important; font-weight: 400;">Name : </span>
                                    {{($row_crew['full_name']!=' ') ? $row_crew['full_name'] : 'Guest'}}
                                </p>
                                <p style="margin:0px;">
                                    <span style="color: #73818f !important; font-weight: 400;">Birth Date : </span>
                                    {{$row_crew['birth_date']['default']=='' ? 'none':$row_crew['birth_date']['other_formats']['format_1']}}
                                    | {{$row_crew['birth_date']['other_formats']['format_2']==0 ? 'none':$row_crew['birth_date']['other_formats']['format_2']+' years old.'}}
                                </p>
                                <p style="margin:0px;">
                                    <span style="color: #73818f !important; font-weight: 400;">Contact Details : </span>
                                    {{$row_crew['phone_number']=='' ? 'none':$row_crew['phone_number']}} | {{$row_crew['email']=='' ? 'none':$row_crew['email']}}
                                </p>
                            </td>
                            <td style="width:22%; font-size: 14px; color: #000 !important; padding: 8px;">
                                <p style="margin:0px;">
                                    <span style="color: #73818f !important; font-weight: 400;">Passport # : </span>
                                    {{$row_crew['passport_number']=='' ? 'none':$row_crew['passport_number']}}
                                </p>
                                <p style="margin:0px;">
                                    <span style="color: #73818f !important; font-weight: 400;">Exp. Date : </span>
                                    {{$row_crew['expiration_date']=='' ? 'none':$row_crew['expiration_date']}}
                                </p>
                                <p style="margin:0px;">
                                    <span style="color: #73818f !important; font-weight: 400;">Nationality : </span>
                                    {{$row_crew['nationality_id']=='' ? 'none':$row_crew['nationality_details']['description']}}
                                </p>
                            </td>
                            <td style="width:22%; font-size: 14px; color: #000 !important; padding: 8px;">
                                <p style="margin:0px;">
                                    <span style="color: #73818f !important; font-weight: 400;">Place of Birth : </span>
                                    {{$row_crew['pob_country']=='' ? 'none':$row_crew['pob_country']}}, {{$row_crew['pob_city']=='' ? 'none':$row_crew['pob_city']}}
                                </p>
                                <p style="margin:0px;">
                                    <span style="color: #73818f !important; font-weight: 400;">Current Residency : </span>
                                    {{$row_crew['current_residency']=='' ? 'none':$row_crew['current_residency']}}
                                </p>
                            </td>
                        </tr>
                    @endforeach

                    <tr style="border: 1px solid #c8ced3 !important;">
                        <td style="width:34%; font-size: 14px; color: #000 !important; padding: 8px;">
                            <p style="margin:0px;">
                                <span style="color: #73818f !important; font-weight: 400;">Name : </span>
                                {{($data->itinerary_ambassador->full_name!=' ') ? $data->itinerary_ambassador->full_name : 'Guest'}}
                            </p>
                            <p style="margin:0px;">
                                <span style="color: #73818f !important; font-weight: 400;">Birth Date : </span>
                                {{ $data->itinerary_ambassador->birth_date['default']=='' ? 'none':$data->itinerary_ambassador->birth_date['other_formats']['format_1']}}
                                | {{$data->itinerary_ambassador->birth_date['other_formats']['format_2']==0 ? 'none':$data->itinerary_ambassador->birth_date['other_formats']['format_2']+' years old.'}}
                           </p>
                            <p style="margin:0px;">
                                <span style="color: #73818f !important; font-weight: 400;">Contact Details : </span>
                                {{$data->itinerary_ambassador->phone_number=='' ? 'none':$data->itinerary_ambassador->phone_number}}
                                | {{$data->itinerary_ambassador->email=='' ? 'none':$data->itinerary_ambassador->email}}
                            </p>
                        </td>
                        <td style="width:22%; font-size: 14px; color: #000 !important; padding: 8px;">
                            <p style="margin:0px;">
                                <span style="color: #73818f !important; font-weight: 400;">Passport # : </span>
                                {{$data->itinerary_ambassador->passport_number=='' ? 'none':$data->itinerary_ambassador->passport_number}}
                            </p>
                            <p style="margin:0px;">
                                <span style="color: #73818f !important; font-weight: 400;">Exp. Date : </span>
                                {{$data->itinerary_ambassador->expiration_date=='' ? 'none':$data->itinerary_ambassador->expiration_date}}
                            </p>
                            <p style="margin:0px;">
                                <span style="color: #73818f !important; font-weight: 400;">Nationality : </span>
                                {{$data->itinerary_ambassador->nationality_id=='' ? 'none':$data->itinerary_ambassador->nationality_details->description}}
                            </p>
                        </td>
                        <td style="width:22%; font-size: 14px; color: #000 !important; padding: 8px;">
                            <p style="margin:0px;">
                                <span style="color: #73818f !important; font-weight: 400;">Place of Birth : </span>
                                {{$data->itinerary_ambassador->pob_country=='' ? 'none':$data->itinerary_ambassador->pob_country}},
                                {{$data->itinerary_ambassador->pob_city=='' ? 'none':$data->itinerary_ambassador->pob_city}}
                             </p>
                            <p style="margin:0px;">
                                <span style="color: #73818f !important; font-weight: 400;">Current Residency : </span>
                                {{$data->itinerary_ambassador->current_residency=='' ? 'none':$data->itinerary_ambassador->current_residency}}
                            </p>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </table>
</div>


<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
</body>
</html>
