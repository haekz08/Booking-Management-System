<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Invoice - Medsailing</title>
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <!-- Styles -->
    <style>
        .bg-primary {
            background-color: #20a8d8 !important;
        }
        .border {
            border: 1px solid #c8ced3 !important;
        }
        h6, .h6 {
            font-size: 0.875rem;
        }
        h2, .h2 {
            font-size: 1.75rem;
        }
        p{
            font-size:14px !important;
        }
        div{
            font-size: 14px !important;
        }
        .text-primary {
            color: #20a8d8 !important;
        }
        h3, .h3 {
            font-size: 1.53125rem;
        }
    </style>
</head>
<body>
<div class="p-4 bg-white">
    <div class="row m-0 align-items-end">
        <div class="p-0 col-sm-3">
            <img src="{{url('/images/medsailing-logo.png')}}" width="120px" height="95.2px" class="medsailing-logo-print" alt="Medsailing Logo">
        </div>
        <div class="text-center col-sm-6">
            <h6 class="mb-0">MED SAILING HOLIDAYS CY LTD</h6>
            <p class="mb-0">Karantoki Building, 5th floor, Flat/Office 13 Nicosia, Larnaka 1065 Cyprus</p>
            <p class="mb-0">
                Contact Number : +44 20 3289 9366
            </p>
        </div>
        <div class="p-0 col-sm-3 text-right">
            <h6 class="mb-0 text-muted">Invoice Number</h6>
            <h2><strong>1234</strong></h2>
        </div>
    </div>
    <div class="row m-0">
        <div class="p-0 col">
            <div class="row bg-primary border border-secondary m-0">
                <div class="p-2 col">
                    <strong class="text-white">
                        TRIP DETAILS
                    </strong>
                </div>
            </div>
            <div class="border border-secondary border-top-0 bg-white p-2">
                <div class="row m-0">
                    <div class="p-1 col">
                        <h6 class="text-primary mb-0">Itinerary Brand</h6>
                        <h3 class="mb-0 pb-0 font-weight-bold">
                           {{ $data->itinerary_details->itinerary_brand->description  }}
                        <span class="text-muted d-block h6">{{ $data->itinerary_details->itinerary_country->name  }}</span></h3>
                    </div>
                    <div class="p-1 col">
                        <h6 class="text-primary mb-0">Boat Model</h6>
                        <h3 class="mb-0 pb-0 font-weight-bold">
                            {{ $data->itinerary_details->itinerary_boat->boat_brand->name  }}
                            <span class="text-muted d-block h6">{{ $data->itinerary_details->itinerary_boat->boat_type->name  }}</span></h3>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>
