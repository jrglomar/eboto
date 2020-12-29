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

    <!-- Fontfaces CSS-->
    <link href="<?php echo base_url()?>resources/css/font-face.css" rel="stylesheet" media="all">
    <link href="<?php echo base_url()?>resources/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="<?php echo base_url()?>resources/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="<?php echo base_url()?>resources/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="<?php echo base_url()?>resources/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="<?php echo base_url()?>resources/vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="<?php echo base_url()?>resources/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="<?php echo base_url()?>resources/vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="<?php echo base_url()?>resources/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="<?php echo base_url()?>resources/vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="<?php echo base_url()?>resources/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="<?php echo base_url()?>resources/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">
    
    <!-- Data Tables CSS-->
    <link href="<?php echo base_url()?>resources/css/jquery.dataTables.min.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="<?php echo base_url()?>resources/css/theme.css" rel="stylesheet" media="all">

    <!-- Jquery-->
    <script src="<?php echo base_url()?>resources/js/jquery-3.5.1.min.js"></script>

    <!-- Data Tables JS-->
    <script src="<?php echo base_url()?>resources/js/jquery.dataTables.min.js"></script>

    <!-- Data Time JS-->
    <script src="<?php echo base_url()?>resources/js/datetime.js"></script>

    <!-- Moment w locales JS-->
    <script src="<?php echo base_url()?>resources/js/moment.js"></script>

    <!-- Sweet Alert -->
    <script src="<?php echo base_url()?>resources/js/sweetalert2@10.js"></script>

    <!-- Checkbox css -->
    <link rel="stylesheet" href="<?php echo base_url()?>resources/css/checkbox.css" type="text/css">
    


