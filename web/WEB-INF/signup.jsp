<%@include file="common/header.jsp" %>

<!-- container -->
<div class="container">

    <ol class="breadcrumb">
        <li><a href="index.html">Accueil</a></li>
        <li class="active">Inscription</li>
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
                        <h3 class="thin text-center">Création d'un compte</h3>

                        <hr>

                        <form action="Controleur?cmd=signupNext" method="POST">
                            <div class="col-md-5">

                                <div class="row top-margin">
                                    <div class="col-sm-4">
                                        <label class="control-label">Civilité : <span class="text-danger">*</span></label>
                                        <select class="form-control" data-validation="required" name="civ">
                                            <option value="" selected disabled>--------</option>
                                            <option value="Mr.">Mr.</option>
                                            <option value="Mme.">Mme.</option>
                                            <option value="Mlle.">Mlle.</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-8 control-group">
                                        <label class="control-label">Nom : <span class="text-danger">*</span></label>
                                        <input type="text" value="${Utilisateur.nom}" class="form-control" name="nom" data-validation="length required" data-validation-length="2-30">
                                    </div>
                                </div>

                                <div class="top-margin control-group">
                                    <label class="control-label">Prénom : <span class="text-danger">*</span></label>
                                    <input type="text" value="${Utilisateur.prenom}" class="form-control" name="prenom" data-validation="length required" data-validation-length="2-30">
                                </div>

                                <!-- Script pour l'input date sous FireFox -->
                                <script src="//cdn.jsdelivr.net/webshim/1.14.5/polyfiller.js"></script>
                                <script>
                                    webshims.setOptions('forms-ext', {types: 'date'});
                                    webshims.polyfill('forms forms-ext');
                                </script>
                                <div class="top-margin control-group">
                                    <label class="control-label">Date de naissance : <span class="text-danger">*</span></label>
                                    <input type="date" value="${Utilisateur.datenaissance}" name="dateNaissance" class="form-control" data-validation="birthdate required">
                                </div>

                                <div class="top-margin control-group">
                                    <label class="control-label">Adresse : <span class="text-danger">*</span></label>
                                    <input type="text" value="${Utilisateur.adresse}" name="adresse" class="form-control" data-validation="length required" data-validation-length="5-100">
                                </div>

                                <div class="top-margin control-group">
                                    <label class="control-label">Ville : <span class="text-danger">*</span></label>
                                    <input type="text" value="${Utilisateur.ville}" name="ville" class="form-control" data-validation="length required" data-validation-length="3-50">
                                </div>

                                <div class="top-margin control-group">
                                    <label class="control-label">Code Postal : <span class="text-danger">*</span></label>
                                    <input type="text" value="${Utilisateur.cp}" name="cp" class="form-control" data-validation="number length" data-validation-length="3-5">
                                </div>

                            </div>

                            <div class="col-md-5 col-md-offset-2">

                                <div class="top-margin control-group">
                                    <label class="control-label">E-mail : <span class="text-danger">*</span></label>
                                    <input type="email" value="${Utilisateur.email}" class="form-control" name="email_confirmation" data-validation="email length"  data-validation-length="max50">
                                </div>

                                <div class="top-margin control-group">
                                    <label class="control-label">Confirmation e-mail : <span class="text-danger">*</span></label>
                                    <input type="email" value="${Utilisateur.email}" class="form-control" name="email" data-validation="confirmation">
                                </div>

                                <div class="top-margin control-group">
                                    <label class="control-label">Identifiant : <span class="text-danger">*</span></label>
                                    <input type="text" value="${Utilisateur.identifiant}" name="identifiant" class="form-control" data-validation="length" data-validation-length="3-15">
                                </div>

                                <div class="top-margin control-group">
                                    <label class="control-label">Mot de passe : <span class="text-danger">*</span></label>
                                    <input type="password" value="${Utilisateur.motdepasse}" class="form-control" name="pass_confirmation" data-validation="strength" data-validation-strength="2">
                                </div>

                                <div class="top-margin control-group">
                                    <label class="control-label">Confirmation mot de passe : <span class="text-danger">*</span></label>
                                    <input type="password" value="${Utilisateur.motdepasse}" class="form-control" name="pass" data-validation="confirmation">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">

                                    <hr>

                                    <div class="text-center">                                        
                                        <button class="btn btn-info" type="submit">Continuer</button>
                                        <br><br>

                                    </div>

                                </div>
                            </div>

                        </form>

                        <button class="btn btn-success center-block" id="auto-fill">Auto-remplissage !</button>

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
        lang: 'fr',
        modules: 'security, date',
        onModulesLoaded: function () {
            var optionalConfig = {
                fontSize: '11pt',
                padding: '4px',
                bad: 'Mauvais',
                weak: 'Faible',
                good: 'Bon',
                strong: 'Super'
            };

            $('input[name="pass_confirmation"]').displayPasswordStrength(optionalConfig);
        }
    });
</script>

<script>
    $("#auto-fill").on("click", function () {
        $('select[name=civ]').val("Mr.");
        $('input[name=nom]').val("Marin");
        $('input[name=prenom]').val("Christophe");
        $('input[name=dateNaissance]').val("1992-04-15");
        $('input[name=adresse]').val("9 rue de l'Embanie");
        $('input[name=ville]').val("Frouard");
        $('input[name=cp]').val("54390");
        $('input[name=email_confirmation]').val("marin.christophe@outlook.fr");
        $('input[name=email]').val("marin.christophe@outlook.fr");
        $('input[name=identifiant]').val("Soliiiid");
        $('input[name=pass_confirmation]').val("UnGrandM0tDeP4$$3");
        $('input[name=pass]').val("UnGrandM0tDeP4$$3");
    });
</script>
<%@include file="common/footer.jsp" %>
