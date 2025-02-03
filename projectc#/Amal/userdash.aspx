<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userdash.aspx.cs" Inherits="projectc_.Amal.userdash" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        /* General Body Styling */
        body {
            background-color: #f4f7fc;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        /* Center the Card Container */
        #card {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            gap: 30px;
            margin-top: 30px;
            flex-wrap: wrap; /* Allow cards to wrap on smaller screens */
            padding: 10px;
        }

        /* Card Styling */
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 22rem; /* Increased width for larger screens */
            margin-bottom: 30px;
        }

        .card-img-top {
            object-fit: cover;
            width: 100%;
            height: 200px; /* Fixed height for all cards */
        }

        /* Card Body Styling */
        .card-body {
            background-color: #ffffff;
            padding: 20px;
        }

        .card-title {
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }

        .card-text {
            color: #555;
            font-size: 14px;
            margin-bottom: 20px;
        }

        /* Button Styling */
        .btn-primary {
            width: 100%;
            background-color: #007bff;
            border-color: #007bff;
            font-size: 16px;
            padding: 12px;
            text-transform: uppercase;
            letter-spacing: 1px;
            border-radius: 5px;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        /* Responsive Styling for Smaller Screens */
        @media (max-width: 992px) {
            .card {
                width: 48%; /* Two cards per row on medium screens */
            }
        }

        @media (max-width: 768px) {
            .card {
                width: 100%; /* Full width on smaller screens */
                margin-bottom: 20px;
            }

            #card {
                gap: 20px;
                flex-direction: column; /* Stack cards vertically */
                margin-top: 20px;
            }

            .card-img-top {
                height: 150px; /* Smaller images for small screens */
            }
        }

    </style>
    <title>User Page</title>
</head>
<body>
    <form id="form2" runat="server">
        <div>
            <div id="card">
                <!-- First Card: See A Room -->
                <div class="card">
                    <img class="card-img-top" src="u1.jpg" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">See A Room Meeting</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <asp:Button class="btn btn-primary" Text="See" runat="server" OnClick="Unnamed_Click"/>
                    </div>
                </div>
                <!-- Second Card: Reserve A Room -->
                <div class="card">
                    <img class="card-img-top" src="u2.jpg" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">Reserve A Room Meeting</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <asp:Button runat="server" OnClick="Unnamed_Click1" class="btn btn-primary" Text="Reserve" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

