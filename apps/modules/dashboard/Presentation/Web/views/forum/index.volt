{% extends "template.volt" %}

{% block title %}Index{% endblock %}

{% block content %}


<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Forum</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Forum</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
     <a href="/forum/thread/create"> <button class="btn btn-primary">Buat Forum</button></a><br>
      <!-- Default box -->
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">Tawaran Diterima</h3>

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
                      <th >
                        Judul Forum
                      </th>
                      <th >
                        Barang
                      </th>
                      <th >
                        
                      </th>
                      <th >
                        Target
                      </th>
                  </tr>
              </thead>
              <tbody>
                {% for forum in forums %}
                <tr>
                  <td>
                      {{forum['id']}}
                  </td>
                  
                  <td>
                    <a href="/forum/lihat/?id={{forum['id']}}"> {{forum['judul']}}</a>
                 </td>
  
                 <td>
                  <img src="data:image/png;base64,{{forum['fotobarang']}}" alt="" height="100" width="">
                </td>
 
                <td>
                  {{forum['namabarang']}}
                 </td>


                <td>
                  {{forum['target_tukar']}}
                 </td>
                 <td>
                 <a href="/dashboard/forum/edit/{{forum['id']}}"> <button class="btn btn-info">Edit Forum</button></a> 
                </td>
                <td>
                  <a href="/dashboard/forum/hapus/{{forum['id']}}"><button class="btn btn-danger">Hapus Forum </button></a>
               </td>
  
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