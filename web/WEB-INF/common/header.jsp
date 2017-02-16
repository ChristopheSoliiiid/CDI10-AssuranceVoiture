<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport"    content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">

        <title>Assurance Voiture !</title>

        <link rel="shortcut icon" href="assets/images/favicon.ico">

        <link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <!-- Custom styles for our template -->
        <link rel="stylesheet" href="assets/css/bootstrap-theme.css" media="screen" >
        <link rel="stylesheet" href="assets/css/main.css">
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="assets/js/html5shiv.js"></script>
        <script src="assets/js/respond.min.js"></script>
        <![endif]-->

        <!-- SCRIPT POUR LA PUB -->
        <script>
            var webSocketPub = new WebSocket("ws://localhost:8080/AssuranceVoiture/endpointPub");

            webSocketPub.onmessage = function (event) {
                $("#pub").html('<img src="assets/images/' + event.data + '" alt="Une pub!">');
            };
        </script>
    </head>

    <body data-traget=".navbar" id="page-top" class="home">
        <!-- Fixed navbar -->
        <header>
            <div class="navbar navbar-inverse navbar-fixed-top headroom" >
                <div class="container">
                    <div class="navbar-header">
                        <!-- Button for smallest screens -->
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
                        <a class="navbar-brand" href="index.html"><img src="assets/images/logo.png" alt="AssurVoiture"></a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav pull-right">
                            <li><a href="index.html">Accueil</a></li>
                            <li><a href="index.html">Obtenir un devis</a></li>
                            <li><a href="index.html">A Propos</a>
                            <li><a href="index.html">Contact</a></li>
                            <li><a href="Controleur?cmd=signin" id="connexion" class="btn btn-info">Connexion</a></li>
                            <!--<li><a href="Controleur?cmd=chat" target="_blank" id="chat" class="btn btn-warning">Live chat</a></li>-->
                        </ul>
                    </div><!--/.nav-collapse -->
                </div>
            </div>
        </header>

        <!-- /.navbar -->

        <!-- Header -->
        <header id="head">
            <div class="container">
                <div class="row">
                    <h1 class="lead">Assurance Voiture</h1>
                    <p class="tagline">Imaginez un super slogan ici qui va vous faire utiliser notre application !</p>
                </div>
            </div>
        </header>
        <!-- /Header --> 

        <!-- La pub -->
        <div class="jumbotron padding5">
            <div class="container">
                <div class="row center-block" id="pub">

                </div>
            </div>
        </div>
        <!-- La pub -->
