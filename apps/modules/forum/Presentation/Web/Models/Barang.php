<?php

namespace Its\Example\Forum\Presentation\Web\Models;

use Phalcon\Mvc\Model;

class Barang extends Model
{
public $id;
public $nama;
public $kategori;
public $keterangan;
public $foto;
public $target_tukar;
public $idpemilik;
}