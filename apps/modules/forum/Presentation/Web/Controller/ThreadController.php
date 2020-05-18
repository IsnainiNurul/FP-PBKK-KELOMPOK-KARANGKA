<?php

namespace Its\Example\Forum\Presentation\Web\Controller;

use Its\Example\Forum\Presentation\Web\Models\Barang;
use Its\Example\Forum\Presentation\Web\Models\Users;
use Its\Example\Forum\Presentation\Web\Models\Forum;
use Phalcon\Mvc\Controller;
use Phalcon\Session\Manager;

class ThreadController extends Controller
{

    public function initialize(){
        if(!$this->session->get('user-name'))
            return $this->response->redirect('/auth/login');
        $this->forum = new Forum();
    }

    public function indexAction()
    {
        
    }

    public function createAction()
    {
        $user = $this->db->fetchOne("SELECT * from users where username = '".$this->session->get('user-name')."'");
        $barang = $this->db->query("SELECT * FROM barang where idpemilik = '".$user['id']."' AND blokir = 0")->fetchAll();
        $kategori = $this->db->fetchAll("SELECT * FROM kategori");
        
        $this->view->setVars([

            "barangs" => $barang,
            "kategoris" =>$kategori


        ]);
    }



    public function storeAction()
    {
        $this->forum->assign(
            $this->request->getPost(),
            [
                'judul',
                'idbarang',
                'kategori',
                'isi',
            ]
        );
        $this->forum->username = $this->session->get('user-name');

        if($this->forum->save()){
            return $this->response->redirect("https://karangka.co.id/dashboard/forum");
            // return "pembuatan Forum Berhasil";

        }
        else{
            return "pembuatan forum gagal";
        }
    }
}