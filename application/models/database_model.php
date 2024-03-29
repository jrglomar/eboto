<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Database_model extends CI_Model {

    // -- CRUD --
    // CREATING 
    function create($data, $tableName)
    {
        // inserting assoc array to db
        return $this->db->insert($tableName, $data);
    }

    // get the views of datatables for specific election/contest/poll 
    function show_admin($statusColumn, $tableName, $tableName2, $fkColumn, $dateEnd, $dateToday){

        // $query = $this->db->query("EXEC SP_SHOW_ACTIVE_ELECTION $tableName, $fkColumn, $statusColumn, $dateEnd");
        $this->db->select("*, $tableName.id, $tableName2.id AS $tableName2".'_id');
        $this->db->from($tableName);
        $this->db->join($tableName2, $tableName.'.'.$fkColumn.' = '.$tableName2.'.id', 'left');
        $this->db->where($statusColumn, 1);
        $this->db->where("DATEADD(day, 1, $dateEnd) >=", $dateToday);
        $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    // get the views of datatables for specific election/contest/poll 
    function show($statusColumn, $tableName, $tableName2, $fkColumn, $dateEnd, $dateToday, $userOrg, $orgColumn, $publicId){

        // $query = $this->db->query("EXEC SP_SHOW_ACTIVE_ELECTION $tableName, $fkColumn, $statusColumn, $dateEnd");
        $this->db->select("*, $tableName.id, $tableName2.id AS $tableName2".'_id');
        $this->db->from($tableName);
        $this->db->join($tableName2, $tableName.'.'.$fkColumn.' = '.$tableName2.'.id', 'left');
        $this->db->where($statusColumn, 1);
        $this->db->where("DATEADD(day, 1, $dateEnd) >=", $dateToday);
        $this->db->where($orgColumn, $userOrg);
        $this->db->or_where($statusColumn, 1);
        $this->db->where("DATEADD(day, 1, $dateEnd) >=", $dateToday);
        $this->db->where($orgColumn, $publicId);
        $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    // // get the views of datatables for specific election/contest/poll
    // function display_voting($statusColumn, $tableName, $tableName2, $tableName3, $fkColumn, $fkColumn3, $dateEnd, $dateToday){
        
    //     $this->db->select("*, $tableName.id, $tableName3.id AS $tableName3".'_id'," $tableName2.id AS $tableName2".'_id');
    //     $this->db->from($tableName);
    //     $this->db->join($tableName2, $tableName.'.'.$fkColumn.' = '.$tableName2.'.id', 'left');
    //     $this->db->join($tableName3, $tableName.'.id = '.$tableName3.'.'.$fkColumn3, 'left');
    //     $this->db->where($statusColumn, "1");
    //     $this->db->where("$dateEnd >=", $dateToday);
    //     $query = $this->db->get();
    //     $data = $query->result();
    //     return $data;
    // }

    // get the views of any tables
    function view($statusColumn, $tableName){
        $this->db->select("*");
        $this->db->from($tableName);
        $this->db->where($statusColumn, "1");
        $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    // get the views of any tables
    function view_user($statusColumn, $tableName){
        $this->db->select("*");
        $this->db->from($tableName);
        $this->db->where($statusColumn, "1");
        $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    // UPDATE
    function update($id, $data, $tableName)
    {
        $this->db->where("id", $id);
        return $this->db->update($tableName, $data);
    }

    // DISABLE
    function delete($id, $statusColumn, $tableName){
        $this->db->set($statusColumn, '0');
        $this->db->where("id", $id);
        $this->db->update($tableName);
    }

    // ENABLE
    function activate($id, $statusColumn, $tableName){
        $this->db->set($statusColumn, '1');
        $this->db->where("id", $id);
        $this->db->update($tableName);
    }

    // GET
    function get($id, $tableName)
    {
        if($tableName == 't_election'){
            $query = $this->db->query("EXEC SP_SPECIFIC_GET_ELECTION $id");
        }
        else if($tableName == 't_ep'){
            $query = $this->db->query("EXEC SP_SPECIFIC_GET_EP $id");
        }
        else if($tableName == 't_contest'){
            $query = $this->db->query("EXEC SP_SPECIFIC_GET_CONTEST $id");
        }
        else if($tableName == 't_poll'){
            $query = $this->db->query("EXEC SP_SPECIFIC_GET_POLL $id");
        }
        else{
            $this->db->select("*");
            $this->db->where("id", $id);
            $this->db->from($tableName);
            $query = $this->db->get();
        }
        
        
        $data = $query->result();
        return $data;
    }

    // -- END OF CRUD --


    // query to get all restriction
    function get_all($statusColumn, $tableName)
    {
        $this->db->select("*");
        $this->db->where($statusColumn, "1");
        $this->db->from($tableName);
        $query = $this->db->get();
        $data = $query->result();
        return $data;
    }


    // query to get candidate of election, contestant of contest, option of poll
    function show_options($referenceID, $referenceColumn, $statusColumn, $tableName){
        $this->db->select("*");
        $this->db->where($referenceColumn, $referenceID);
        $this->db->where($statusColumn, "1");
        $this->db->from($tableName);
        $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    // query to get candidate of election, contestant of contest, option of poll
    function show_ep_options($referenceID, $partylistID, $referenceColumn, $statusColumn, $tableName){
        $this->db->select("*");
        $this->db->where($statusColumn, "1");
        $this->db->where($referenceColumn, $referenceID);
        $this->db->where("candidatePartylist", $partylistID);
        $this->db->from($tableName);
        $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    // Get two tables with foreign key
    function get_two_table($statusColumn, $tableName, $tableName2, $fkColumn)
    {
        $this->db->select("*, $tableName.id, $tableName2.id AS $tableName2".'_id');
        $this->db->from($tableName);
        $this->db->join($tableName2, $tableName.'.'.$fkColumn.' = '.$tableName2.'.id', 'left');
        $this->db->where($statusColumn, "1");
        $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    // It is used to get all candidates/contestant/options in specific election/contestant/polls
    function get_candidate($id, $tableName, $refColumn, $columnStatus){

        // if($tableName == 't_candidate'){
        //     $query = $this->db->query("EXEC SP_GET_ELECTION $refColumn, $id");
        // }
        // if($tableName == 't_contestant'){
        //     $query = $this->db->query("EXEC SP_GET_CONTEST $refColumn, $id");
        // }
        // else if($tableName == 't_option'){
        //     $query = $this->db->query("EXEC SP_GET_POLL $refColumn, $id");
        // }
        $this->db->select("*");
        $this->db->where($refColumn, $id);
        $this->db->where($columnStatus, "1");
        $this->db->from($tableName);
        $this->db->order_by($tableName.'.id');
        $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    function get_ep_candidate($id, $tableName, $refColumn, $columnStatus){

        // $query = $this->db->query("EXEC SP_GET_ELECTION $refColumn, $id");
        $this->db->select("*");
        $this->db->where($refColumn, $id);
        $this->db->where($columnStatus, "1");
        $this->db->from('t_partylist');
        $this->db->join($tableName, $tableName.'.candidatePartyList = t_partylist.id');
        $this->db->order_by($tableName.'.id', 'DESC');
        $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    // It is used to insert specific vote
    function insert_vote($voteID, $voteColumn, $refTableID, $refTableColumn, $tableName, $vote_userID){
        $data = array(
            $voteColumn=>$voteID,
            $refTableColumn=>$refTableID,
            'vote_userID'=>$vote_userID
            );
        return $this->db->insert($tableName, $data);
    }     

    // To get live tally of voting
    function get_votes($refTableID, $refColumn, $tableName, $tableName2, $fkColumn, $name){
        $this->db->select("$tableName.id, COUNT(".$tableName2.".id) as vote_counts
                                , COUNT(".$tableName2.".id) * 100 / SUM(COUNT(".$tableName2.".id)) OVER() as vote_percentage
                                , $tableName.$name");
        $this->db->from($tableName);
        $this->db->join($tableName2, $tableName2.'.'.$fkColumn. '='.$tableName.'.id', 'left');
        $this->db->where($tableName.".".$refColumn, $refTableID);
        $this->db->group_by($tableName.'.'.$name);
        $this->db->group_by($tableName.'.id');
        $this->db->order_by('vote_counts', "DESC");
        $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    // To get live tally of voting
    function get_candidate_votes($refTableID, $refColumn, $tableName, $tableName2, $fkColumn, $name){
        $this->db->select("$tableName.id, COUNT(".$tableName2.".id) as vote_counts
                                , COUNT(".$tableName2.".id) * 100 / SUM(COUNT(".$tableName2.".id)) OVER() as vote_percentage
                                , $tableName.$name
                                , $tableName."."candidatePosition");
        $this->db->from($tableName);
        $this->db->join($tableName2, $tableName2.'.'.$fkColumn. '='.$tableName.'.id', 'left');
        $this->db->where($tableName.".".$refColumn, $refTableID);
        $this->db->group_by($tableName.'.'.$name);
        $this->db->group_by($tableName.'.candidatePosition');
        $this->db->group_by($tableName.'.id');
        $this->db->order_by('vote_counts', "DESC");
        $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    // Check if user already voted in election/contest/poll
    function already_voted($userId, $tableId, $refTableName, $tableName){

        if($tableName == 't_vote_candidate'){
            $query = $this->db->query("EXEC SP_CHECK_ALREADY_VOTE_ELECTION $userId, $tableId");
        }
        else if($tableName == 't_vote_contestant'){
            $query = $this->db->query("EXEC SP_CHECK_ALREADY_VOTE_CONTEST $userId, $tableId");
        }
        else if($tableName == 't_vote_option'){
            $query = $this->db->query("EXEC SP_CHECK_ALREADY_VOTE_POLL $userId, $tableId");
        }
        else{
            $this->db->select('*');
            $this->db->from($tableName);
            $this->db->where("vote_userID", $userId);
            $this->db->where($refTableName, $tableId);
            $this->db->limit(1);
            $query = $this->db->get();
        }
        if ($query->num_rows() >= 1) {
            return 1;
        } 
        else {
            return 0;
        }
    }

    function get_private(){
        $query = $this->db->query("EXEC SP_GET_PRIVATE 'PRIVATE'");
        // $this->db->select('id');
        // $this->db->from('r_org');
        // $this->db->where("orgName", "PRIVATE");
        // $query = $this->db->get();
        $data = $query->result();
        
        return $data;
    }

    function get_result($tableName, $dateEnd, $currDate, $endDate, $columnStatus){
        $this->db->select('*');
        $this->db->from($tableName);
        $this->db->where($dateEnd. "<'". $currDate."'");
        $this->db->where($dateEnd. ">'". $endDate."'");
        $this->db->where($columnStatus, '1');
        $query = $this->db->get();

        $data = $query->result();
        return $data;
    }

    function get_org_id($orgName){
        $this->db->select('id');
        $this->db->from('r_org');
        $this->db->where('orgName', $orgName);
        $this->db->where('orgStatus', 1);
        $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    function updateOrg($userId, $data){
        $this->db->where("id", $userId);
        $this->db->update('t_user', $data);
    }


	

}
