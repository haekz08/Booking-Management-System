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
    <p style="text-align: justify-all">
        To our valued customers,
    </p>
    <p style="text-align: justify-all">
        Good news! In order to improve and provide you with better service, we are happy to update you that our online booking system is already live and active.
    </p>
    <p style="text-align: justify-all">
        We aim to provide you with a smooth booking process experience and this system goes a long way to achieve this. With the online booking system you will be able to book and review your trip, complete your crew list, monitor your payments and more.
    </p>
    <p style="text-align: justify-all">
        Since you have already booked we have already migrated your booking information over to the new system.
    </p>
    <p style="text-align: justify-all">
        You will find your account credentials below. Kindly login onto the Med Sailing Holidays booking engine using your given username and temporary password. There you can change your password and update your crew list information.
    </p>

    <strong>Customer Login Credentials</strong>
    <p style="margin: 0px;">Username: <span style="color:#20a8d8;font-weight:bold;">{{ $data['data']->user->email }}</span></p>
    <p style="margin: 0px;">Password: <span style="color:#20a8d8;font-weight:bold;">{{ $data['data']->user->default }}</span></p>
    <p>You may LOGIN here <a href="https://mshbookingengine.com/login">https://mshbookingengine.com/login</a> </p>

    <p style="text-align: justify-all">
        If there is anything else that you wish to inquire, please do not hesitate to contact us on our email: info@medsailingholidays.com.
    </p>
    <p style="text-align: justify-all">
        Thank you for choosing to sail with us, we look forward to meeting everyone.
    </p>

    <p>
        Best Regards,<br>
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
