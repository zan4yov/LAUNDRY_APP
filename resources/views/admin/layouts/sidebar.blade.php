<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Washwes - Admin Panel</title>
        <meta http-equiv="x-ua-compatible" content="ie=edge" />
        <meta name="description" content="" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta property="og:title" content="" />
        <meta property="og:type" content="" />
        <meta property="og:url" content="" />
        <meta property="og:image" content="" />
        <!-- Favicon -->
        <link rel="icon" href="{{ asset('admins') }}/imgs/theme/washwes.png" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!-- Template CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="{{ asset('admins') }}/css/main.css?v=1.1" rel="stylesheet" type="text/css" />
    </head>

    <body>
		
        <div class="screen-overlay"></div>
        <aside class="navbar-aside" id="offcanvas_aside">
            <div class="aside-top">
                <a href="{{ route('admin.index') }}" class="brand-wrap">
                    <img src="{{ asset('admins') }}/imgs/theme/washwes.png" class="logo" alt="Washwes" style="width: 5px; height: 100px;" />
                </a>
                <div>
                    <button class="btn btn-icon btn-aside-minimize"><i class="text-muted material-icons md-menu_open"></i></button>
                </div>
            </div>
            <nav>
                <ul class="menu-aside">
                    <li class="menu-item">
                        <a class="menu-link" href="{{ route('admin.index') }}">
                            <i class="icon material-icons md-home"></i>
                            <span class="text">Dashboard</span>
                        </a>
                    </li>
                    <li class="menu-item">
                        <a class="menu-link" href="{{ route('admin.cucian-offline') }}">
                            <i class="icon material-icons md-local_laundry_service"></i>
                            <span class="text">Cucian Offline</span>
                        </a>
                    </li>
                    <li class="menu-item">
                        <a class="menu-link" href="{{ route('admin.cucian-online') }}">
                            <i class="icon material-icons md-shopping_bag"></i>
                            <span class="text">Cucian Online</span>
                        </a>
                    </li>
                    <li class="menu-item">
                        <a class="menu-link" href="{{ route('admin.kategori') }}">
                            <i class="icon material-icons md-category"></i>
                            <span class="text">Kategori</span>
                        </a>
                    </li>
                    <li class="menu-item">
                        <a class="menu-link" href="{{ route('admin.pembelian') }}">
                            <i class="icon material-icons md-store"></i>
                            <span class="text">Pembelian Bahan</span>
                        </a>
                    </li>
                <hr />
                <ul class="menu-aside">
                    <li class="menu-item">
                        <a class="menu-link" href="{{ route('admin.users') }}">
                            <i class="icon material-icons md-person"></i>
                            <span class="text">Admin</span>
                        </a>
                    </li>
                </ul>
                <br />
                <br />
            </nav>
        </aside>
