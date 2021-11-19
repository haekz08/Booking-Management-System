<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>"Deposit Reminder</title>
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <!-- Styles -->
</head>
<body>

<div class="p-4 bg-white" style="max-width:980px; width: 980px;  margin: 0 auto;">
    <strong>Dear {{$data['data']->user->full_name}}</strong>,
    {{--@php--}}
        {{--$content = $data['custom_data']['content'];--}}
    {{--@endphp--}}
    {{--@if ($content !== '')--}}
    @if(isset($data['custom_data']))
        <p>
            {!! nl2br(e($data['custom_data']['content'])) !!}
        </p>
    @else
        <p>
            I hope you’ve been keeping well and are looking forward to your sailing holiday.
        </p>
        <p>
            This email is just a friendly reminder that the deposit of your trip is already due. We require customers to settle their deposits within five (5) business days from their initial booking date.  Kindly settle your deposit accordingly to secure you spot on the trip.
        </p>
        <p>
            We’ve attached a copy of your invoice for your reference and for you to double check your booking.
        </p>
    @endif
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
                <h6 style="font-size:14px; margin:0px;color: #73818f !important;">Invoice Number</h6>
                <h2 style="font-size: 1.75rem; margin:0px;"><strong>{{ $data['data']->active_invoice->invoice_number }}</strong></h2>
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
                    {{ $data['data']->itinerary_details->itinerary_brand->description  }}
                    <span style="font-size: 14px; margin: 0px; color: #73818f !important; display:block;">{{ $data['data']->itinerary_details->itinerary_country->name }}</span>
                </h3>
            </td>
            <td style="padding:10px;">
                <h6 style="color: #20a8d8 !important; font-size:14px; margin:0px;">Boat Model</h6>
                <h3 style="margin:0px; padding:0px; font-weight: bold; font-size: 1.75rem;">
                    {{ $data['data']->itinerary_details->itinerary_boat->boat_brand->name }}
                    <span style="font-size: 14px; margin: 0px; color: #73818f !important; display:block;">{{ $data['data']->itinerary_details->itinerary_boat->boat_type->name  }}</span>
                </h3>
            </td>
        </tr>
        <tr style="border: 1px solid #c8ced3 !important; border-top:none !important;">
            <td style="padding:10px;">
                <h6 style="color: #20a8d8 !important; font-size:14px; margin:0px;">Check In</h6>
                <h3 style="margin:0px; padding:0px; font-weight: bold; font-size: 1.75rem;">
                    {{ $data['data']->itinerary_details->itinerary_city_from->name}}
                    <span style="font-size: 14px; margin: 0px; color: #73818f !important; display:block;">{{$data['data']->itinerary_details->port_from->name}}</span>
                </h3>
                <span style="font-size: 0.875rem; font-weight: 500; margin: 0px; display:block; padding-bottom: 5px;">
                     {{ $data['data']->itinerary_details->check_in['other_formats']['format_2'] }}
                    </span>
            </td>
            <td style="padding:10px;">
                <h6 style="color: #20a8d8 !important; font-size:14px; margin:0px;">Check Out</h6>
                <h3 style="margin:0px; padding:0px; font-weight: bold; font-size: 1.75rem;">
                    {{ $data['data']->itinerary_details->itinerary_city_to->name}}
                    <span style="font-size: 14px; margin: 0px; color: #73818f !important; display:block;">{{$data['data']->itinerary_details->port_to->name}}</span>
                </h3>
                <span style="font-size: 0.875rem; font-weight: 500; margin: 0px; display:block; padding-bottom: 5px;">
                {{ $data['data']->itinerary_details->check_out['other_formats']['format_2'] }}
                </span>
            </td>
        </tr>
        <tr style="background-color:#20a8d8 !important; border: 1px solid #c8ced3 !important;">
            <td colspan="2" style="color:#fff; font-size:14px; padding:8px;">
                <strong>INVOICE DETAILS</strong>
            </td>
        </tr>
        <tr style="border: 1px solid #c8ced3 !important;">
            <td colspan="2" style="padding:10px;">
                <table style="width: 100%; border: 1px solid #c8ced3 !important;">
                    <thead style="background-color: #f0f3f5 !important;">
                    <tr>
                        <th style="text-align:left; font-size: 13px; color: #73818f !important; padding: 8px; width:40%;">Item</th>
                        <th style="font-size: 13px; color: #73818f !important; padding: 8px; width:25%;">Qty</th>
                        <th style="font-size: 13px; color: #73818f !important; padding: 8px;">Unit Price</th>
                        <th style="text-align: right; font-size: 13px; color: #73818f !important; padding: 8px;">TOTAL
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    @php
                        $total_rooms_due=0;
                    @endphp
                    @foreach($data['data']->guests as $key => $row)
                        @php
                            $total_rooms_due = $total_rooms_due + $row['total_amount_due'];
                        @endphp
                        <tr style="border: 1px solid #c8ced3 !important;">
                            <td style="font-size: 14px; color: #000 !important; padding: 8px;">
                                {{ ($row['guest_details']['last_name'] != "") ? $row['guest_details']['last_name'] : 'Guest '. ($key+1) }}
                                <span style="display:block; color: #73818f !important; font-size:80%; font-weight: 400;">
                                    Cabin: {{ $row['guest_cabin_details']['cabin_description']['cabin_type.name'] }} - {{ $row['guest_cabin_details']['cabin_description']['code']}}
                                 | Occupancy: {{$row['occupancy']}}
                                </span>
                                @if(!$row['discounts']->isEmpty())
                                    <div>
                                        <span style="display: block;color:#f86c6b !important">Discounts:</span>
                                        @foreach($row->discounts as $key_discount => $row_discount)
                                            <span style="display:block; color: #73818f !important; font-size:80%; font-weight: 400;">&euro; {{$row_discount['total']}} - {{$row_discount['discount_description']}}</span>
                                        @endforeach
                                    </div>
                                @endif
                            </td>
                            <td style="font-size: 14px; color: #000 !important; padding: 8px;">{{  $row['occupancy'] }}</td>
                            <td style="font-size: 14px; color: #000 !important; padding: 8px;">
                                &euro; {{  number_format($row['total_amount_due'],2) }}</td>
                            <td style="text-align: right; font-size: 14px; color: #000 !important; padding: 8px;">
                                &euro; {{  number_format($row['total_amount_due'],2) }}</td>
                        </tr>
                    @endforeach
                    </tbody>
                    <tfoot style="background-color: #f0f3f5 !important;">
                    <tr>
                        <th colspan="3"
                            style="text-align:right; font-size: 13px; color: #73818f !important; padding: 8px;">SUB
                            TOTAL
                        </th>
                        <th colspan="3"
                            style="text-align:right; font-size: 13px; color: #73818f !important; padding: 8px;">
                            &euro; {{ number_format($total_rooms_due,2)  }}</th>
                    </tr>
                    </tfoot>
                </table>

                <table style="width: 100%; border: 1px solid #c8ced3 !important; margin-top:15px;">
                    <thead style="background-color: #f0f3f5 !important;">
                    <tr>
                        <th style="text-align: left; font-size: 13px; color: #73818f !important; padding: 8px; width:40%;">Add Ons</th>
                        <th style="font-size: 13px; color: #73818f !important; padding: 8px; width:25%;">Qty</th>
                        <th style="font-size: 13px; color: #73818f !important; padding: 8px;">Unit Price</th>
                        <th style="text-align: right; font-size: 13px; color: #73818f !important; padding: 8px;">TOTAL
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    @php
                        $total_add_ons=0;
                    @endphp
                    @foreach($data['data']->add_ons as $addon_key => $addon_row)
                        @php
                            $total_add_ons = $total_add_ons + $addon_row['total'];
                        @endphp
                        <tr style="border: 1px solid #c8ced3 !important;">
                            <td style="font-size: 14px; color: #000 !important; padding: 8px;">
                                {{$addon_key+1}} {{$addon_row['details']['description'] }}
                            </td>
                            <td style="font-size: 14px; color: #000 !important; padding: 8px;">{{  $addon_row['qty'] }}</td>
                            <td style="font-size: 14px; color: #000 !important; padding: 8px;">
                                &euro; {{  $addon_row['price'] }}</td>
                            <td style="text-align: right; font-size: 14px; color: #000 !important; padding: 8px;">
                                &euro; {{  number_format($addon_row['total'],2) }}</td>
                        </tr>
                    @endforeach
                    </tbody>
                    <tfoot style="background-color: #f0f3f5 !important;">
                    <tr>
                        <th colspan="3"
                            style="text-align:right; font-size: 13px; color: #73818f !important; padding: 8px;">SUB
                            TOTAL
                        </th>
                        <th colspan="3"
                            style="text-align:right; font-size: 13px; color: #73818f !important; padding: 8px;">
                            &euro; {{ number_format($total_add_ons,2)  }}</th>
                    </tr>
                    </tfoot>
                </table>

                <table style="width: 100%; border: 1px solid #c8ced3 !important; margin-top:15px;">
                    <thead style="background-color: #f0f3f5 !important;">
                    <tr>
                        <th style="text-align: left; font-size: 13px; color: #73818f !important; padding: 8px;">Payments Made</th>
                        <th style="text-align: right; font-size: 13px; color: #73818f !important; padding: 8px;">Amount
                            Paid
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    @php
                        $total_invoices=0;
                    @endphp
                    @foreach($data['data']->invoices as $invoice_key => $invoice_row)
                        @foreach($invoice_row['payments'] as $payment_key => $payment_row)
                            <tr style="border: 1px solid #c8ced3 !important;">
                                <td style="font-size: 14px; color: #000 !important; padding: 8px;">
                                    {{ $payment_row['data_logs']['create_details']['date_time']['other_formats']['format_1'] }}
                                    <span style="display:block; color: #73818f !important; font-size:80%; font-weight: 400;">
                                    Receipt #:  {{$payment_row['invoice_payment_number'] }}
                                    | Payment Type: {{$payment_row['payment_type']['description'] }}
                                </span>
                                </td>
                                <td style="text-align:right; font-size: 14px; color: #000 !important; padding: 8px;">
                                    {{ $payment_row['amount_paid']['other_formats']['format_1'] }}
                                </td>
                            </tr>
                        @endforeach
                    @endforeach
                    </tbody>
                    <tfoot style="background-color: #f0f3f5 !important;">
                    <tr>
                        <th style="text-align:right; font-size: 13px; color: #73818f !important; padding: 8px; width: 82.8%;">
                            TOTAL PAYMENT
                        </th>
                        <th style="text-align:right; font-size: 13px; color: #73818f !important; padding: 8px;">
                            {{ $data['data']->total_payment['other_formats']['format_1']  }}
                        </th>
                    </tr>
                    </tfoot>
                </table>
            </td>
        </tr>
        <tr style="background-color:#20a8d8 !important; border: 1px solid #c8ced3 !important;">
            <td colspan="2" style="color:#fff; font-size:14px; padding:8px;">
                <strong>INVOICE SUMMARY</strong>
            </td>
        </tr>
        <tr style="border: 1px solid #c8ced3 !important;">
            <td colspan="2" style="padding:10px;">
                <h5 style="margin:0px; font-size: 1.09375rem;">For bank payments: </h5>
                <p style="font-size: 0.875rem;">
                    Please use your surname as your reference.
                </p>
                <table style="width:100%;">
                    <tr>
                        <td style="width:45%;">
                            <p style="font-size: 0.875rem;">
                                <strong>ACCOUNT NAME:</strong> Med Sailing Holidays CY Ltd <br>
                                <strong>ACCOUNT NUMBER:</strong> 357023540571<br>
                                <strong>SWIFT / BIC:</strong> BCYPCY2N / BCYPCY2NXXX <br>
                                <strong>IBAN:</strong> CY49 0020 0195 0000 3570 2354 0571 (with no spaces) <br>
                                BANK OF CYPRUS <br>
                                51 STASSINOS STREET <br>
                                AYIA PARASKEVI, STROVOLOS <br>
                                2002 NICOSIA (LEFKOSIA)
                            </p>
                        </td>
                        <td style="width:65%; vertical-align: top;">
                            <table style="width:100%;">
                                <tr style="border: 1px solid #c8ced3 !important; background-color: #f0f3f5 !important;">
                                    <td style="color: #73818f !important; font-size: 0.875rem; padding:8px; font-weight: bolder;">INVOICE TOTAL</td>
                                    <td style="text-align: right; font-size: 0.875rem; padding:8px; font-weight: bolder;">
                                        &euro;  {{ number_format($total_rooms_due + $total_add_ons, 2)}}
                                    </td>
                                </tr>
                                <tr style="border: 1px solid #c8ced3 !important; background-color: #f0f3f5 !important;">
                                    <td style="color: #73818f !important; font-size: 0.875rem; padding:8px; font-weight: bolder;">TOTAL PAYMENT</td>
                                    <td style="text-align: right; font-size: 0.875rem; padding:8px; font-weight: bolder;">
                                        {{ $data['data']->total_payment['other_formats']['format_1']  }}
                                    </td>
                                </tr>
                                <tr style="border: 1px solid #c8ced3 !important; background-color: #f0f3f5 !important;">
                                    <td style="color: #73818f !important; font-size: 0.875rem; padding:8px; font-weight: bolder; ">OUTSTANDING BALANCE</td>
                                    <td style="text-align: right; font-size: 0.875rem; padding:8px; font-weight: bolder;">
                                        {{ $data['data']->active_invoice['invoice_balance']['other_formats']['format_1'] }}
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div style="font-size: 0.875rem; margin-bottom: 10px; font-weight: 400; padding:15px; color: #115770; background-color: #d2eef7; border-color: #c1e7f4;">
                                Please ensure you and your group have read and understand the terms and conditions listed on our website www.medsailingholidays.com/terms-andconditions. Extras are not included in the price (dinner, water taxis, alcohol, excursions or gratuities). There is a strict no refund policy for any cancellations under 12 weeks from departure date. Payment by credit card attracts a 4% surcharge.
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br>
    <p>
        If you wish to proceed to paying your deposit, please click here:
    </p>
    <p>You may LOGIN at <a href="https://mshbookingengine.com/login">https://mshbookingengine.com/login</a> </p>
    <p>
        If there’s anything in the meantime, please don’t hesitate to contact us. We look forward to sailing with you.
    </p>
    <p>
        Thank you for choosing to sail with us, we value your business.
    </p>
    <p>
        Kind Regards,<br>
        <strong>The Med Sailing Holidays Team</strong>
    </p>
    <p>
        www.medsailingholidays.com<br>
        www.yogasailingholidays.com<br>
        www.pridesailingholidays.com
    </p>
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

