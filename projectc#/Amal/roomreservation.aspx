<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="roomreservation.aspx.cs" Inherits="projectc_.Amal.roomreservation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
   
<head runat="server">
     <title>ROOM</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form2" runat="server">
        <div>
            <section class="vh-100" style="background-color: #2779e2;">
                <div class="container h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-xl-9">

                            <h1 class="text-white mb-4">Reserve Room</h1>

                            <div class="card" style="border-radius: 15px;">
                                <div class="card-body">

                                    <div class="row align-items-center pt-4 pb-3">
                                        <div class="col-md-3 ps-5">

                                            <h6 class="mb-0">Room ID</h6>

                                        </div>
                                        <div class="col-md-9 pe-5">

                                            <asp:TextBox type="text" class="form-control form-control-lg" runat="server" ID="idroom" />

                                        </div>
                                    </div>

                                    <hr class="mx-n3">

                                    <div class="row align-items-center py-3">
                                        <div class="col-md-3 ps-5">

                                            <h6 class="mb-0">Your Name</h6>

                                        </div>
                                        <div class="col-md-9 pe-5">

                                            <asp:TextBox type="text" class="form-control form-control-lg" runat="server" ID="nameroom" />

                                        </div>
                                    </div>

                                    <hr class="mx-n3">

                                    <div class="row align-items-center py-3">
                                        <div class="col-md-3 ps-5">

                                            <h6 class="mb-0">Date</h6>

                                        </div>
                                        <div class="col-md-9 pe-5">

                                            <asp:TextBox type="date" class="form-control form-control-lg" runat="server" ID="dateroom" />

                                        </div>
                                    </div>

                                    <hr class="mx-n3">

                                    <div class="row align-items-center py-3">
                                        <div class="col-md-3 ps-5">

                                            <h6 class="mb-0">strat in</h6>

                                        </div>
                                        <div class="col-md-9 pe-5">

                                            <asp:TextBox type="time" class="form-control form-control-lg" runat="server" ID="timeroom" />

                                        </div>
                                    </div>


                                    <hr class="mx-n3">


                                    <div class="px-5 py-4">
                                        <asp:Button runat="server" ID="sendreserve" OnClick="sendreserve_Click" Text="reserve" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg" />
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </section>
        </div>
    </form>
</body>
</html>
