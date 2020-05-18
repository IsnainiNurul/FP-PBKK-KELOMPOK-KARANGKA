{% extends "template.volt" %}

{% block title %}Index{% endblock %}

{% block content %}
<div class="content-wrapper">


  <div class="content">
    <div class="container">
      <div class="row">


        <div class="col-lg-2" st>

          
          <br>
              <div class="card card-primary card-outline">
                <div class="card-body">
                  <p class="card-text" style="text-align: center;">
                    <strong>
                    {{profil['username']}} <br>
                  </strong>
                    <img style="border-radius: 50%;" src="data:image/png;base64,{{profil['foto']}}" alt="" height="100  "> 
                  </p>
                 
               
                </div>
              </div><!-- /.card -->


          </div>

          <div class="col-lg-10" st>

          
            <br>
                <div class="card card-primary card-outline">
                  <div class="card-body">

                    <h3 style="text-align: center;"><strong>{{forum['judul']}}</strong></h3>
                    <div class="card card-primary ">
                      <div class="card-body">
                                            <p class="card-text" style="text-align: center;">


                                            <img style="
                                              display: block;
                                              margin-left: auto;
                                              margin-right: auto;
                                            " src="data:image/png;base64,{{forum['foto']}}" alt="" height="200" width="auto"> 

                                            Barang Ditawarkan :<strong style="color: cornflowerblue;"> {{forum['nama']}}</strong> <br>
                                            Target Tukar      :<strong style="color: cornflowerblue;">  {{forum['target_tukar']}}</strong>
                                              <br>
                                            Kategori :<strong style="color: cornflowerblue;"> {{forum['kategori']}}</strong> <br>
                                           <br>
                                            <a href="/home/lihat/?id={{forum['id']}}"><button class="btn btn-primary"> Menuju Link Barang </button></a> 
                                          </p>
                        </div>
                      </div>    
                      

                      <div class="card card-primary card-outline">
                        <div class="card-body">
                          {{forum['isi']}}
                          </div>
                        </div>
                      
                  </div>
                </div><!-- /.card -->
              {% if forum['tutup'] == 0 %}
               
              {%if session.get('user-name') == null%}
             <a href="/auth/login"><button class="col-lg-12 btn btn-outline-primary" ><h2>Comment</h2></button></a> 
                {% else %}
              <button class="col-lg-12 btn btn-outline-primary" aria-pressed="false" autocomplete="off"  st data-toggle="modal" data-target="#myModal"><h2>Comment</h2></button>
                {% endif %}

              <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog"> 
                    <div class="modal-content">
                  <div class="card card-primary">
                <div class="card-header">
                  <h3 class="card-title">Komentari Forum</h3>



                </div>




                
                <!-- /.card-header -->
                  <form action="/forum/lihat/store" method="POST">
                  <input type="hidden" name="idforum" value="{{forum['forumid']}}">
                    <textarea cols="80" id="editor1"  rows="10" data-sample-short name="komentar"> </textarea>

                    <input style="
                    display: block;
                    margin-left: auto;
                    margin-right: auto;" type="submit" class="btn btn-primary"  value="Submit" id="">
                  </form>
                <!-- form start -->
                  </div>
                </div>
              </div> 
              </div>
              {% else %}
              <button class="col-lg-12 btn btn-danger" aria-pressed="false" autocomplete="off"  st data-toggle="modal"><h2>Forum Ditutup </h2></button>

              {% endif %}


            </div>
      </div>

    </div>
  
  </div>

  {% for komentar in komentars %}
  <div class="content">
    <div class="container">
      <div class="row">


        <div class="col-lg-2" st>

          
          <br>
              <div class="card card-primary card-outline">
                <div class="card-body">
                  <p class="card-text" style="text-align: center;">
                    <strong>
                    {{komentar['username']}} <br>
                  </strong>
                    <img style="border-radius: 50%;" src="data:image/png;base64,{{komentar['foto']}}" alt="" height="100  "> 
                  </p>
                 
               
                </div>
              </div><!-- /.card -->


          </div>

          <div class="col-lg-10" st>

          
            <br>
                <div class="card card-primary card">
                  <div class="card-body">

                 
                      

                      <div class="card card-primary card-outline">
                        <div class="card-body">
                          {{komentar['komentar']}}
                          </div>
                        </div>
                     <p style="color: grey;">Tanggal : {{komentar['create_at']}} </p>
                     {% if komentar['username'] == session.get('user-name') %}
                    <a href="/forum/lihat/delete/{{komentar['komentarid']}}"> <button class="btn btn-danger">Delete</button></a>
                     {% endif %}
                  </div>
                </div><!-- /.card -->
  
           

            </div>
      </div>

    </div>
  
  </div>

  {% endfor %}
  
</div>

{% endblock %}