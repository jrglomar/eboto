<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">

    <!-- Title Page-->
    <title>Dashboard</title>

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
<body class="animsition">
    <div class="page-wrapper">
        <!-- HEADER MOBILE-->
        <?php $this->load->view('includes/header_mobile.php'); ?>
        <!-- END HEADER MOBILE-->

        <!-- MENU SIDEBAR-->
        <?php $this->load->view('includes/adminsidebar.php'); ?>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <?php $this->load->view('includes/header_desktop.php'); ?>
            <!-- HEADER DESKTOP-->
        <!-- MAIN CONTENT-->
    <div class='main-content'>
        <div class="section__content section__content--p30">
            <div class="container-fluid">
                <div class="row">
                         <!-- Card Header -->
                    <div class="col-lg-12">
                        <div class="card" style = float:center;>
                            <div class="card-body" style="background-color: #ffffff;">
                                    <div class="d-flex justify-content-left">
                                        <div class="col-lg-3">
                                            <div style="color:black;">
                                                <i style=padding:3px;color:black; class="fa fa-clock-o"></i> 
                                                Voting Ends:
                                                <span class="badge badge-pill badge-warning" id="liveclock">
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                            <!-- <p style="text-align:center;"><img src =https://sis2.pup.edu.ph/student/assets/images/PUPLogo.png></p> -->
                                            <br>
                                            <br>
                                            <div class="au-card m-b-30">
                                                <div class="au-card-inner candidateList">
                                                    <h2><?php echo $data[0]->electionName?></h2>
                                                    <button  type="button" class="btn btn-success float-right" data-toggle="modal" data-target="#candidateModal">   
                                                    <i style=padding:3px; class="fa fa-plus"></i> 
                                                    Add Candidate </button>
                                                </div>
                                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> 
    <!-- candidate MODAL -->
    <div class="modal fade" id="candidateModal" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header" style=background-color:maroon;>
							<h3 class="modal-title" id="largeModalLabel" style=color:white;>Add Candidate</h3>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
                </div>
                <div class="card">   
                        <div class="card-body card-block">
                            <form action="" method="post" id="addcandidateForm" name="addcandidateForm">
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                        <i style =padding-right:16px; class="fa fa-user"></i>
                                            <label for="candidateName" class=" form-control-label"> Name</label>
                                        </div>
                                        <div class="col-4 col-md-8">
                                            <input type="text" id="id" name="id" value="<?php echo $data[0]->id?>" hidden>
                                            <input type="text" id="candidateName" name="candidateName" placeholder="Name" class="form-control">
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                        <i style =padding-right:16px; class="fa fa-address-card"></i>
                                            <label for="candidatePosition" class=" form-control-label">Position</label>
                                        </div>
                                        <div class="col-4 col-md-8">
                                            <input type="text" id="candidatePosition" name="candidatePosition" placeholder="Position" class="form-control">
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                        <i style =padding-right:16px; class="fa fa-comment"></i>
                                            <label for="candidateDescription" class=" form-control-label">Description </label>
                                        </div>
                                        <div class="col-4 col-md-8">
                                            <textarea name="candidateDescription" id="candidateDescription" rows="4" placeholder="Description" class="form-control"></textarea>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                                <div class="col col-md-3">
                                                <i style =padding-right:16px; class="fa fa-file-image-o"></i>
                                                    <label for="candidateImage" class=" form-control-label">Image</label>
                                                </div>
                                                <div class="col-4 col-md-8">
                                                    <input type="file" id="candidateImage" name="candidateImage" accept="image/*" size="20" class="form-control-file">
                                                </div>
                                    </div>
                                    <div style= float:right;>
                                        <input type="submit" name="upload" id="upload" value="Submit" class="btn btn-primary">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END candidate MODAL -->

        <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
        </div>

    </div>

    <!-- Jquery JS-->
    <script src="<?php echo base_url()?>resources/vendor/jquery-3.2.1.min.js"></script>
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
$(document).ready(function(){
    // Show election details

    function loadviewdata(){

        var electionName = "<?php echo $data[0]->electionName ?>"
        var electionDateStart = "<?php echo $data[0]->electionDateStart ?>"
        var electionDateEnd = "<?php echo $data[0]->electionDateEnd ?>"
        var electionDescription = "<?php echo $data[0]->electionDescription ?>"

            const clock = document.getElementById('liveclock');
            $( ".candidateList" ).append("<p>"+electionName+"</p>");
            setInterval(() => {
                // clock.textContent 
                clock.textContent = moment(electionDateEnd).endOf('seconds').fromNow();
            }, 1000);

                $( ".candidateList" ).append("<p>Description: "+electionDescription+"</p>");
                $( ".candidateList" ).append("<p>Date Start: "+(moment(electionDateStart).format('LL'))+"</p>");
                $( ".candidateList" ).append("<p>Date End: "+(moment(electionDateEnd).format('LL'))+"</p>");
    }
    // End of show election details

    loadviewdata()
    
    // Create candidate
    $('#addcandidateForm').on('submit', function(e){
            e.preventDefault();

        var candidateName = document.addcandidateForm.candidateName.value;
        var candidatePosition = document.addcandidateForm.candidatePosition.value;
        var candidateDescription = document.addcandidateForm.candidateDescription.value;
        var candidateImage = document.addcandidateForm.candidateImage.value;
        var Extension = candidateImage.substring(
            candidateImage.lastIndexOf('.') + 1).toLowerCase();

        if(candidateName == '' || candidatePosition == '' || candidateDescription == ''){
                        Swal.fire({
                                title: 'Warning!',
                                text: 'Please fill out required field.',
                                icon: 'warning',
                                confirmButtonText: 'Ok'
                                })
        }
        else{
            if (Extension == "gif" || Extension == "png" || Extension == "jpeg" || Extension == "jpg") {
                if($('#candidateImage').val() == ''){
                        Swal.fire({
                            title: 'Warning!',
                            text: 'Please select an image.',
                            icon: 'warning',
                            confirmButtonText: 'Ok'
                        })
                    }
                else{
                    // Ajax call
                    $.ajax({
                            url: '<?php echo base_url()?>admin/candidate/add_candidate',
                            type:"post",
                            data: new FormData(this),
                            processData:false,
                            contentType:false,

                            success: function(data){
                                Swal.fire({
                                        title: 'Success!',
                                        text: 'You successfully created a candidate.',
                                        icon: 'success',
                                        confirmButtonText: 'Ok'
                                        })
                                    
                                        $('#candidateModal').modal('hide');
                                        $('#candidateModal form')[0].reset();
                                    }
                        })
                    // End of Ajax Call
                }
            }
            else{
                Swal.fire({
                            title: 'Warning!',
                            text: 'Invalid image file.',
                            icon: 'warning',
                            confirmButtonText: 'Ok'
                        })
            }
        }



    });

    // End of Create candidate


});

</script>

</html>
<!-- end document-->
