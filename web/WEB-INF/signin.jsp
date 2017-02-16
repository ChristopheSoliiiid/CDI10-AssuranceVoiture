<%@include file="common/header.jsp" %>

        <!-- container -->
        <div class="container">

            <ol class="breadcrumb">
                <li><a href="index.html">Accueil</a></li>
                <li class="active">Accès utilisateur</li>
            </ol>

            <div class="row">

                <!-- Connexion -->
                <div class="container">

                    <div class="row">
                        <article class="col-xs-12 maincontent">
                            <header class="page-header">
                                <h2 class="page-title text-center">Connexion</h2>
                            </header>

                            <div class="col-md-5 col-md-offset-1 col-sm-5 col-sm-offset-1">
                                <div class="panel panel-default">
                                    <div class="panel-body">

                                        <form method="POST" action="Controleur?cmd=account">
                                            <div class="top-margin">
                                                <label>Identifiant <span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" name="identifiant" required>
                                            </div>
                                            <div class="top-margin">
                                                <label>Mot de passe <span class="text-danger">*</span></label>
                                                <input type="password" class="form-control" name="motDePasse" required>
                                            </div>

                                            <hr>

                                            <div class="row">
                                                <div class="col-lg-7">
                                                    <b><a href="">Mot de passe oublié ?</a></b>
                                                </div>
                                                <div class="col-lg-5 text-right">
                                                    <button class="btn btn-info" type="submit">Connexion</button>
                                                </div>
                                            </div>
                                        </form>

                                    </div>

                                </div>
                            </div>

                            <div class="col-md-5 col-sm-5">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <h4>Pourquoi créer un compte ?</h4>
                                        <br>
                                        <p class="text-muted text-justify">
                                            Lorem ipsum dolor sit amet, consectetur <b>adipiscing</b> elit. Integer eget rutrum orci. Duis lectus dolor, euismod vitae tincidunt id,
                                            dictum at orci. Curabitur in lorem <b>pretium</b>, cursus est sagittis, tempor risus. Vestibulum ante ipsum primis in faucibus orci luctus
                                            et ultrices posuere cubilia Curae; <b>Quisque tristique</b> sit amet quam id mollis.
                                        </p>
                                        <hr>
                                        <p class="text-center"><a href="Controleur?cmd=signup" class="btn btn-info">Inscription</a></p>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </div>

                </div>
                <!-- /Connexion -->

            </div>
        </div><!-- /container -->

<%@include file="common/footer.jsp" %>