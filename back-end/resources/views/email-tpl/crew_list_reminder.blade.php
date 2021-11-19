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
    @if(isset($data['custom_data']))
        <p>
            {{--{!! nl2br(e($data['custom_data']['content'])) !!}--}}
            {!! nl2br($data['custom_data']['content']) !!}
        </p>
    @else
    <p>
        I hope you’ve been keeping well.
    </p>
    <p>
        This is an important reminder that you need to fill-in your <strong>“crew list”</strong> information for your upcoming trip on our system.
    </p>
    <p>
        A <strong>crew list</strong> is term used in the sailing industry referring to the official document that all passenger-carrying vessels are required to submit to the maritime authorities by law.
    </p>
    <p>
        Hence, we are required to submit the voyage’s crew list in advance to prevent any hold-ups with the authorities and administration staff,
        so we request that you please log-in to the Med Sailing Holidays booking system using the credentials we have sent you.
    </p>
    <p>
        Kindly complete all the required fields on your profile for everyone in your group.
        Failure to provide us with your crew list information in time will prevent the boat from leaving on time and a worst-case scenario,
        would result in the boat leaving without you.  Think of it like trying to board a flight, but haven't checked in..
    </p>
    <p>
        For your guidance, here are the details we require you to complete for every passenger.  Please make sure you fill-in all required fields in the system.
    </p>
    <p>Name on passport (as displayed on passport):</p>
    <p>Passport number:</p>
    <p>Place of birth (Town, City, Country): </p>
    <p>Current country and city of residence (City and Country): </p>
    <p>Nationality: </p>
    <p>Date of birth: </p>
    <p>Mobile number: (not required for minors) </p>
    <p>WhatsApp: (for the group chat on the trip) </p>
    <p>Email: (not required for minors)</p>

    <p>You will also need to provide the following information:</p>
    <p>Any medical conditions:</p>
    <p>Any allergies:</p>
    <p>Food preference: Standard meat protein, vegan. </p>

    <p>
        <strong>*IMPORTANT:</strong>
        Our crew usually base their shopping of food and provisions on your diet preferences and orders them two (2) weeks before the date of departure.
        Failure to complete the diet preference field will mean the crew will prepare the standard meal for the guests who did not specify their preference on the system.
        It’s important that you advise us of any dietary requirements or allergies and failure to notify us 2 weeks before your departure date. We cannot be  held accountable if you don’t notify us.
    </p>
    <p>
        Please let us know if we can help you in the meantime,
    </p>
    <p>

    </p>
    <p>
        Many Thanks,<br>
        <strong>The Med Sailing Holidays Team</strong>
    </p>
    <p>
        www.medsailingholidays.com<br>
        www.yogasailingholidays.com<br>
        www.pridesailingholidays.com
    </p>
    @endif
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
