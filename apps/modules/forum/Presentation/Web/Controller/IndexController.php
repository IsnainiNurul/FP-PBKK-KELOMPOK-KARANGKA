<?php

namespace Its\Example\Forum\Presentation\Web\Controller;

use Its\Example\Forum\Presentation\Web\Models\Barang;
use Its\Example\Forum\Presentation\Web\Models\Users;
use Phalcon\Mvc\Controller;
use Phalcon\Session\Manager;

class IndexController extends Controller
{
    public function initialize(){

    $this->barang = new Barang();
    $this->users = new Users();
     
      
   
    }
    public function indexAction()
    {
        $nama = $this->request->getQuery('nama');
        $kategoria = $this->request->getQuery('kategori');

        $barangkita = $this->request->getQuery('barang');
        $kategori = $this->db->fetchAll("SELECT * FROM kategori");
        $barangkategori = $this->db->query("select kategori from barang GROUP BY kategori")->fetchAll();
        if(strlen($nama)>0){
   
        $barang = $this->db->query ("SELECT forum.*,forum.id as forumid,users.username,barang.*
        FROM users,barang,forum
        WHERE users.id = barang.idpemilik AND forum.idbarang = barang.id AND barang.blokir = 0 AND forum.judul LIKE '%".$nama."%'")->fetchAll();
        }

        else if(strlen($barangkita)>0){
       
            $barang = $this->db->query("SELECT users.username,barang.*
            FROM users,barang
            WHERE users.id = barang.idpemilik AND barang.target_tukar LIKE '%".$barangkita."%' AND barang.blokir = 0")->fetchAll();
            }
    
           
        else if(strlen($kategoria)>0){

            // return "yasdaes";
        $barang = $this->db->query("SELECT forum.*,forum.id as forumid,users.username,barang.*
        FROM users,barang,forum
        WHERE users.id = barang.idpemilik AND forum.idbarang = barang.id AND barang.blokir = 0 AND forum.kategori = '".$kategoria."'")->fetchAll();

        }

        else{
        $barang = $this->db->query("SELECT forum.*,forum.id as forumid,users.username,barang.*
        FROM users,barang,forum
        WHERE users.id = barang.idpemilik AND forum.idbarang = barang.id AND barang.blokir = 0 ")->fetchAll();
        }
        // return $barang['idpemilik'];
        // $users = Users::find("id = [7,63]");
       // return $barang['id'];
        
        $this->view->setVars([
            "barangs" =>$barang,
            "users" =>$users,
            "barangkategori" => $barangkategori,
            "kategoris" => $kategori


    ]);
    
    }
    public function cariAction()
    {
        return $this->request->getQuery('asd');
        $barang = $this->db->query("SELECT * FROM  barang")->fetchAll();
    }
}