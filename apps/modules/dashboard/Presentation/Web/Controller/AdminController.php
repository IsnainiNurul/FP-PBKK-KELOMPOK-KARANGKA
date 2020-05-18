<?php

namespace Its\Example\Dashboard\Presentation\Web\Controller;
use Phalcon\Security;
use Its\Example\Dashboard\Presentation\Web\Models\Users;
use Its\Example\Dashboard\Presentation\Web\Models\Kategori;
use Its\Example\Dashboard\Presentation\Web\Models\Forum;

use Its\Example\Dashboard\Presentation\Web\Models\Barang;
use Phalcon\Mvc\Controller;
use Phalcon\Session\Manager;


class AdminController extends Controller
{
   
    public function initialize(){

        if($this->session->get('user-admin') == 0 ){
            return $this->response->redirect('/dashboard/');
        }
    }

    public function indexAction()
    {
        $check = $this->db->query("SELECT id FROM  users WHERE username = '".$this->session->get('user-name')."'")->fetchAll();
        $id = $check[0]['id'];
        $barang = $this->db->query("SELECT * FROM  barang ")->fetchAll();
        $users = $this->db->query("SELECT * FROM  users where isadmin != 1")->fetchAll();
        $kategori = $this->db->query("SELECT * FROM  kategori")->fetchAll();
        $forum = $this->db->query("SELECT * FROM  forum")->fetchAll();

        $this->view->setVars([
            "barangs" =>$barang,
            "users" =>$users,
            "kategoris" =>$kategori,
            "forum" =>$forum


    ]);

    }

    public function forumAction()
    {
        
        $forum = $this->db->query("SELECT forum.*,forum.id as forumid,users.username,barang.*
        FROM users,barang,forum
        WHERE users.id = barang.idpemilik AND forum.idbarang = barang.id AND barang.blokir = 0 ")->fetchAll();
        $this->view->setVars([

            "forums" => $forum

        ]);

    }

    


    public function kategoriAction()
    {
        $kategori = $this->db->query("SELECT * FROM  kategori")->fetchAll();
        $this->view->setVars([

            "kategoris" => $kategori

        ]);

    }

    public function kategorihapusAction($id)
    {
        $kategori = Kategori::findFirst($id);
        if($kategori->delete()){

        $this->flashSession->success('Kategori Berhasil Dihapus');

        return $this->response->redirect('/dashboard/admin/kategori');
        }
    }

    public function kategoritambahAction()
    {
        $kategori = new Kategori();
        $kategori->nama = $this->request->getpost('nama');
        if($kategori->save()){
        $this->flashSession->success('Kategori Berhasil Ditambahkan');

        return $this->response->redirect('/dashboard/admin/kategori');
        }
        else{
            return "Menambah kategori gagal";
        }
    }

    public function barangAction()
    {
          
        $barangs = $this->db->query("SELECT barang.*,users.username FROM  barang,users where users.id = barang.idpemilik")->fetchAll();

        $this->view->setVars([
            "barangs" =>$barangs,



    ]);

    }

    public function userAction()
    {
        
        $users = $this->db->query("SELECT * FROM  users Where isadmin != 1")->fetchAll();

        $this->view->setVars([
            "users" =>$users,



    ]);


    }

    public function bannedAction($id)
    {
        
        $users = Users::findFirst($id);
        $this->flashSession->success($users->username.' Telah Berhasil Dibanned');
        $users->banned = 1;
        $users->update();
        return $this->response->redirect('/dashboard/admin/user');


    }


    


    public function unbannedAction($id)
    {
        
        $this->flashSession->success('Mengaktifkan User Berhasil');
        $users = Users::findFirst($id);
        $users->banned = 0;
        $users->update();
        return $this->response->redirect('/dashboard/admin/user');


    }


    public function tutupAction($id)
    {
        
        $forum = Forum::findFirst($id);
        $this->flashSession->success(' Telah Berhasil Menutup Forum');
        $forum->tutup = 1;
        $forum->update();
        return $this->response->redirect('/dashboard/admin/forum');


    }
    
    public function bukaAction($id)
    {
        
        $forum = Forum::findFirst($id);
        $this->flashSession->success(' Telah Berhasil Membuka Forum');
        $forum->tutup = 0;
        $forum->update();
        return $this->response->redirect('/dashboard/admin/forum');


    }
    public function blokirAction($id)
    {
        
        $barang = Barang::findFirst($id);
        $barang->blokir = 1;
        $barang->update();
        return $this->response->redirect('/dashboard/admin/barang');


    }


    public function unblokirAction($id)
    {
        
        $barang = Barang::findFirst($id);
        $barang->blokir = 0;
        $barang->update();
        return $this->response->redirect('/dashboard/admin/barang');


    }



  

  

}