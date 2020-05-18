<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="../../dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/font-awesome/css/all.css">
    <link rel="stylesheet" href="../../dist/css/style.css">
    
    <title>K A R A N G K A</title>
</head>
<body>
    <!-- start navbar  -->
    <nav class="navbar navbar-expand-lg bg-light navbar-light nav-menu ">
        <a class="navbar-brand ml-5" href="#">
         <img src="../../dist/img/logo.png" alt="Logo" class="logo">
       </a>

       <ul class="navbar-nav ml-auto justify-content-end font-weight-bold">
            <li class="nav-item mr-3">
                <a class="nav-link" href="#">Beranda</a>
            </li>
            <li class="nav-item dropdown mr-3">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">Features</a>
                <div class="dropdown-menu">
                    <a href="#" class="dropdown-item">Features 1</a>
                    <a href="#" class="dropdown-item">Features 2</a>
                    <a href="#" class="dropdown-item">Features 3</a>
                </div>
            </li>
            <li class="nav-item mr-5">
                <a href="#" class="nav-link">About Us</a>
            </li>
            {% if !session.get('user-name') %}
            <li class="nav-item mr-2">
                <a href="/auth/login" class="nav-link">Log In</a>
            </li>
            <li class="nav-item mr-5">
               <a href="/auth/register"><button class="btn bg-dark text-white my-2 my-sm-0" type="submit">Sign Up</button></a> 
            </li>

            {% else %}

            <li class="nav-item mr-5">
                <a href="/dashboard"><button class="btn bg-dark text-white my-2 my-sm-0" type="submit">{{session.get('user-name')}}</button></a> 
             </li>
 

            {% endif %}
        </ul> 
        <form class="form-inline ml-lg-4 mr-5">
            <!-- <input class="form-control form-control-lg mr-3 w-75" type="text" placeholder="Search"
              aria-label="Search"> -->
            <i class="fas fa-search" style="font-size: 26px;"></i>
        </form>
     </nav> 
     <!-- end navbar  -->

     <!-- start jumbotron -->
     <div class="jumbotron jumbotron" style="height: auto;background-image: url('../dist/css/jumbotron.png');background-size: cover ;" >
        <div class="container">
            <div class="row">
                <div class="col-md-4 text-white">
                    <h1 class="font-weight-light">TUKAR BARANG</h1>
                    <h1 class="font-weight-bold" style="">PENGUAT HARGA</h1>
                    <h1 class="font-weight-bold font-italic">RUPIAH</h1>
                </div>

            </div>
            <div class="row">
                <div class="col-md-4 text-white left-line ml-3">
                   <p class="ml-4 font-italic font-weight-light">Hilangkan rasa konsumtif dengan<br>
                    tukarkan barang yang menumpuk <br>
                    dirumah anda</p>
                </div>
            </div>
            <div class="row mt-4 ml-5">
                <a href="" class="btn btn-md btn-light btn-oval p-2 pl-4 pr-4">Learn More</a>
                <a href="" class="btn btn-md btn-outline-light ml-4 btn-oval p-2 pl-4 pr-4">Get Started</a>
            </div>
            <div class="row jumbocard text-white">
                <div class="col m-2 pl-5 pr-5 pt-3 pb-4 rounded jcard">
                    <div class="mb-4 text-center title-card">
                        <h3>FORUM</h3>
                    </div>
                    <p>Mari berdiskusi tentang barang yang akan ditukar bersama pemilik barang lainnya, temukan jodoh barangmu disini</p>
                    <a href="/forum" class="btn btn-light mt-3 btn-card" role="button">Mulai Diskusi</a>
                </div>
                <div class="col m-2 pl-5 pr-5 pt-3 pb-4 rounded jcard">
                    <div class="title-card mb-4 text-center">
                        <h3>MULAI TUKAR</h3>
                    </div>
                    <p>Setelah berbincang dengan calon jodoh barangmu mari kita bertukar barang, tinggal selangkah lagi anda akan mendapatkan barangmu</p>
                    <a href="/home" class="btn btn-light mt-3 btn-card" role="button">Mulai Tukar Barang</a>
                </div>
                <div class="col m-2 pl-5 pr-5 pt-3 pb-4 rounded jcard">
                    <div class="title-card mb-4 text-center">
                        <h3>LACAK BARANG</h3>
                    </div>
                    <p>Hilangkan kekhawatiran tentang barang anda, mulailah percaya dengan KARANGKA dengan memasukkan resi transaksi</p>
                   <a href="https://cekresi.com/"><button class="btn btn-light mt-3 btn-card">Masukkan Resi</button></a> 
                
                
                </div>
            </div>
            <div class="jumboquote text-white font-italic text-center mt-5">
                <p class="font-weight-light">" Bukan tentang pembaruan namun mengurangi perilaku konsumtif "</p>
            </div>
        </div>
     </div>
     <!-- end jumbotron -->

     <!-- main content -->
     <div class="sp w-100 bg-dark text-center">
        <p class="text-white">Kenapa Harus Tukar Barang</p>
     </div>
     <div class="container mt-4">
        <div class="row pl-4">
            <div class="col-md-6">
                <div class="card m-5 prod">
                    <img class="card-img-top" src="../../dist/img/prod.png" alt="Card image" style="width:100%">
                    <div class="card-body">
                    <h5 class="card-title text-center">Tukar barang yang menumpuk dirumah dengan barang yang lebih berguna</h5>
                    <p class="card-text text-center ptext">Dewasa ini banyak orang hanya menghamburkan uang untuk membeli barang baru, disisi lain banyak orang yang mempunyai barang tersebut dan juga sebaliknya</p>
                    <a href="#" class="btn bg-dark text-white rm">Read More</a>
                    </div>
                </div>
            </div>
            
            <div class="col-md-6">
                <div class="card m-5 prod">
                    <img class="card-img-top" src="../../dist/img/prod.png" alt="Card image" style="width:100%">
                    <div class="card-body">
                    <h5 class="card-title text-center">Tukar barang yang menumpuk dirumah dengan barang yang lebih berguna</h5>
                    <p class="card-text text-center ptext">Dewasa ini banyak orang hanya menghamburkan uang untuk membeli barang baru, disisi lain banyak orang yang mempunyai barang tersebut dan juga sebaliknya</p>
                    <a href="#" class="btn bg-dark text-white rm">Read More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card m-5 prod">
                    <img class="card-img-top" src="../../dist/img/prod.png" alt="Card image" style="width:100%">
                    <div class="card-body">
                    <h5 class="card-title text-center">Tukar barang yang menumpuk dirumah dengan barang yang lebih berguna</h5>
                    <p class="card-text text-center ptext">Dewasa ini banyak orang hanya menghamburkan uang untuk membeli barang baru, disisi lain banyak orang yang mempunyai barang tersebut dan juga sebaliknya</p>
                    <a href="#" class="btn bg-dark text-white rm">Read More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card m-5 prod">
                    <img class="card-img-top" src="../../dist/img/prod.png" alt="Card image" style="width:100%">
                    <div class="card-body">
                    <h5 class="card-title text-center">Tukar barang yang menumpuk dirumah dengan barang yang lebih berguna</h5>
                    <p class="card-text text-center ptext">Dewasa ini banyak orang hanya menghamburkan uang untuk membeli barang baru, disisi lain banyak orang yang mempunyai barang tersebut dan juga sebaliknya</p>
                    <a href="#" class="btn bg-dark text-white rm">Read More</a>
                    </div>
                </div>
            </div>
        </div>
        <ul class="pagination pagination-lg justify-content-center mb-5 pg">
            <li class="page-item"><a class="page-link bg-dark text-white href="#"><</a></li>
            <li class="page-item"><a class="page-link bg-dark text-white href="#">1</a></li>
            <li class="page-item"><a class="page-link bg-dark text-white href="#">2</a></li>
            <li class="page-item"><a class="page-link bg-dark text-white href="#">3</a></li>
            <li class="page-item"><a class="page-link bg-dark text-white href="#">4</a></li>
            <li class="page-item"><a class="page-link bg-dark text-white href="#">5</a></li>
            <li class="page-item"><a class="page-link bg-dark text-white href="#">></a></li>
          </ul>
     </div>
     <!-- end main content -->

     <!-- start footer -->
     <div class="container-fluid bg-dark footer">
         <footer class="pt-3">
             <h2 class="m-3 text-center font-weight-bold text-white ftlogo">KARANGKA</h2>
             <div class="row foot-info">
                <div class="col-md-3 info">
                    <h4 class="text-center text-white font-weight-bold">About Us</h4>
                    <p class="text-justify text-white font-weight-light m-1">
                        This is website about transaction with your own goods. Safe website from pishing and anymore this is about loyalty for costumer with safe transaction and trusted.
                    </p>
                </div>
                <div class="col-md-3 text-center info">
                    <h4 class="text-center text-white font-weight-bold">Features</h4>
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a href="#" class="nav-link ftlist" role="button">Forum Barang</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link ftlist" role="button">Tukar Barang</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link ftlist" role="button">Lacak Barang</a>
                        </li>
                    </ul>
                </div>
                <div class="col-md-3 info">
                    <a href=""><div class="text-center ftbox">Bantuan</div></a>
                    <a href=""><div class="text-center ftbox">FAQ</div></a>
                    <a href=""><div class="text-center ftbox">Panduan Forum</div></a>
                    <a href=""><div class="text-center ftbox">Panduan Tukar</div></a>
                    <a href=""><div class="text-center ftbox">Panduan Lacak</div></a>
                </div>
                <div class="col-md-3 info">
                    <h4 class="text-center text-white font-weight-bold">Connect With Us</h4>
                    <div class="input-group mb-3 mt-5">
                        <input type="email" class="form-control" placeholder="Email...">
                        <div class="input-group-append">
                        <button class="btn btn-submit" type="submit"><i class="fas fa-check"></i></button>  
                        </div>
                    </div>
                    <div class="socialmedia">
                        <i class="fab fa-twitter smlist"></i>
                        <i class="fab fa-facebook smlist"></i>
                        <i class="fab fa-instagram smlist"></i>
                    </div>
                </div>
            </div>
         </footer>
     </div>
     <div class="signature">
         <h4 class="text-center font-weight-light text-white sig">© 2020 KARANGKA. All Rights Reserved</h4>
     </div>
     <!-- end footer -->


     <script src="../../dist/js/jquery-3.4.1.slim.min.js"></script>
     <script src="../../dist/js/popper.min.js"></script>
     <script src="../../dist/js/bootstrap.min.js"></script>
     <script src="assets/font-awesome/js/all.js"></script>
</body>
</html>