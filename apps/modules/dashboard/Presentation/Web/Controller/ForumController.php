<?php

namespace Its\Example\Dashboard\Presentation\Web\Controller;
use Phalcon\Security;

use Its\Example\Dashboard\Presentation\Web\Models\Users;
use Its\Example\Dashboard\Presentation\Web\Models\Barter;
use Its\Example\Dashboard\Presentation\Web\Models\Forum;
use Phalcon\Mvc\Controller;
use Phalcon\Session\Manager;


class ForumController extends Controller
{


    public function initialize(){

        $this->barter = new Barter();

    }

   
    public function indexAction()
    {
        $forum = $this->db->query("SELECT forum.*,barang.target_tukar,barang.id as idbarangid,barang.foto as fotobarang,barang.nama as namabarang,barang.kategori as kategoribarang FROM forum,barang WHERE forum.idbarang = barang.id AND forum.username = '".$this->session->get('user-name')."'")->fetchAll();

        $this->view->setVars([
            "forums" =>$forum,



    ]);
    
        return $this->view;

    }

    public function editAction($id){

        $forum = $this->db->fetchOne("SELECT forum.*,barang.target_tukar,barang.id as idbarangid,barang.foto as fotobarang,barang.nama as namabarang,barang.kategori as kategoribarang FROM forum,barang WHERE forum.idbarang = barang.id AND forum.username = '".$this->session->get('user-name')."'");
    
        return $this->view->setVars([

            "forum" => $forum,

        ]);
    }

    public function storeAction(){
            // return $this->request->getPost('id');
            $forum = Forum::findFirst($this->request->getPost('id'));
            $forum->isi = $this->request->getPost('isi');
            if($forum->update()){
                return $this->response->redirect('/dashboard/forum');
            }
    }


    public function hapusAction($id){

        $forum = Forum::findFirst($id);
        if($forum->delete()){
            return $this->response->redirect($_SERVER['HTTP_REFERER']);
        }
    }

  

  

}