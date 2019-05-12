<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" class="csstransforms3d">
<head>
    <meta charset="UTF-8">
    <title>@yield('title')</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="keywords" content="@yield('meta_keywords')">
    <meta name="description" content="@yield('meta_description')">
    <meta name="robots" content="index, follow, noodp, noydir">
    <meta property="og:url" content="https://waka.vn/">
    <meta property="og:title" content="Waka - Nghe, đọc sách online mọi lúc, mọi nơi, trên mọi thiết bị">
    <meta property="og:image" content="https://waka.vn/facebookshare.jpg?v=1">
    <meta property="og:description" content="Waka - Nền tảng xuất bản điện tử nơi cung cấp nội dung, ấn phẩm điện tử (ebook) có bản quyền từ nhà sách, NXB, tác giả, dịch giả... đến tay người dùng">
    <meta property="og:site_name" content="Waka - Nghe, đọc sách online mọi lúc, mọi nơi, trên mọi thiết bị">

    <link rel="shortcut icon" href="{{asset('img/')}}" type="image/png">
    <link href="@yield('link_canonical')" rel="canonical">

    <!-- CSS -->
    <link rel="stylesheet" href="{{asset('css/main.css')}}">
    <link rel="stylesheet" href="{{asset('css/style.css')}}">

    @yield('session_head')

</head>
<body @yield('body_id')>

    <div class="wrapper">
        <!-- Header -->
        <header>
            <div class="container"></div>
        </header><!-- End Header -->
        <!-- Main content -->
        <div class="main-content">
            @yield('main_content')
        </div><!-- End main content -->
        <!-- Footer -->
        <footer>
            <div><p>Copyright by Nguyen Cuong</p></div>
        </footer><!-- End Footer -->
    </div>

    <!-- Javascript include -->
    <script src="{{asset('js/main.js')}}"></script>
    @yield('session_footer')
</body>
</html>