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
            <td style="text-align:right; width:165px; vertical-align: bottom;">
            </td>
        </tr>
    </table>
    <table style="width:100%; border: 1px solid #c8ced3!important;">
        <tr style="background-color:#20a8d8 !important; border: 1px solid #c8ced3 !important;">
            <td colspan="2" style="color:#fff; font-size:14px; padding:8px;">
                <strong>INQUIRY FORM - {{ $data->inquiry['subject']  }}</strong>
            </td>
        </tr>
        <tr style="border: 1px solid #c8ced3 !important;">
            <td style="padding:10px;">
                <h6 style="color: #20a8d8 !important; font-size:14px; margin:0px;">Destination</h6>
                <h3 style="margin:0px; padding:0px; font-weight: bold; font-size: 1.25rem;">
                    {{ $data->itinerary['itinerary_city_from']['name']  }} to {{ $data->itinerary['itinerary_city_to']['name']  }}
                </h3>
            </td>
            <td style="padding:10px;">
                <h6 style="color: #20a8d8 !important; font-size:14px; margin:0px;">Check in & Check Out Dates</h6>
                <h3 style="margin:0px; padding:0px; font-weight: bold; font-size: 1.25rem;">
                    {{  $data->itinerary['check_in']['other_formats']['format_1']  }} - {{  $data->itinerary['check_out']['other_formats']['format_1'] }}
                </h3>
            </td>
        </tr>
        <tr>
            <td style="padding:10px;">
                <h6 style="color: #20a8d8 !important; font-size:14px; margin:0px;">Full Name:</h6>
                <p style="margin:0px; padding:0px; font-weight: 600;">{{ $data->inquiry['full_name']  }}</p>
            </td>
            <td style="padding:10px;">
                <h6 style="color: #20a8d8 !important; font-size:14px; margin:0px;">Email:</h6>
                <p style="margin:0px; padding:0px; font-weight: 600;">{{ $data->inquiry['email']  }}</p>
            </td>
        </tr>
        <tr style="border: 1px solid #c8ced3 !important; border-top:none !important;">
            <td colspan="2" style="padding:10px;">
                <h6 style="color: #20a8d8 !important; font-size:14px; margin:0px;">Message:</h6>
                <p style="margin:0px; padding:0px; font-weight: 600;">
                    {!! nl2br(e($data->inquiry['message'])) !!}
                </p>
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
