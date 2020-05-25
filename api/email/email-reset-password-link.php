<?php

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
$data = json_decode(file_get_contents("php://input"));
if (isset($data)) {

    $Email = $data->Email;
    $Subject = $data->Subject;
    $Message = $data->Message;
    $Link = $data->Link;
    $UserFullName = $data->UserFullName;

    $msg = '
<body style="font-family: "Calibri";">
    <div class="main">
        <div class="box" style="padding: 0;background: #F5F6FA;">
            <div class="header" style="background: #FBC531;padding: 2%;">
                <h1 style="text-align: center;color: #000000;font-size: 1.5rem; font-weight: 900;">
                    FORGOT YOUR PASSWORD?
                    <span style="display: block;font-size: 1rem;">Let us get your sorted ASAP</span>
                </h1>
            </div>

            <div class="body" style="padding: 5%;">
                <p>
                    Dear ' . $UserFullName . '
                </p>

                <p>
                    Someone requested a new password for your Mr. Konkrete account.
                </p>
                <br />
                <br />
                <a href="' . $Link . '"
                    style="background: #FBC531;color: #000000;text-decoration: none;padding: .5rem 1rem;font-weight: bold;">Reset your
                    password</a>
                <br />
                <br />
                <p>
                    If you did not make this request then you can safely ignore this email :)
                </p>
                <p>
                    Yours faithfully <br> Mr. Konkrete team</p>
            </div>
        </div>
    </div>
</body>
';

    $to = $Email . ", mrnnmthembu@gmail.com ,Freedom.Khanyile1@gmail.com";
    $subject =  $Subject;
    $from = 'support@mrconcrete.co.za';

    $headers  = 'MIME-Version: 1.0' . "\r\n";
    $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

    $headers .= 'From: ' . $from . "\r\n" .
        'Reply-To: ' . $from . "\r\n" .
        'X-Mailer: PHP/' . phpversion();

    if (isset($Email)) {
        if (mail($to, $subject, $msg, $headers)) {
            echo 1;
        } else {
            echo 0;
        }
    } else {
        echo 3;
    }
}