</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- HEADER DESKTOP-->
    <?php $this->load->view('includes/userheader.php'); ?>
    <!-- HEADER DESKTOP-->

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option spad set-bg" style="padding-bottom: 20px;" data-setbg="<?php echo base_url()?>resources/img/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Result</h2>
                        <div class="breadcrumb__links">
                            <a href="<?php echo base_url()?>home">Home</a>
                            <a href="<?php echo base_url()?>user/vote">Vote</a>
                            <span>Result</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Portfolio Section Start -->
    <section class="portfolio spad" style="padding-top: 20px;">
        <div class="container">

            <!-- Ref Info -->
                <!-- Election Info -->
                <?php if($tableName == 't_candidate'){ ?>
                    <h2 style="text-align:center; color:white;">Election</h2>
                    <div class="d-flex justify-content-between breadcrumb__text" style="padding-right:50px;">
                            <div class="w-50 p-3">
                                <h2 style="color:cyan;white-space:pre-wrap;"><?php echo $refInfo[0]->electionName?>
                                <br><p><?php echo $refInfo[0]->electionDescription?><p></h2>
                            </div>
                            <!-- Live Clock -->
                            <div style="padding-top:25px" class="text-center">
                                <h4 style=color:white; class="fa fa-clock-o"> Voting Ends in: 
                                    <p style=" color:gold;" id="liveclock">
                                    </p>
                                </h4> 
                            </div>
                                <!-- Script for live clock -->
                                <script>
                                        var dateEnd = "<?php echo $refInfo[0]->electionDateEnd?>";

                                        var clock = document.getElementById('liveclock');
                                                setInterval(() => {
                                                    // clock.textContent 
                                                    clock.textContent = moment(dateEnd).endOf('seconds').fromNow();
                                        }, 100);
                                </script>
                                <!-- End of Script for live clock -->
                            <!-- End of Live Clock -->
                    </div>
                <?php } ?>
                <!-- End of election info -->

                <!-- Contest Info -->
                <?php if($tableName == 't_contestant'){ ?>
                    <h2 style="text-align:center; color:white;">Contest</h2>
                    <div class="d-flex justify-content-between breadcrumb__text" style="padding-right:100px; padding-left:50px">
                            <div class="w-50 p-3">
                                <h2 style="color:cyan;white-space:pre-wrap;"><?php echo $refInfo[0]->contestName?>
                                <br><p><?php echo $refInfo[0]->contestDescription?><p></h2>
                            </div>
                            <!-- Live Clock -->
                            <div style="padding-top:25px" class="text-center">
                                This Contest
                                <h4 style=color:white; class="fa fa-clock-o"> Voting Ends in: 
                                    <p style=" color:gold;" id="liveclock">
                                    </p>
                                </h4> 
                            </div>
                                <!-- Script for live clock -->
                                <script>
                                        var dateEnd = "<?php echo $refInfo[0]->contestDateEnd?>";

                                        var clock = document.getElementById('liveclock');
                                                setInterval(() => {
                                                    // clock.textContent 
                                                    clock.textContent = moment(dateEnd).endOf('seconds').fromNow();
                                        }, 100);
                                </script>
                                <!-- End of Script for live clock -->
                            <!-- End of Live Clock -->
                    </div>
                <?php } ?>
                <!-- End of contest info -->

                <!-- Poll Info -->
                <?php if($tableName == 't_option'){ ?>
                    <h2 style="text-align:center; color:white;">Poll</h2>
                    <div class="d-flex justify-content-between breadcrumb__text" style="padding-right:100px; padding-left:50px">
                                <div class="w-50 p-3">
                                    <h2 style="color:cyan;white-space:pre-wrap;"><?php echo $refInfo[0]->pollName?>
                                    <br><p><?php echo $refInfo[0]->pollDescription?><p></h2>
                                </div>
                            <!-- Live Clock -->
                            <div style="padding-top:25px" class="text-center">
                                <h4 style=color:white; class="fa fa-clock-o"> Voting Ends in: 
                                    <p style=" color:gold;" id="liveclock">
                                    </p>
                                </h4> 
                            </div>
                                <!-- Script for live clock -->
                                <script>
                                        var dateEnd = "<?php echo $refInfo[0]->pollDateEnd?>";

                                        var clock = document.getElementById('liveclock');
                                                setInterval(() => {
                                                    // clock.textContent 
                                                    clock.textContent = moment(dateEnd).endOf('seconds').fromNow();
                                        }, 100);
                                </script>
                                <!-- End of Script for live clock -->
                            <!-- End of Live Clock -->
                    </div>
                <?php } ?>
                <br>
                <!-- End of Poll info -->

            <!-- End of Ref Info -->


    <!-- MAIN CONTENT -->

    <!-- Candidate Live Tally -->
    <?php if($tableName == 't_candidate'){ ?>
        <div class="card col-lg-12 col-md-6 col-sm-6 d-flex justify-content-center align-self-stretch" style="background-color:cyan">
            <div class="card-header" style="background-color:cyan">
                <h4>Voting Live Tally</h4>
            </div>
            <?php foreach($data as $row) { ?>
                <div class="card-body">
                    <h6><?php echo $row->candidateName; ?> - <?php echo $row->candidatePosition ?></h6>
                    <div class="progress mb-2">
                            <div class="progress-bar bg-info progress-bar-striped progress-bar-animated" role="progressbar" 
                            style="width: <?php echo $row->vote_percentage; ?>%" aria-valuenow="<?php echo $row->vote_counts; ?>"
                                aria-valuemin="0"><?php echo $row->vote_counts; ?></div>
                    </div>
                </div>
            <?php } ?>
        </div>
    <?php } ?>
    <!-- End of Candidate Live Tally -->

    <!-- Contestant Live Tally -->
    <?php if($tableName == 't_contestant'){ ?>
        <div class="card col-lg-12 col-md-6 col-sm-6 d-flex justify-content-center align-self-stretch">
            <div class="card-header">
                <h4>Voting Live Tally</h4>
            </div>
            <?php foreach($data as $row) { ?>
                <div class="card-body">
                    <h6><?php echo $row->contestantName; ?></h6>
                    <div class="progress mb-2">
                            <div class="progress-bar bg-info progress-bar-striped progress-bar-animated" role="progressbar" style="width: <?php echo $row->vote_percentage; ?>%" aria-valuenow="<?php echo $row->vote_counts; ?>"
                                aria-valuemin="0"><?php echo $row->vote_counts; ?></div>
                    </div>
                </div>
            <?php } ?>
        </div>
    <?php } ?>
    <!-- End of Contestant Live Tally -->

    <!-- Option Live Tally -->
    <?php if($tableName == 't_option'){ ?>
        <div class="card col-lg-12 col-md-6 col-sm-6 d-flex justify-content-center align-self-stretch">
            <div class="card-header">
                <h4>Voting Live Tally</h4>
            </div>
            <?php foreach($data as $row) { ?>
                <div class="card-body">
                    <h6><?php echo $row->optionName; ?></h6>
                    <div class="progress mb-2">
                            <div class="progress-bar bg-info progress-bar-striped progress-bar-animated" role="progressbar" style="width: <?php echo $row->vote_percentage; ?>%" aria-valuenow="<?php echo $row->vote_counts; ?>"
                                aria-valuemin="0"><?php echo $row->vote_counts; ?></div>
                    </div>
                </div>
            <?php } ?>
        </div>
    <?php } ?>
    <!-- End of Option Live Tally -->

        <div>
    </section>

    <!-- END OF MAIN CONTENT -->


    <!-- FOOTER DESKTOP-->
    <?php $this->load->view('includes/userfooter.php'); ?>
    <!-- FOOTER DESKTOP-->
    

    <!-- Js Plugins -->
    <!-- <script src="<?php echo base_url()?>resources/js/jquery-3.3.1.min.js"></script> -->
    <script src="<?php echo base_url()?>resources/js/bootstrap.min.js"></script>
    <script src="<?php echo base_url()?>resources/js/jquery.magnific-popup.min.js"></script>
    <script src="<?php echo base_url()?>resources/js/mixitup.min.js"></script>
    <script src="<?php echo base_url()?>resources/js/masonry.pkgd.min.js"></script>
    <script src="<?php echo base_url()?>resources/js/jquery.slicknav.js"></script>
    <script src="<?php echo base_url()?>resources/js/owl.carousel.min.js"></script>
    <script src="<?php echo base_url()?>resources/js/user-main.js"></script>

    <!-- Jquery JS-->
    <!-- <script src="<?php echo base_url()?>resources/vendor/jquery-3.2.1.min.js"></script> -->
    <!-- Bootstrap JS-->
    <script src="<?php echo base_url()?>resources/vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="<?php echo base_url()?>resources/vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="<?php echo base_url()?>resources/vendor/slick/slick.min.js">
    </script>
    <script src="<?php echo base_url()?>resources/vendor/wow/wow.min.js"></script>
    <script src="<?php echo base_url()?>resources/vendor/animsition/animsition.min.js"></script>
    <script src="<?php echo base_url()?>resources/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <script src="<?php echo base_url()?>resources/vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="<?php echo base_url()?>resources/vendor/counter-up/jquery.counterup.min.js">
    </script>
    <script src="<?php echo base_url()?>resources/vendor/circle-progress/circle-progress.min.js"></script>
    <script src="<?php echo base_url()?>resources/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="<?php echo base_url()?>resources/vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="<?php echo base_url()?>resources/vendor/select2/select2.min.js">
    </script>

    <!-- Main JS-->
    <script src="<?php echo base_url()?>resources/js/main.js"></script>
</body>

<script>
// Start of script
$(document).ready(function(){

})

</script>

</html>