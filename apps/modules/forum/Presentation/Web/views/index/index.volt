{% extends "template.volt" %}

{% block title %}Index{% endblock %}

{% block content %}
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="content-header">
    <div class="container">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0 text-dark">Forum <small><strong> Penukaran Barang</strong></small></h1>
        </div><!-- /.col -->
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
          </ol>
        </div><!-- /.col -->
      </div><!-- /.row -->
    </div><!-- /.container-fluid -->
  </div>
  <!-- /.content-header -->

  <!-- Main content -->
  <div class="content">

    <div class="container">
      <div class="row">

        <a href="/forum/thread/create"><button class="btn btn-primary"> Buat Forum </button></a>
        
      </div><br>

      <div class="row">
    
        <!-- /.col-md-6 -->
        <div class="col-lg-6">
          <div class="card">
            <div class="card-header">
              <h5 class="card-title m-0">Cari Forum Barter</h5>
            </div>
            <div class="card-body">
              <form action="/forum/" method="get">
              <input type="text" class="form-control" name="nama" placeholder="Cari Barang"> <br>
              <input type="submit" class="btn btn-primary"  value="Cari Barang">
            </form>

            </div>
          </div>

        </div>  
         <div class="col-lg-6">
     
          <div class="card card-primary card-outline">

            <div class="card-header">
              <h5 class="card-title m-0">Cari Berdasar Kategori</h5>
            </div>

            <div class="card-body">
              
              <form action="/forum/" method="get">
              <select class="form-control form-control-sm" name="kategori">
                {% for barangin in kategoris %}
                <option>{{barangin['nama']}}</option>
 
                {% endfor %}
            </select> <br>
              <input type="submit" class="btn btn-primary"  value="Cari Berdasar Kategori">
              </form>

            </div>
          </div>
        </div>

          
        {% for barang in barangs %}
        <div class="col-lg-3">
      
          <div class="card card-primary card-outline">
            <div class="card-body">
              <p class="card-text" style="text-align: center;">
               </p>

           Oleh :  <a href="">  <strong>{{barang['username']}}</strong> </a><br>               
              <img style="margin-left: 70px;" src="data:image/png;base64,{{barang['foto']}}" alt="" height="100  "> 
              <p class="card-text" style="text-align: center;">
                
                <strong>{{barang['judul']}}</strong><br>
               {% if barang['tutup'] == 0 %} 
               <a href="/forum/lihat/?id={{barang['forumid']}}"><button class="btn btn-primary">Menuju Forum</button></a>
              {% else %}
              <a href="/forum/lihat/?id={{barang['forumid']}}"><button class="btn btn-danger">Forum Ditutup</button></a>
              
              {%endif%}
              </p>
            </div>
          </div><!-- /.card -->
        </div>

        {% endfor %}
        
        <!-- /.col-md-6 -->
      </div>
      <!-- /.row -->
    </div><!-- /.container-fluid -->
  </div>
  <!-- /.content -->
</div>





{% endblock %}