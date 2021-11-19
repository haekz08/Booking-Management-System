<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Itinerary - Medsailing</title>
    <!-- Fonts -->
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
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
            <td style="text-align:right; vertical-align: bottom;">
                <h6 style="font-size:14px; margin:0px;color: #73818f !important;">Booking Reference</h6>
                <h2 style="font-size: 1.75rem; margin:0px;"><strong>{{ $data->reference_code_char }}{{ $data->reference_code }}</strong></h2>
            </td>
        </tr>
    </table>
    <table style="width:100%; border: 1px solid #c8ced3!important;">
        <tr style="background-color:#20a8d8 !important; border: 1px solid #c8ced3 !important;">
            <td colspan="2" style="color:#fff; font-size:14px; padding:8px;">
                <strong>TRIP DETAILS</strong>
            </td>
        </tr>
        <tr style="border: 1px solid #c8ced3 !important; border-bottom:none !important;">
            <td style="padding:10px;">
                <h6 style="color: #20a8d8 !important; font-size:14px; margin:0px;">Itinerary Brand</h6>
                <h3 style="margin:0px; padding:0px; font-weight: bold; font-size: 1.75rem;">
                    {{ $data->itinerary_details->itinerary_brand->description  }}
                    <span style="font-size: 14px; margin: 0px; color: #73818f !important; display:block;">{{ $data->itinerary_details->itinerary_country->name }}</span>
                </h3>
            </td>
            <td style="padding:10px;">
                <h6 style="color: #20a8d8 !important; font-size:14px; margin:0px;">Boat Model</h6>
                <h3 style="margin:0px; padding:0px; font-weight: bold; font-size: 1.75rem;">
                    {{ $data->itinerary_details->itinerary_boat->boat_brand->name }}
                    <span style="font-size: 14px; margin: 0px; color: #73818f !important; display:block;">{{ $data->itinerary_details->itinerary_boat->boat_type->name  }}</span>
                </h3>
            </td>
        </tr>
        <tr style="border: 1px solid #c8ced3 !important; border-top:none !important;">
            <td style="padding:10px;">
                <h6 style="color: #20a8d8 !important; font-size:14px; margin:0px;">Check In</h6>
                <h3 style="margin:0px; padding:0px; font-weight: bold; font-size: 1.75rem;">
                    {{ $data->itinerary_details->itinerary_city_from->name}}
                    <span style="font-size: 14px; margin: 0px; color: #73818f !important; display:block;">{{$data->itinerary_details->port_from->name}}</span>
                </h3>
                <span style="font-size: 0.875rem; font-weight: 500; margin: 0px; display:block; padding-bottom: 5px;">
                     {{ $data->itinerary_details->check_in['other_formats']['format_2'] }}
                    </span>
            </td>
            <td style="padding:10px;">
                <h6 style="color: #20a8d8 !important; font-size:14px; margin:0px;">Check Out</h6>
                <h3 style="margin:0px; padding:0px; font-weight: bold; font-size: 1.75rem;">
                    {{ $data->itinerary_details->itinerary_city_to->name}}
                    <span style="font-size: 14px; margin: 0px; color: #73818f !important; display:block;">{{$data->itinerary_details->port_to->name}}</span>
                </h3>
                <span style="font-size: 0.875rem; font-weight: 500; margin: 0px; display:block; padding-bottom: 5px;">
                {{ $data->itinerary_details->check_out['other_formats']['format_2'] }}
                </span>
            </td>
        </tr>
        <tr style="background-color:#20a8d8 !important; border: 1px solid #c8ced3 !important;">
            <td colspan="2" style="color:#fff; font-size:14px; padding:8px;">
                <strong>GUEST DETAILS</strong>
            </td>
        </tr>
        <tr style="border: 1px solid #c8ced3 !important;">
            <td colspan="2" style="padding:10px;">
                @foreach($data->guests as $key => $row)
                    <table style="width: 100%; border: 1px solid #c8ced3 !important; margin-bottom:8px;">
                        <thead style="background-color: #f0f3f5 !important; border-bottom: 1px solid #c8ced3 !important;">
                        <tr>
                            <th style="text-align:left; padding: 5px; width: 50%;">
                                <h5 style="margin:0px; padding:0px; font-size:1.09375rem; color: #20a8d8 !important; font-weight: 700 !important; text-transform: uppercase;">
                                    {{ ($row['guest_details']['last_name'] != "") ? $row['guest_details']['last_name'] : 'Guest '. ($key+1) }},
                                </h5>
                                <h6 style="margin:0px; font-size: 0.875rem; margin-bottom: 0.25rem !important; color: #20a8d8 !important; text-transform: uppercase;">
                                    {{($row['guest_details']['first_name'] != '') ? $row['guest_details']['first_name'] : 'Guest'}}
                                </h6>
                            </th>
                            <th style="text-align:left; padding: 5px;">
                                <h5 style="margin:0px; padding:0px; font-weight: 700; font-size: 1.09375rem;">
                                    {{ $row['guest_cabin_details']['cabin_description']['cabin_type']['name'] }}
                                    - {{$row['guest_cabin_details']['cabin_description']['code'] }}
                                </h5>
                                <h6 style="margin:0px; font-size: 0.875rem; margin-bottom: 0.25rem !important;">
                                    Occupancy ({{$row['occupancy']}})
                                </h6>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td style="padding:5px 5px 0px; font-size:14px;">
                                <strong style="color: #73818f !important;">Date of Birth</strong>
                                <p style="margin:0px;">{{$row['guest_details']['birth_date']['default']=='' ? 'none':$row['guest_details']['birth_date']['default']}}</p>
                            </td>
                            <td style="padding:0px 5px; font-size:14px;">
                                <strong style="color: #73818f !important;">Nationality</strong>
                                <p style="margin:0px;">{{$row['guest_details']['nationality_id']=='' ? 'none':$row['guest_details']['nationality_id']}}</p>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding:0px 5px; font-size:14px;">
                                <strong style="color: #73818f !important;">Email</strong>
                                <p style="margin:0px;">{{$row['guest_details']['email']=='' ? 'none':$row['guest_details']['email']}}</p>
                            </td>
                            <td style="padding:0px 5px; font-size:14px;">
                                <strong style="color: #73818f !important;">Phone Number</strong>
                                <p style="margin:0px;">{{$row['guest_details']['phone_number']=='' ? 'none':$row['guest_details']['phone_number']}}</p>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding:0px 5px; font-size:14px;">
                                <strong style="color: #73818f !important;">Passport Number</strong>
                                <p style="margin:0px;">{{$row['guest_details']['passport_number']=='' ? 'none':$row['guest_details']['passport_number']}}</p>
                            </td>
                            <td style="padding:0px 5px; font-size:14px;">
                                <strong style="color: #73818f !important;">Expiration Date</strong>
                                <p style="margin:0px;">{{$row['guest_details']['expiration_date']=='' ? 'none':$row['guest_details']['expiration_date']}}</p>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding:0px 5px; font-size:14px;">
                                <strong style="color: #73818f !important;">Place of Birth</strong>
                                <p style="margin:0px;">{{$row['guest_details']['pob_country']=='' ? 'none':$row['guest_details']['pob_country']}}</p>
                            </td>
                            <td style="padding:0px 5px; font-size:14px;">
                                <strong style="color: #73818f !important;">Current Residency</strong>
                                <p style="margin:0px;">{{$row['guest_details']['current_residency']=='' ? 'none':$row['guest_details']['current_residency']}}</p>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="padding:0px 5px 5px; font-size:14px;">
                                <strong style="color: #73818f !important;">Nationality</strong>
                                <p style="margin:0px;">{{$row['guest_details']['nationality_id']=='' ? 'none':$row['guest_details']['nationality_details']['description']}}</p>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding:0px 5px; font-size:14px;">
                                <strong style="color: #73818f !important;">Medical Issues</strong>
                                <p style="margin:0px;">{{$row['guest_details']['medical_issues']=='' ? 'none':$row['guest_details']['medical_issues']}}</p>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding:0px 5px; font-size:14px;">
                                <strong style="color: #73818f !important;">Allergies</strong>
                                <p style="margin:0px;">{{$row['guest_details']['allergies']=='' ? 'none':$row['guest_details']['allergies']}}</p>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="padding:0px 5px 5px; font-size:14px;">
                                <strong style="color: #73818f !important;">Diet</strong>
                                <p style="margin:0px;">{{$row['guest_details']['diet']=='' ? 'none':$row['guest_details']['diet']}}</p>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                @endforeach
            </td>
        </tr>
        <tr style="background-color:#20a8d8 !important; border: 1px solid #c8ced3 !important;">
            <td colspan="2" style="color:#fff; font-size:14px; padding:8px;">
                <strong>ADD ONS</strong>
            </td>
        </tr>
        <tr style="border: 1px solid #c8ced3 !important;">
            <td colspan="2" style="padding:10px;">
                @foreach($data->add_ons as $add_on)
                    <table style="width:100%; border: 1px solid #c8ced3 !important;">
                        <tr>
                            <td style="padding:10px 8px;  text-align: left;">
                                <h6 style="font-size: 0.875rem; font-weight: 700; text-transform: uppercase; margin:0px;">
                                    ({{ number_format($add_on['qty'],2)}}) {{$add_on['details']['description']}}</h6>
                                <h6 style="margin:0px; margin-bottom:0px; font-size: 0.875rem; font-weight: 500;">@
                                    &euro;{{ number_format($add_on['price'], 2) }}
                                    each</h6>
                            </td>
                            <td style="padding:10px 8px;  text-align: right; font-size:14px;">
                                <strong style="display: block; color: #73818f !important;">
                                    TOTAL
                                </strong>
                                <span style="display: block; font-size: 0.875rem; font-weight: 500;">
                                     &euro;{{ number_format($add_on['price']*$add_on['qty'], 2) }}
                                </span>
                            </td>
                        </tr>
                    </table>
                @endforeach
            </td>
        </tr>
        <tr style="background-color:#20a8d8 !important; border: 1px solid #c8ced3 !important;">
            <td colspan="2" style="color:#fff; font-size:14px; padding:8px;">
                <strong>INCLUSIONS</strong>
            </td>
        </tr>
        <tr style="border: 1px solid #c8ced3 !important;">
            <td colspan="2" style="padding:10px;">
                @foreach($data->itinerary_details->inclusions as $inclusion)
                    <div style=" padding:10px; border: 1px solid #c8ced3 !important; margin-bottom:8px;">
                        <h6 style=" margin:0px; padding:0px; font-weight: bold; font-size: 0.875rem;">
                         <i class="fa fa-fw fa-check text-success"></i> {{$inclusion['description']}}
                        </h6>
                    </div>
                @endforeach
            </td>
        </tr>
        <tr style="background-color:#20a8d8 !important; border: 1px solid #c8ced3 !important;">
            <td colspan="2" style="color:#fff; font-size:14px; padding:8px;">
                <strong>EXCLUSIONS</strong>
            </td>
        </tr>
        <tr style="border: 1px solid #c8ced3 !important;">
            <td colspan="2" style="padding:10px;">
                @foreach($data->itinerary_details->exclusions as $exclusion)
                    <div style=" padding:10px; border: 1px solid #c8ced3 !important; margin-bottom:8px;">
                        <h6 style=" margin:0px; padding:0px; font-weight: bold; font-size: 0.875rem;">
                            <i class="fa fa-fw fa-close text-danger"></i> {{$exclusion['description']}}
                        </h6>
                    </div>
                @endforeach
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
