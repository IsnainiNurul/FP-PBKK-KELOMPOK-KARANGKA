{% extends "template.volt" %}

{% block title %}Index{% endblock %}

{% block content %}


<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>List Barang</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Admin</a></li>
              <li class="breadcrumb-item active">kategori</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->

    {{flashSession.output()}}
    <section class="content"> <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Tambah Kategori</button>
      <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog"> 
            <div class="modal-content">
          <div class="card card-primary">
        <div class="card-header">
          <h3 class="card-title">Upload</h3>
        </div>
        <!-- /.card-header -->
        <!-- form start -->
        <form role="form" action="/dashboard/admin/kategoritambah" method="post" enctype="multipart/form-data" >
          <div class="card-body">
            <div class="form-group">
              <label for="nama">Nama Barang</label>
              <input type="text" name="nama" class="form-control" id="exampleInputEmail1" placeholder="Nama Barang">
            </div>

            
         
          </div>
          <!-- /.card-body -->

          <div class="card-footer">
            <button type="submit" class="btn btn-primary">Submit</button>
          </div>
        </form>


          </div>
        </div>
      </div> 
      </div>
      <br>
      <!-- Default box -->
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">Barang</h3>

          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fas fa-minus"></i></button>
            <button type="button" class="btn btn-tool" data-card-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fas fa-times"></i></button>
          </div>
        </div>
        <div class="card-body p-0">
          
          <table class="table table-striped projects">
              <thead>
                  <tr>
                      <th style="width: 1%">
                          ID
                      </th>
                      <th>Nama Kategori
                      </th>
                  </tr>
              </thead>
              <tbody>
                {% for barang in kategoris %}
                <tr>
                  <td>
                      {{barang['id']}}
                  </td>
                  <td>
                      <a href="/home/lihat/?id={{barang['id']}}">
                         {{barang['nama']}}
                      </a>
                      <br/>
                      <small>
                      </small>
                  </td>
                  <td class="project-state">
                </td>
                   <td class="project-actions text-right">

                      <a class="btn btn-danger btn-sm" href="/dashboard/admin/kategorihapus/{{barang['id']}}">
                          Hapus Kategori
                      </a>
                  </td>
               

              </tr>

          {% endfor %}
          </tbody>
          </table>

          
        </div>
        <!-- /.card-body -->
      </div>



      <!-- /.card -->

    </section>
    <!-- /.content -->
  </div>



{% endblock %}