<?php

namespace Its\Example\Forum\Presentation\Web\Controller;

use Its\Example\Forum\Presentation\Web\Models\Barang;
use Its\Example\Forum\Presentation\Web\Models\Inbox;
use Its\Example\Forum\Presentation\Web\Models\Users;
use Its\Example\Forum\Presentation\Web\Models\Komentar;
use Phalcon\Mvc\Controller;
use Phalcon\Session\Manager;

class LihatController extends Controller
{
    public function initialize(){

    $this->inbox = new Inbox();
    
      
   
    }

    public function indexAction()
    {
        $id =$this->request->getQuery('id');



        $forum = $this->db->fetchOne("SELECT forum.*,forum.id as forumid,users.username,barang.*
        FROM users,barang,forum
        WHERE users.id = barang.idpemilik AND forum.idbarang = barang.id AND barang.blokir = 0 And forum.id = '".$id."'");

        $userid = $this->session->get('user-id');
        $user = Barang::find("idpemilik='".$userid."'");

        $profil = $this->db->fetchOne("SELECT * from detailuser where username = '".$forum['username']."' ");
        
        $komentar = $this->db->fetchAll("SELECT komentar.*,komentar.id as komentarid,detailuser.* FROM komentar,detailuser WHERE komentar.username = detailuser.username AND komentar.idforum = ".$id."ORDER BY komentar.id ASC");
        
        $this->view->setVars([
            "forum" =>$forum,
            "profil" =>$profil,
            "komentars" =>$komentar


         ]);

        

    
    
    }

    public function storeAction(){
        $komentar = new Komentar();
        $komentar->idforum = $this->request->getPost('idforum');
        $komentar->username = $this->session->get('user-name');
        $komentar->komentar = $this->request->getPost('komentar');
        if($komentar->save()){

            $this->flashSession->success('Komentar berhasil');
            return $this->response->redirect($_SERVER['HTTP_REFERER']);

        }
        else{
            return "komentar gagal";
        }



    }

    public function deleteAction($id){
        $komentar = Komentar::findFirst($id);
        $komentar->delete();
        $this->flashSession->success('Komentar berhasil');
        return $this->response->redirect($_SERVER['HTTP_REFERER']);

     


    }

    public function kirimAction()
    {
        if($this->request->isPost()){
            $this->inbox->assign($this->request->getPost(),[
                "judul",
                "usernamepengirim",
                "usernamepenerima",
                "pesan",


            ]);
             
        $this->inbox->usernamepenerima =  $this->request->getPost('usernamepenerima');
    
        if($this->inbox->save()){
    
            $this->flashSession->success('Pengiriman Pesan Berhasil');
            return $this->response->redirect($_SERVER['HTTP_REFERER']);
        }

        else{
            var_dump($this->inbox);

        }
    }

    }
    
}