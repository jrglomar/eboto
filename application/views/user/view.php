<?php

    if (isset($this->session->userdata['logged_in'])) {
            $userStudentNo = ($this->session->userdata['logged_in']['userStudentNo']);
            $userId = ($this->session->userdata['logged_in']['userId']);
        } 
        else {
            header("location: ".base_url()."user/login");
    }

    date_default_timezone_set('Asia/Manila');
    $dateToday = date("Y-m-d h:i:sa");
    if($table['tableName'] == 't_election'){
        $dateEnd = date("Y-m-d h:i:sa", strtotime($refInfo[0]->electionDateEnd));
        $password = $refInfo[0]->electionPassword;
    }
    else if($table['tableName'] == 't_ep'){
        $dateEnd = date("Y-m-d h:i:sa", strtotime($refInfo[0]->epDateEnd));
        $password = $refInfo[0]->epPassword;
    }
    else if($table['tableName'] == 't_contest'){
        $dateEnd = date("Y-m-d h:i:sa", strtotime($refInfo[0]->contestDateEnd));
        $password = $refInfo[0]->contestPassword;
        $limit = $refInfo[0]->contestLimit;
    }
    else if($table['tableName'] == 't_poll'){
        $dateEnd = date("Y-m-d h:i:sa", strtotime($refInfo[0]->pollDateEnd));
        $password = $refInfo[0]->pollPassword;
        $limit = $refInfo[0]->pollLimit;
    }
    

    
    // if($dateEnd <= $dateToday){
    //     header("location: ".base_url()."user/forbidden/already_ended");
    // }
