<aside class="menu-sidebar d-none d-lg-block">
            <div class="logo">
                <a href="<?php echo base_url()?>admin/dashboard">
                    <img src="<?php echo base_url()?>resources/images/icon/eLogoFont.png" style="height:70px;padding-left:45px" alt="PUP E-Boto" />
                </a>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">
                        <li <?php if($this->router->fetch_class() == 'dashboard') {?> class="active has-sub" <?php } ?>>
                            <a class="js-arrow" href="<?php echo base_url()?>admin/dashboard">
                                <i class="fas fa-tachometer-alt"></i>Dashboard</a>
                        </li>
                        <li <?php if($this->router->fetch_class() == 'election') {?> class="active has-sub" <?php } ?>> 
                            <a href="<?php echo base_url()?>admin/election">
                                <i class="fas fa-archive"></i>Election</a>
                        </li>
                        <li <?php if($this->router->fetch_class() == 'ep') {?> class="active has-sub" <?php } ?>> 
                            <a href="<?php echo base_url()?>admin/ep">
                                <i class="fas fa-object-group"></i>Election + Partylist</a>
                        </li>
                        <li <?php if($this->router->fetch_class() == 'contest') {?> class="active has-sub" <?php } ?>> 
                            <a href="<?php echo base_url()?>admin/contest">
                                <i class="fas fa-trophy"></i>Contest</a>
                        </li>
                        <li <?php if($this->router->fetch_class() == 'poll') {?> class="active has-sub" <?php } ?>> 
                            <a href="<?php echo base_url()?>admin/poll">
                                <i class="fas fa-bar-chart-o"></i>Poll</a>
                        </li>
                        <li <?php if($this->router->fetch_class() == 'organization') {?> class="active has-sub" <?php } ?>> 
                            <a href="<?php echo base_url()?>admin/organization">
                                <i class="fas fa-users"></i>Organization</a>
                        </li>
                        <li <?php if($this->router->fetch_class() == 'userrole') {?> class="active has-sub" <?php } ?>> 
                            <a href="<?php echo base_url()?>admin/userrole">
                                <i class="fas fa-user"></i>User Role</a>
                        </li>
                        <li <?php if($this->router->fetch_class() == 'reports') {?> class="active has-sub" <?php } ?>> 
                            <a href="<?php echo base_url()?>admin/reports">
                                <i class="fas fa-flag"></i>Vote Logs</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </aside>