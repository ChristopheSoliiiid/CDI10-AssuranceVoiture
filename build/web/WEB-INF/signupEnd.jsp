<%@include file="common/header.jsp" %>

<!-- container -->
<div class="container">

    <ol class="breadcrumb">
        <li><a href="index.html">Accueil</a></li>
        <li>Inscription</li>
        <li>Information sur le véhicule</li>
        <li class="active">Finalisation</li>
    </ol>

    <div class="row">

        <!-- Article main content -->
        <article class="col-xs-12 maincontent">
            <header class="page-header">
                <h1 class="page-title">Inscription</h1>
            </header>

            <div class="col-lg-10 col-lg-offset-1 col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <h3 class="thin text-center">Confirmation de vos informations</h3>

                        <hr>

                        <form action="Controleur?cmd=createAccount" method="POST">
                            <div class="row">

                                <div class="col-md-5">

                                    <div class="row top-margin">
                                        <div class="col-sm-4">
                                            <label>Civilité : </label>
                                            <input type="text" disabled value="${Utilisateur.civilite}" class="form-control">
                                        </div>
                                        <div class="col-sm-8">
                                            <label>Nom :</label>
                                            <input type="text" disabled value="${Utilisateur.nom}" class="form-control">
                                        </div>
                                    </div>

                                    <div class="top-margin">
                                        <label>Prénom : </label>
                                        <input type="text" class="form-control" value="${Utilisateur.prenom}" disabled>
                                    </div>

                                    <div class="top-margin">
                                        <label>Adresse : </label>
                                        <input type="text" class="form-control" value="${Utilisateur.adresse}" disabled>
                                    </div>

                                    <div class="top-margin">
                                        <label>Ville : </label>
                                        <input type="text" class="form-control" value="${Utilisateur.ville}" disabled>
                                    </div>

                                    <div class="top-margin">
                                        <label>Code Postal : </label>
                                        <input type="text" class="form-control" value="${Utilisateur.cp}" disabled>
                                    </div>

                                </div>

                                <div class="col-md-5 col-md-offset-2">
                                    <div class="top-margin">
                                        <label>Date de naissance : </label>
                                        <input type="date" class="form-control" value="${Utilisateur.datenaissance}" disabled>
                                    </div>

                                    <div class="top-margin">
                                        <label>E-mail : </label>
                                        <input type="email" class="form-control" value="${Utilisateur.email}" disabled>
                                    </div>

                                    <div class="top-margin">
                                        <label>Identifiant : </label>
                                        <input type="text" class="form-control" value="${Utilisateur.identifiant}" disabled>
                                    </div>

                                    <br><br><br><br>

                                    <div class="top-margin">
                                        <label>Assurance choisi : </label>
                                        <input type="text" class="form-control" value="${Assurance.packassurance}" id="packassurance" disabled>
                                    </div>
                                </div>
                            </div>

                            <div class="row top-margin">
                                <div class="col-md-5">
                                    <h4 class="text-center top-margin"><u>Votre véhicule :</u></h4>

                                    <div class="top-margin">
                                        <label class="text-left">Marque du véhicule :</label>
                                        <input type="text" class="form-control" value="${Voiture.marque}" id="marque" disabled>
                                    </div>

                                    <div class="top-margin">
                                        <label>Modèle du véhicule :</label>
                                        <input type="text" class="form-control" value="${Voiture.modele}" id="modele" disabled>
                                    </div>

                                    <div class="top-margin">
                                        <label>Version du véhicule :</label>
                                        <input type="text" class="form-control" value="${Voiture.version}" id="version" disabled>
                                    </div>

                                </div>

                                <div class="col-md-5 col-md-offset-2">
                                    <h4 class="text-center top-margin"><u>Utilisation du véhicule :</u></h4>


                                    <div class="top-margin">
                                        <label class="text-left">Usage prévu du véhicule :</label>
                                        <input type="text" class="form-control" value="${Assurance.utilsationvoiture}" id="usage" disabled>
                                    </div>

                                    <div class="top-margin">
                                        <label>Mode de parking la nuit :</label>
                                        <input type="text" class="form-control" value="${Assurance.parking}" id="parking" disabled>
                                    </div>

                                    <div class="top-margin">
                                        <label>Kilomètres parcourus par an (maximum) :</label>
                                        <input type="text" class="form-control" value="${Assurance.kmmax}" id="kmmax" disabled>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 top-margin text-center" id="divDevis">
                                    <br> <br>
                                    <span id="estimationDevis" class="alert alert-success">

                                    </span>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-12">

                                    <hr>

                                    <div class="text-center">
                                        <label class="checkbox">
                                            <input type="checkbox" data-validation="required" required>
                                            J'ai lu et j'accepte les <a href="#">conditions d'utilisation</a> du site. <span class="text-danger">*</span>
                                        </label>
                                        <a href="Controleur?cmd=signupNext" class="btn btn-warning">Modifier mes informations</a>
                                        <button class="btn btn-info" type="submit">Créer mon compte</button>
                                    </div>

                                </div>
                            </div>

                        </form>
                    </div>
                </div>

            </div>

        </article>
        <!-- /Article -->

    </div>
</div>	<!-- /container -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
<script>
    $.validate({
        lang: 'fr'
    });
</script>
<script>
    $(function(){
        var marque = $("#marque").val();
        var modele = $("#modele").val();
        var version = $("#version").val();
        var usage = $("#usage").val();
        var parking = $("#parking").val();
        var km = $("#kmmax").val();
        var packassurance = $("#packassurance").val();

        if (marque === null || modele === null || version === null || packassurance === null) {
            var message = "<b>Erreur...";

            $("#divDevis").show();
            $("#estimationDevis").removeClass("alert-success").addClass("alert-danger");

            $("#estimationDevis").html(message + "</b>");
        } else {
            var urlWS = "http://localhost:8080/AssuranceCalcul/webresources/assurcalcul/calculAssurance?";
            urlWS += "marque=" + marque + "&modele=" + modele + "&version=" + version + "&usage=" + usage + "&parking=" + parking + "&km=" + km + "&assurance=" + packassurance;

            $.ajax({
                type: "GET",
                url: urlWS,
                success: function (data) {
                    $("#divDevis").show();
                    $("#estimationDevis").removeClass("alert-danger").addClass("alert-success");

                    $("#estimationDevis").html("<b>Estimation</b> du prix de l'assurance : <b>" + data + " euros</b> / mois.");
                }
            });
        }
    });
</script>

<%@include file="common/footer.jsp" %>
