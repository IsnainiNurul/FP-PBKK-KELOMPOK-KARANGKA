{% extends "template.volt" %}

{% block title %}Index{% endblock %}

{% block content %}
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Membuat <small><strong> Forum </strong></small></h1>
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
            <div class="col-md-18">
                <div class="card card-primary card-outline">
                  <div class="card-header">
                    <h3 class="card-title"><a href="/dashboard/profil">{{session.get('user-name')}}</a></h3>
                  </div>
                  <!-- /.card-header -->
                  <div class="card-body">
                    <form action="/forum/thread/store" method="post">
                    <div class="form-group">
                      <label for="">Judul Forum</label><br>
                      <input class="form-control" placeholder="Judul" name="judul">
                    </div>
                    <div class="form-group">
                      <label for="">Kategori</label><br>
                      <select name="kategori">
                        
                        <option ></option>
                        {% for kategori in kategoris %}
                        
                        <option value="{{kategori['nama']}}">{{kategori['nama']}}</option>

                        {% endfor %}
                      </select>
                    </div>
                    
                    <div class="form-group">
                      <label for="">Barang Ditawarkan </label><br>
                      <select name="idbarang">

                        <option ></option>
                        {% for barang in barangs %}
                        
                        <option value="{{barang['id']}}">{{barang['nama']}}</option>

                        {% endfor %}
                      </select>
                    </div>
                    <div class="form-group">
                       
                    <textarea cols="80" id="editor1"  rows="10" data-sample-short name="isi"> </textarea>


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
                <!-- /.card -->
              </div>
          <!-- /.col-md-6 -->
          <!-- /.col-md-6 -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>

{% endblock %}