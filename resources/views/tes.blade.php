<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ambil Query URL</title>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const currentUrl = window.location.href;
            console.log("Current URL: " + currentUrl);

            let queryString = window.location.search;
            console.log("Query String: " + queryString);
            const urlParams = new URLSearchParams(queryString);
            let transactionStatus = urlParams.get('transaction_status');
            console.log("transaction_status': " + transactionStatus);

				window.location.href = 'http://127.0.0.1:8000/user/status-payment' + queryString;
        });
    </script>
</head>
<body>
    <h1>Ambil Query URL di JavaScript</h1>
    <p id="result"></p>
</body>
</html>
