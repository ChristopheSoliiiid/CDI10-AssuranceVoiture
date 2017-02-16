<%@include file="common/header.jsp" %>

<!-- SCRIPT POUR LA SELECTION DE LA VOITURE -->
<script>
    function modeles() {
        var xhttp = new XMLHttpRequest();

        xhttp.onreadystatechange = function () {

            if (this.readyState == 4 && this.status == 200) {
                var tab = this.responseText.split(", ");
                var last = tab.length - 1;

                tab[0] = tab[0].replace("[", "");
                tab[last] = tab[last].replace("]", "");

                // Vide le select pour ins�rer les nouvelles options apr�s
                $("#modeleSelect").empty();

                // Cr�ation d'une option d�sactiv� pour inciter � choisir un modele
                $("#modeleSelect").append(
                        new Option("---- Choisir un mod�le ----", "", true, true));
                $("#modeleSelect option:selected").attr("disabled", "disabled");

                // De m�me pour la version du v�hicule
                $("#versionSelect").empty();

                $("#versionSelect").append(
                        new Option("---- Choisir un mod�le ----", "", true, true));
                $("#versionSelect option:selected").attr("disabled", "disabled");

                for (elt in tab) {
                    $("#modeleSelect").append(
                            new Option(tab[elt], tab[elt]));
                }
            }
        };
        var marque = $("#marqueSelect").val();

        xhttp.open("GET", "AjaxServeur?marque=" + marque, true);
        xhttp.send();
    }
    ;

    function versions() {
        var xhttp = new XMLHttpRequest();

        xhttp.onreadystatechange = function () {

            if (this.readyState == 4 && this.status == 200) {
                var tab = this.responseText.split(", ");
                var last = tab.length - 1;

                tab[0] = tab[0].replace("[", "");
                tab[last] = tab[last].replace("]", "");

                // Vide le select pour ins�rer les nouvelles options apr�s
                $("#versionSelect").empty();

                // Cr�ation d'une option d�sactiv� pour inciter � choisir une version
                $("#versionSelect").append(
                        new Option("---- Choisir une version ----", "", true, true));
                $("#versionSelect option:selected").attr("disabled", "disabled");

                for (elt in tab) {
                    $("#versionSelect").append(
                            new Option(tab[elt], tab[elt]));
                }
            }
        };

        var modele = $("#modeleSelect").val();

        xhttp.open("GET", "AjaxServeur?modele=" + modele, true);
        xhttp.send();

    }
    ;
</script>


