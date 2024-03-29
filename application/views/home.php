<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Videograph Template">
    <meta name="keywords" content="Videograph, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>PUP | E-Boto</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Play:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@300;400;500;600;700&display=swap"
        rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="<?php echo base_url()?>resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<?php echo base_url()?>resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<?php echo base_url()?>resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="<?php echo base_url()?>resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<?php echo base_url()?>resources/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="<?php echo base_url()?>resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="<?php echo base_url()?>resources/css/style.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- HEADER DESKTOP-->
    <?php if (isset($this->session->userdata['logged_in'])) {
        $this->load->view('includes/userhomeheader.php');
    }
    else{
        $this->load->view('includes/homeheader.php');
    } ?>

    <!-- HEADER DESKTOP-->

    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="hero__slider owl-carousel">
            <div class="hero__item set-bg" data-setbg="<?php echo base_url()?>resources/img/hero/homepage.png">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <span>Welcome to</span>
                                <h2>PUP E-BOTO</h2>
                                <a style="color:black;" href="<?php echo base_url()?>user/vote" class="primary-btn">Vote now!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hero__item set-bg" data-setbg="<?php echo base_url()?>resources/img/hero/homepage.png">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <span>Welcome to</span>
                                <h2>PUP E-BOTO</h2>
                                <a style="color:black;" href="<?php echo base_url()?>user/vote" class="primary-btn">Vote now!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hero__item set-bg" data-setbg="<?php echo base_url()?>resources/img/hero/homepage.png">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <span>Welcome to</span>
                                <h2>PUP E-BOTO</h2>
                                <a style="color:black;" href="<?php echo base_url()?>user/vote" class="primary-btn">Vote now!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Services Section Begin -->
    <section class="services spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="services__title">
                        <div class="section-title">
                            <span>Online Voting</span>
                            <h2>How it works?</h2>
                        </div>
                        <p>This website will be used for online voting for election, contest, and poll.</p>
                        <a href="<?php echo base_url()?>user/vote" class="primary-btn">View list</a>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="services__item">
                                <div class="services__item__icon">
                                    <img src="<?php echo base_url()?>resources/img/icons/si-1.png" alt="">
                                </div>
                                <h4>Step: 1</h4>
                                <p>Login your account by clicking the "Vote Now" on the upper right corner of the page. Use the student number given to you by PUP to login the website.</p>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="services__item">
                                <div class="services__item__icon">
                                    <img src="<?php echo base_url()?>resources/img/icons/si-2.png" alt="">
                                </div>
                                <h4>Step 2:</h4>
                                <p>Click the "Vote Now" on the upper right corner of the page to check out the Election, Contest, and Poll that are ongoing.</p>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="services__item">
                                <div class="services__item__icon">
                                    <img src="<?php echo base_url()?>resources/img/icons/si-3.png" alt="">
                                </div>
                                <h4>Step 3:</h4>
                                <p>Select a specific Election, Contest, or Poll that you want to participate
                                    Use the provided check boxes to vote your chosen answer or candidate.
                                    Click "Submit" button to submit your ballot. Wait for the receipt as proof that you have successfully voted.</p>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="services__item">
                                <div class="services__item__icon">
                                    <img src="<?php echo base_url()?>resources/img/icons/si-4.png" alt="">
                                </div>
                                <h4>Step 4:</h4>
                                <p>After submitting and checking the receipt, you can now check the progress of your chosen Election, Contest, or Poll.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Services Section End -->

     


    

    <!-- Team Section Begin -->
    <!-- <section class="team spad set-bg" data-setbg="<?php echo base_url()?>resources/img/team-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title team__title">
                        <span>Nice to meet</span>
                        <h2>OUR Team</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6 p-0">
                    <div class="team__item set-bg" data-setbg="<?php echo base_url()?>resources/img/team/team-1.jpg">
                        <div class="team__item__text">
                            <h4>John Raven Glomar</h4>
                            <p>Developer</p>
                            <div class="team__item__social">
                                <a href="https://www.facebook.com/raven016/"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-dribbble"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 p-0">
                    <div class="team__item team__item--second set-bg" data-setbg="<?php echo base_url()?>resources/img/team/team-2.jpg">
                        <div class="team__item__text">
                            <h4>Arvin Carino</h4>
                            <p>Developer</p>
                            <div class="team__item__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-dribbble"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 p-0">
                    <div class="team__item team__item--third set-bg" data-setbg="<?php echo base_url()?>resources/img/team/team-3.jpg">
                        <div class="team__item__text">
                            <h4>Joshua Pugoy</h4>
                            <p>Developer</p>
                            <div class="team__item__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-dribbble"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 p-0">
                    <div class="team__item team__item--four set-bg" data-setbg="<?php echo base_url()?>resources/img/team/team-4.jpg">
                        <div class="team__item__text">
                            <h4>Bernard Teja</h4>
                            <p>Developer</p>
                            <div class="team__item__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-dribbble"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 p-0">
                    <div class="team__btn">
                        <a href="#" class="primary-btn">Meet Our Team</a>
                    </div>
                </div>
            </div>
        </div>
    </section> -->
    <!-- Team Section End -->

   <!-- FOOTER DESKTOP-->
   <?php $this->load->view('includes/userfooter.php'); ?>
    <!-- FOOTER DESKTOP-->



    <!-- Js Plugins -->
    <script src="<?php echo base_url()?>resources/js/jquery-3.3.1.min.js"></script>
    <script src="<?php echo base_url()?>resources/js/bootstrap.min.js"></script>
    <script src="<?php echo base_url()?>resources/js/jquery.magnific-popup.min.js"></script>
    <script src="<?php echo base_url()?>resources/js/mixitup.min.js"></script>
    <script src="<?php echo base_url()?>resources/js/masonry.pkgd.min.js"></script>
    <script src="<?php echo base_url()?>resources/js/jquery.slicknav.js"></script>
    <script src="<?php echo base_url()?>resources/js/owl.carousel.min.js"></script>
    <script src="<?php echo base_url()?>resources/js/user-main.js"></script>
</body>

</html>