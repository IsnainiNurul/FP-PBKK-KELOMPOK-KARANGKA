{% extends "template.volt" %}

{% block title %}Index{% endblock %}

{% block content %}

<div class="content-wrapper">
    <!-- Content Header (Page header) -->


    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">Edit Forum</h3>

          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fas fa-minus"></i></button>
            <button type="button" class="btn btn-tool" data-card-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fas fa-times"></i></button>
          </div>
        </div>
        <div class="card-body p-0" style="text-align: center;">
            <form action="/dashboard/forum/store" method="post">
                <div class="form-group">
                  <label for="">Judul Forum</label><br>
                  {{forum['judul']}}
                </div>
                <div class="form-group">
                  <label for="">Kategori : </label><br>
                  {{forum['kategori']}}
                  
                </div>

                
                <div class="form-group">
                    <label for="">Target Tukar : </label><br>
                  
                    {{forum['target_tukar']}} 
                  </div>

                <div class="form-group">
                    <label for="">Barang Ditawarkan : </label><br>
                  
                    <img src="data:image/png;base64,{{forum['fotobarang']}}" alt="" height="100" width=""><br>
                    {{forum['namabarang']}} 
                    <input type="hidden" name="id" value="{{forum['id']}}">
                  </div>


                <div class="form-group">
                   
                <textarea cols="80" id="editor1"  rows="10" data-sample-short name="isi"> {{forum['isi']}} </textarea>


                </div>
              </div>
              <!-- /.card-body -->
              <div class="card-footer">
                <div class="float-right">
                  <button type="submit" class="btn btn-primary"><i class="far fa-envelope"></i> Posting Forum</button>
                </div>
                <button type="reset" class="btn btn-default"><i class="fas fa-times"></i> Discard</button>
              </div>
              <!-- /.card-footer -->
            </div>
          </form>
        </div>
        <!-- /.card-body -->
      </div>



      <!-- /.card -->

    </section>
    <!-- /.content -->
  </div>


{% endblock %}