<!-- container -->
<div class="container">

    <ol class="breadcrumb">
        <li><a href="index.html">Accueil</a></li>
        <li>Inscription</li>
        <li class="active">Information sur le v�hicule</li>
    </ol>

    <div class="row">

        <!-- Article main content -->
        <article class="col-xs-12 maincontent">
            <header class="page-header">
                <h1 class="page-title">Inscription</h1>
            </header>

            <div class="col-md-10 col-md-offset-1 col-sm-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <h3 class="thin text-center">Cr�ation d'un compte</h3>

                        <hr>

                        <form action="Controleur?cmd=signupEnd" method="POST">
                            <div class="row">
                                <div class="col-md-5">
                                    <h4 class="text-center top-margin"><u>Selectionner votre v�hicule :</u></h4>

                                    <div class="top-margin">
                                        <label class="text-left">Marque du v�hicule</label>
                                        <select name="marque" class="form-control" id="marqueSelect" onchange="modeles()" data-validation="required">
                                            <option value="" disabled selected>---- Choisir une marque ----</option>
                                            <option value="BMW">BMW</option>
                                            <option value="Citroen">Citro�n</option>
                                            <option value="Ford">Ford</option>
                                            <option value="Porsche">Porsche</option>
                                            <option value="Tesla">Tesla</option>
                                        </select>
                                    </div>

                                    <div class="top-margin">
                                        <label>Mod�le du v�hicule</label>
                                        <select name="modele" class="form-control" id="modeleSelect" onchange="versions()" data-validation="required">
                                            <option value="" disabled selected>---- Choisir une marque ----</option>
                                        </select>
                                    </div>

                                    <div class="top-margin">
                                        <label>Version du v�hicule</label>
                                        <select name="version" class="form-control" id="versionSelect" data-validation="required">
                                            <option value="" disabled selected>---- Choisir une marque ----</option>
                                        </select>
                                    </div>

                                </div>

                                <div class="col-md-5 col-md-offset-2">
                                    <h4 class="text-center top-margin"><u>Utilisation du v�hicule :</u></h4>


                                    <div class="top-margin">
                                        <label class="text-left">Usage pr�vu du v�hicule</label>
                                        <select name="usage" class="form-control">
                                            <option value="Priv�">Priv�</option>
                                            <option value="Prive et trajet travail">Priv� et trajet travail</option>
                                            <option value="Prive et professionnel">Priv� et professionnel</option>
                                            <option value="Tournees r�gulieres">Tourn�es r�guli�res</option>
                                        </select>
                                    </div>

                                    <div class="top-margin">
                                        <label>Mode de parking la nuit</label>
                                        <select name="parking" class="form-control">
                                            <option value="Garage ferm� individuel">Garage ferm� individuel</option>
                                            <option value="Parking ferm� collectif">Parking ferm� collectif</option>
                                            <option value="Parking collectif en plein air">Parking collectif en plein air</option>
                                            <option value="Jardin clos priv�">Jardin clos priv�</option>
                                            <option value="Voie publique">Voie publique</option>
                                        </select>
                                    </div>

                                    <div class="top-margin">
                                        <label>Kilom�tres parcourus par an (maximum)</label>
                                        <select name="km" class="form-control">
                                            <option value="1999">Moins de 2000</option>
                                            <option value="2000">2000</option>
                                            <option value="5000">5000</option>
                                            <option value="7000">7000</option>
                                            <option value="10000">10 000</option>
                                            <option value="12500">12 500</option>
                                            <option value="15000">15 000</option>
                                            <option value="20000">20 000</option>
                                            <option value="25000">25 000</option>
                                            <option value="30000">30 000</option>
                                            <option value="40000">40 000</option>
                                            <option value="40001">Plus de 40 000</option>
                                        </select>
                                    </div>
                                </div>

                            </div>
                            
                            <div class="row">
                                <br>
                                
                                
                                <div class="col-lg-12">
                                    <hr>
                                    <h3 class=" thin text-center">Choix d'un pack assurance</h3>
                                    <br>
                                </div>                                
                                
                                <div class="col-lg-4">
                                    <table style="width:100%;">
                                        <thead>
                                            <tr>
                                                <th class="text-center">Au tiers</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr class="text-center"><td><h4>59 Euros</h4></td></tr>
                                        </tfoot>
                                        <tbody>
                                            <tr style="background-color:darkseagreen;"><td>Responsabilt� civil</td></tr>
                                            <tr style="background-color:darkseagreen;"><td>Bris de glace</td></tr>
                                            <tr style="background-color:indianred;"><td>Vol</td></tr>
                                            <tr style="background-color:indianred;"><td>Incendie</td></tr>
                                            <tr style="background-color:indianred;"><td>Collision</td></tr>
                                        </tbody>
                                    </table>
                                    <div class="radio-center"><input type="radio" name="packAssurance" value="Au tiers" required></div>
                                </div>
                                
                                <div class="col-lg-4">
                                    <table style="width:100%;">
                                        <thead>
                                            <tr>
                                                <th class="text-center">Interm�diaire</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr class="text-center"><td><h4>99 Euros</h4></td></tr>
                                        </tfoot>
                                        <tbody>
                                            <tr style="background-color:darkseagreen;"><td>Responsabilt� civil</td></tr>
                                            <tr style="background-color:darkseagreen;"><td>Bris de glace</td></tr>
                                            <tr style="background-color:darkseagreen;"><td>Vol</td></tr>
                                            <tr style="background-color:indianred;"><td>Incendie</td></tr>
                                            <tr style="background-color:indianred;"><td>Collision</td></tr>
                                        </tbody>
                                    </table>
                                    <div class="radio-center"><input type="radio" name="packAssurance" value="Interm�diaire" required></div>
                                </div>
                                
                                <div class="col-lg-4">
                                    <table style="width:100%;">
                                        <thead>
                                            <tr>
                                                <th class="text-center">Tous risques</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr class="text-center"><td><h4>199 Euros</h4></td></tr>
                                        </tfoot>
                                        <tbody>
                                            <tr style="background-color:darkseagreen;"><td>Responsabilt� civil</td></tr>
                                            <tr style="background-color:darkseagreen;"><td>Bris de glace</td></tr>
                                            <tr style="background-color:darkseagreen;"><td>Vol</td></tr>
                                            <tr style="background-color:darkseagreen;"><td>Incendie</td></tr>
                                            <tr style="background-color:darkseagreen;"><td>Collision</td></tr>
                                        </tbody>
                                    </table>
                                    <div class="radio-center"><input type="radio" name="packAssurance" value="Tous risques" required></div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-12">

                                    <hr>

                                    <div class="text-center">
                                        <a href="Controleur?cmd=signup" class="btn btn-warning">Retour</a>
                                        <button class="btn btn-info" type="submit">Valider</button>
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

<%@include file="common/footer.jsp" %>