?>

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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/crypto-js.js"></script>

    <!-- Checkbox css -->
    <link rel="stylesheet" href="<?php echo base_url()?>resources/css/checkbox.css" type="text/css">

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
    <div class="breadcrumb-option spad set-bg" style="padding-bottom:50px" data-setbg="<?php echo base_url()?>resources/img/breadcrumb-bg.jpg">
        <div class="container">
        <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Vote</h2>
                        <div class="breadcrumb__links">
                            <a href="<?php echo base_url()?>home">Home</a>
                            <a href="<?php echo base_url()?>user/vote">List</a>
                            <span>Vote</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Portfolio Section Start -->
    <section class="portfolio spad" style="padding-top: 50px;">
        <div class="container">

            <!-- Ref Info -->
                <!-- Election Info -->
                <?php if($table['tableName'] == 't_election'){ ?>
                    <h2 style="text-align:center; color:black;"><?php echo $refInfo[0]->electionName?></h2>
                    <br>
                    <div class="d-flex justify-content-center breadcrumb__text">
                            <div class=" text-center">
                                <p style="color:black;white-space: pre-wrap;"><?php echo $refInfo[0]->electionDescription?></p>
                            </div>
                    </div>
                            <!-- Live Clock -->
                            <div style="padding-top:25px" class="d-flex justify-content-end text-center">
                                <h4 style=color:black; class="fa fa-clock-o"> Voting Ends in: 
                                    <p style=" color:red;" id="liveclock">
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
                    
                <?php } ?>
                <!-- End of election info -->

                <!-- EP Info -->
                <?php if($table['tableName'] == 't_ep'){ ?>
                    <h2 style="text-align:center; color:black;"><?php echo $refInfo[0]->epName?></h2>
                    <br>
                    <div class="d-flex justify-content-center breadcrumb__text">
                            <div class=" text-center">
                                <p style="color:black;white-space: pre-wrap;"><?php echo $refInfo[0]->epDescription?></p>
                            </div>
                    </div>
                            <!-- Live Clock -->
                            <div style="padding-top:25px" class="d-flex justify-content-end text-center">
                                <h4 style=color:black; class="fa fa-clock-o"> Voting Ends in: 
                                    <p style=" color:red;" id="liveclock">
                                    </p>
                                </h4> 
                            </div>
                                <!-- Script for live clock -->
                                <script>
                                        var dateEnd = "<?php echo $refInfo[0]->epDateEnd?>";

                                        var clock = document.getElementById('liveclock');
                                                setInterval(() => {
                                                    // clock.textContent 
                                                    clock.textContent = moment(dateEnd).endOf('seconds').fromNow();
                                        }, 100);
                                </script>
                                <!-- End of Script for live clock -->
                            <!-- End of Live Clock -->
                    
                <?php } ?>
                <!-- End of EP info -->

                <!-- Contest Info -->
                <?php if($table['tableName'] == 't_contest'){ ?>
                    <h2 style="text-align:center; color:black;"><?php echo $refInfo[0]->contestName?></h2>
                    <br>
                    <div class="d-flex justify-content-center breadcrumb__text">
                            <div class=" text-center">
                                <p style="color:black;white-space: pre-wrap;"><?php echo $refInfo[0]->contestDescription?></p>
                                <p style="color:red;white-space: pre-wrap;">Selection Limit: <?php echo $refInfo[0]->contestLimit?></p>
                            </div>
                    </div>
                            <!-- Live Clock -->
                            <div style="padding-top:25px" class="d-flex justify-content-end text-center">
                                <h4 style="color:black;" class="fa fa-clock-o"> Voting Ends in: 
                                    <p style=" color:red;" id="liveclock">
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
                <!-- End of Contest info -->

                <!-- poll Info -->
                <?php if($table['tableName'] == 't_poll'){ ?>
                    <h2 style="text-align:center; color:black;"><?php echo $refInfo[0]->pollName?></h2>
                    <br>
                    <div class="d-flex justify-content-center breadcrumb__text">
                            <div class=" text-center">
                                <p style="color:black;white-space: pre-wrap;"><?php echo $refInfo[0]->pollDescription?></p>
                                <p style="color:red;white-space: pre-wrap;">Selection Limit: <?php echo $refInfo[0]->pollLimit?></p>
                            </div>
                    </div>
                            <!-- Live Clock -->
                            <div style="padding-top:25px" class="d-flex justify-content-end text-center">
                                <h4 style=color:black; class="fa fa-clock-o"> Voting Ends in: 
                                    <p style=" color:red;" id="liveclock">
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
                <!-- End of poll info -->

            <!-- End of Ref Info -->
            <br>
            <div class="row portfolio__gallery">
                

    <!-- Ref Table ID -->
    <h6 id="refTableID" hidden><?php echo $refTable;?></h6>


    <!-- Election Data -->
    <?php if($table['tableName'] == 't_election'){ ?>
            <!-- Election HTML Display -->
            <?php foreach($data as $row){ ?>
                    <div class="col-lg-4 col-md-6 col-sm-6 mix election d-flex justify-content-center align-self-stretch">
                        <div class="d-flex flex-column">
                            <div style="margin: auto;
                                        border-radius: 50%;
                                        height: 200px;
                                        width: 200px;"
                                        class="team__item set-bg" data-setbg="<?php echo base_url('resources/images/'.$row->candidateImage); ?>">
                            </div>
                            <br>
                            <div class="portfolio__item__text">
                                <h4 id="candidate<?php echo $row->id?>"><?php echo $row->candidateName ?></h4>
                                <h6><?php echo $row->candidatePosition ?></h6>
                                    <span style="white-space: pre-wrap;"><?php echo $row->candidateDescription ?></span>                  
                            </div>
                            <div class="mt-auto" style="margin: auto;">
                                <ul class="ks-cboxtags">
                                    <li>
                                    <div class="text-center">
                                        <input type="radio" id="<?php echo $row->id ?>" class="selected_candidate" name="<?php echo $row->candidatePosition;?>"
                                        value="<?php echo $row->id ?>">
                                        <label for="<?php echo $row->id ?>"><strong>Select this candidate</strong></label>
                                        <br>
                                        <input style="padding-top:2px; padding-bottom:2px; border-radius:100px; font-size:10px; font-family: sans-serif;"
                                        type=button class="btn btn-sm btn-outline-secondary" value="Uncheck" onclick=
                                        "document.getElementById('<?php echo $row->id ?>').checked = false">
                                    </div>
                                        <br>
                                        <br>
                                    </li>

                                </ul>      
                            </div>
                        </div>
                    </div>
                <?php } ?>

            <!-- Election Submit Vote Button -->
            <div class="col-lg-12 text-center">
                <button class="btn btn-success" id="btn_vote_candidate" title="Submit Vote" type="button">Submit Vote</button>
            </div>
            <!-- End of Election Submit Vote Button -->
                
        <!-- End Election HTML Display-->
    <?php } ?>
    <!-- End of Election data -->

    <!-- EP Data -->
    <?php if($table['tableName'] == 't_ep'){ ?>
            <!-- EP HTML Display -->
            <?php foreach($data as $row){ ?>
                    <?php $position;?>
                    <div class="col-lg-4 col-md-6 col-sm-6 mix election d-flex justify-content-center align-self-stretch">
                        <div class="d-flex flex-column">
                            <div style="margin: auto;
                                        border-radius: 50%;
                                        height: 200px;
                                        width: 200px;"
                                        class="team__item set-bg" data-setbg="<?php echo base_url('resources/images/'.$row->candidateImage); ?>">
                            </div>
                            <br>
                            <div class="portfolio__item__text">
                                <h4 id="candidate<?php echo $row->id?>"><?php echo $row->candidateName ?></h4>
                                <h5 style="color:red"><?php echo $row->candidatePosition ?></h5>
                                <h6><?php echo $row->partylistName ?></h6><br>
                                <span style="white-space: pre-wrap;"><?php echo $row->candidateDescription ?></span>                  
                            </div>
                            <div class="mt-auto" style="margin: auto;">
                                <ul class="ks-cboxtags">
                                    <li>
                                        <div class="text-center">
                                            <input type="radio" id="<?php echo $row->id ?>" class="selected_candidate" name="<?php echo $row->candidatePosition;?>"
                                            value="<?php echo $row->id ?>">
                                            <label for="<?php echo $row->id ?>"><strong>Select this candidate</strong></label>
                                            <br>
                                            <input style="padding-top:2px; padding-bottom:2px; border-radius:100px; font-size:10px; font-family: sans-serif;"
                                            type=button class="btn btn-sm btn-outline-secondary" value="Uncheck" onclick=
                                            "document.getElementById('<?php echo $row->id ?>').checked = false">
                                        </div>
                                        <br>
                                        <br>
                                    </li>
                                </ul>      
                            </div>
                        </div>
                    </div>
                <?php } ?>

            <!-- EP Submit Vote Button -->
            <div class="col-lg-12 text-center">
                <button class="btn btn-success" id="btn_vote_ep_candidate" title="Submit Vote" type="button">Submit Vote</button>
            </div>
            <!-- End of EP Submit Vote Button -->
                
        <!-- End EP HTML Display-->
    <?php } ?>
    <!-- End of EP data -->


    <!-- Contest Data -->
    <?php if($table['tableName'] == 't_contest'){ ?>
            <!-- Contest HTML Display -->
            <?php foreach($data as $row){ ?>
                    <div class="col-lg-4 col-md-6 col-sm-6 mix contest d-flex justify-content-center align-self-stretch">
                        <div class="d-flex flex-column">
                            <div style="margin: auto;
                                        border-radius: 50%;
                                        height: 200px;
                                        width: 200px;"
                                        class="team__item set-bg" data-setbg="<?php echo base_url('resources/images/'.$row->contestantImage); ?>">
                            </div>
                            <br>
                            <div class="portfolio__item__text">
                                <h4 id="contestant<?php echo $row->id?>"><?php echo $row->contestantName ?></h4>
                                    <span style="white-space: pre-wrap;"><?php echo $row->contestantDescription ?></span>                  
                            </div>
                            <div class="mt-auto"  style="margin: auto;">
                                <ul class="ks-cboxtags">
                                    <li>
                                        <div class="text-center">
                                            <input type="checkbox" id="<?php echo $row->id ?>" name="selected_contestant"
                                            value="<?php echo $row->id ?>">
                                            <label for="<?php echo $row->id ?>"><strong>Select this contestant</strong></label>
                                            <br>
                                            <input style="padding-top:2px; padding-bottom:2px; border-radius:100px; font-size:10px; font-family: sans-serif;"
                                            type=button class="btn btn-sm btn-outline-secondary" value="Uncheck" onclick=
                                            "document.getElementById('<?php echo $row->id ?>').checked = false">
                                        </div>
                                        
                                        <br>
                                        <br>
                                    </li>
                                </ul>      
                            </div>
                        </div>
                    </div>
                <?php } ?>

            <!-- Contest Submit Vote Button -->
            <div class="col-lg-12 text-center">
                <button class="btn btn-success" id="btn_vote_contestant" title="Submit Vote" type="button">Submit Vote</button>
            </div>
            <!-- End of Contest Submit Vote Button -->
                
        <!-- End Contest HTML Display-->
    <?php } ?>
    <!-- End of Contest data -->

            
    <!-- Poll Data -->
    <?php if($table['tableName'] == 't_poll'){ ?>
            <!-- Poll HTML Display -->
            <?php foreach($data as $row){ ?>
                    <div class="col-lg-4 col-md-6 col-sm-6 mix poll d-flex justify-content-center align-self-stretch">
                        <div class="d-flex flex-column">
                            <br>
                            <div class="portfolio__item__text">
                                <h4 id="option<?php echo $row->id?>" style="white-space: pre-wrap;"><?php echo $row->optionName ?></h4>
                            </div>
                            <div class="mt-auto" style="margin: auto;">
                                <ul class="ks-cboxtags">
                                    <li>
                                        <div class="text-center">
                                            <input type="checkbox" id="<?php echo $row->id ?>" name="selected_option"
                                            value="<?php echo $row->id ?>">
                                            <label for="<?php echo $row->id ?>"><strong>Select this option</strong></label>
                                            <br>
                                            <input style="padding-top:2px; padding-bottom:2px; border-radius:100px; font-size:10px; font-family: sans-serif;"
                                            type=button class="btn btn-sm btn-outline-secondary" value="Uncheck" onclick=
                                            "document.getElementById('<?php echo $row->id ?>').checked = false">
                                        </div>
                                        <br>
                                        <br>
                                    </li>
                                </ul>   
                            </div>            
                        </div>
                    </div>
                <?php } ?>
                

            <!-- Poll Submit Vote Button -->
            <div class="col-lg-12 text-center">
                <button class="btn btn-success" id="btn_vote_option" title="Submit Vote" type="button">Submit Vote</button>
            </div>
            <!-- End of Poll Submit Vote Button -->
                
        <!-- End Poll HTML Display-->
    <?php } ?>
    <!-- End of Poll data -->

            
            


            </div>
        </div>  
    </section>
    <!-- Portfolio Section End -->


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
</body>

<script>
// Start of script
$(document).ready(function(){


    var tableName = "<?php echo $table['tableName']?>"
    var tablePassword = "<?php echo $password ?>"
    var limit = "<?php echo $limit ?>"

    $('input[type=checkbox]').on('change', function (e) {
    if ($('input[type=checkbox]:checked').length > limit) {
        $(this).prop('checked', false);
        Swal.fire({
                        title: 'Failed!',
                        text: 'Max selection of this voting line is ' +limit,
                        icon: 'error',
                        confirmButtonText: 'Ok'
                        })
    }
    });


    if (tablePassword != ""){

        (async () => {
        const { value: password } = await Swal.fire({
            title: 'Enter your password',
            input: 'password',
            inputLabel: 'Password',
            inputPlaceholder: 'Enter your password',
            inputAttributes: {
                maxlength: 10,
                autocapitalize: 'off',
                autocorrect: 'off'
            }
            })

            if (password == tablePassword) {
                
            }
            else{
                Swal.fire({
                        title: 'Failed!',
                        text: 'Incorrect Password.',
                        icon: 'error',
                        confirmButtonText: 'Ok'
                        }).then((result) => {
                            location.reload();
                        })
                        // End of Swal

            }
        })()
        }

    // Var for userId
    var vote_userID = <?php echo $userId ?>;
    console.log(vote_userID);

    // Voting Candidate
    $(document).on("click", "#btn_vote_candidate", function(){
        $("#btn_vote_candidate").attr("disabled", true)
        
        var tableName = "t_candidate";

        var refTableID = $("#refTableID");
        var refTableID = refTableID.text();

        var selected = [];
        var stringSelected = ""
        console.log(refTableID)
        
        // Insert selected candidate ID
        $('input[class="selected_candidate"]:checked').each(function() {
            selected.push(this.value);
            stringSelected += '(' + $('#candidate'+this.value).html() + ') '
        });
                            Swal.fire({
                                title: 'You are voting: ',
                                text: stringSelected,
                                showCancelButton: true,
                                confirmButtonColor: '#3085d6',
                                cancelButtonColor: '#d33',
                                confirmButtonText: 'Yes!'
                                }).then((result) => {
                                    $("#btn_vote_candidate").attr("disabled", false);
                                if (result.isConfirmed) {
                                    // Ajax call
                                        $.ajax({
                                            url: '<?php echo base_url()?>user/vote/vote_candidate',
                                            type: 'post',
                                            data: {'selected': selected,
                                                    'refTableID': refTableID,
                                                    'vote_userID': vote_userID},

                                                        success: function(){
                                                            Swal.fire({
                                                                title: 'Success!',
                                                                text: 'You successfully voted.',
                                                                icon: 'success',
                                                                confirmButtonText: 'Ok'
                                                                }).then((result) => {
                                                                    window.location.href = "<?php echo base_url()?>user/progress/index/"+refTableID+"/"+tableName;
                                                                })
                                                        }
                                        })
                                    // End of ajax call 
                                }
                        })
    });
    // End of Voting EP Candidate

    // Voting Candidate
    $(document).on("click", "#btn_vote_ep_candidate", function(){
        $("#btn_vote_ep_candidate").attr("disabled", true)
        
        var tableName = "t_ep";

        var refTableID = $("#refTableID");
        var refTableID = refTableID.text();

        var selected = [];
        var stringSelected = ""
        console.log(refTableID)
        
        // Insert selected candidate ID
        $('input[class="selected_candidate"]:checked').each(function() {
            selected.push(this.value);
            stringSelected += '(' + $('#candidate'+this.value).html() + ') '
        });
        console.log(selected)
                            Swal.fire({
                                title: 'You are voting:',
                                text: stringSelected,
                                icon: 'warning',
                                showCancelButton: true,
                                confirmButtonColor: '#3085d6',
                                cancelButtonColor: '#d33',
                                confirmButtonText: 'Yes!'
                                }).then((result) => {
                                    $("#btn_vote_ep_candidate").attr("disabled", false);
                                if (result.isConfirmed) {
                                    // Ajax call
                                        $.ajax({
                                            url: '<?php echo base_url()?>user/vote/vote_ep_candidate',
                                            type: 'post',
                                            data: {'selected': selected,
                                                    'refTableID': refTableID,
                                                    'vote_userID': vote_userID},

                                                        success: function(){
                                                            Swal.fire({
                                                                title: 'Success!',
                                                                text: 'You successfully voted.',
                                                                icon: 'success',
                                                                confirmButtonText: 'Ok'
                                                                }).then((result) => {
                                                                    window.location.href = "<?php echo base_url()?>user/progress/index/"+refTableID+"/"+tableName;
                                                                })
                                                        }
                                        })
                                    // End of ajax call 
                                }
                        })
    });
    // End of Voting EP Candidate

    // Voting Contestant
    $(document).on("click", "#btn_vote_contestant", function(){
        $("#btn_vote_contestant").attr("disabled", true)

        var refTableID = $("#refTableID");
        var refTableID = refTableID.text();
        
        var tableName = "t_contestant";

        var selected = []
        var stringSelected = ""

        $('input[name="selected_contestant"]:checked').each(function() {
            selected.push(this.value);
            stringSelected += '(' + $('#contestant'+this.value).html() + ') '    
        });
    
  
        
        console.log(selected)
                            Swal.fire({
                                title: 'You are voting:',
                                text: stringSelected,
                                icon: 'warning',
                                showCancelButton: true,
                                confirmButtonColor: '#3085d6',
                                cancelButtonColor: '#d33',
                                confirmButtonText: 'Yes!'
                                }).then((result) => {
                                    $("#btn_vote_contestant").attr("disabled", false);
                                if (result.isConfirmed) {
                                    // Ajax call
                                        $.ajax({
                                            url: '<?php echo base_url()?>user/vote/vote_contestant',
                                            type: 'post',
                                            data: {'selected': selected,
                                                    'refTableID': refTableID,
                                                    'vote_userID': vote_userID},

                                                        success: function(){
                                                            Swal.fire({
                                                                title: 'Success!',
                                                                text: 'You successfully voted.',
                                                                icon: 'success',
                                                                confirmButtonText: 'Ok'
                                                                }).then((result) => {
                                                                    window.location.href = "<?php echo base_url()?>user/progress/index/"+refTableID+"/"+tableName;
                                                                })
                                                        }
                                        })
                                    // End of ajax call 
                                }
                        })
    });
    // End of Voting Contestant


        // Voting option
        $(document).on("click", "#btn_vote_option", function(){
        $("#btn_vote_option").attr("disabled", true)

        var refTableID = $("#refTableID");
        var refTableID = refTableID.text();

        var tableName = "t_option";
        var selected = []
        var stringSelected = ""

        $('input[name="selected_option"]:checked').each(function() {
            selected.push(this.value);
            stringSelected += '(' + $('#option'+this.value).html() + ') '
        });
        

        console.log(selected)
                            Swal.fire({
                                title: 'You are voting: ',
                                text: stringSelected,
                                icon: 'warning',
                                showCancelButton: true,
                                confirmButtonColor: '#3085d6',
                                cancelButtonColor: '#d33',
                                confirmButtonText: 'Yes!'
                                }).then((result) => {
                                    $("#btn_vote_option").attr("disabled", false);
                                if (result.isConfirmed) {
                                    // Ajax call
                                        $.ajax({
                                            url: '<?php echo base_url()?>user/vote/vote_option',
                                            type: 'post',
                                            data: {'selected': selected,
                                                    'refTableID': refTableID,
                                                    'vote_userID': vote_userID},

                                                        success: function(){
                                                            Swal.fire({
                                                                title: 'Success!',
                                                                text: 'You successfully voted.',
                                                                icon: 'success',
                                                                confirmButtonText: 'Ok'
                                                                }).then((result) => {
                                                                    window.location.href = "<?php echo base_url()?>user/progress/index/"+refTableID+"/"+tableName;
                                                                })
                                                        }
                                        })
                                    // End of ajax call 
                                }
                        })
    });
    // End of Voting option
    
});
// End of script

</script>

</html>