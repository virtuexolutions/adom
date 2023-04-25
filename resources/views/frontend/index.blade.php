@extends('frontend.layouts.master')
@section('title','E-SHOP || HOME PAGE')
@section('content')
 <section class="bg1">
        <div class="container-fluid">
            <div class="row">
                @include('frontend.layouts.sidebar')
                <div class="col-md-9">
                    <div id="product">
                        <h2 class="product-paddles">Featured Products</h2>
                        <div class="row">
                            @if($featured)
                            @foreach($featured as $row)
                            @php 
                                $photo=explode(',',$row->photo);
                                // dd($photo);
                            @endphp
                            <div class="col-md-3">
                                <div class="image-box">
                                    <a href="{{ route('product-detail',$row->slug ) }}" class="imganchor"><img src="{{$photo[0]}}"
                                            alt="product1" class="p1"></a>
                                    <div class="star"><a href="javascript:"><i class="fa fa-star"></i></div></a>
                                    <a href="{{ route('product-detail',$row->slug ) }}">
                                        <h3 class="lorem"> {{ \Illuminate\Support\Str::limit($row->title, 15, $end='...') }}</h3>
                                    </a>
                                    <div class="price">
                                        <h3 class="price1">${{$row->price}} Price</h3>
                                        @if($row->is_featured == 1)
                                            <a href="javascript:"><button class="featured">Featured</button></a>
                                        @endif
                                    </div>
                                    <div class="addtocart">
                                        <!-- <a href="javascript:"><button class="cart"><i class="fa fa-cart-shopping"></i>
                                                Add To
                                                Cart</button></a> -->
                                        <a href="{{route('add-to-wishlist',$row->slug)}}" style="color:#fff"><i class="fa fa-heart hearta"></i></a>
                                        <img src="{{asset('/frontend')}}/assets/images/vertical-line.png" alt="vertical-line"
                                            class="verti-line">
                                        <a href="javascript:" style="color:#fff"><i
                                                class="fa fa-code-compare hearta"></i></a>
                                    </div>
                                </div>
                            </div>
                            @endforeach
                            @endif
                        </div>
                    </div>
                    <div class="slider">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="owl-carousel owl-theme">
                                @foreach($slideproducts as $row)
                                    @php 
                                        $photo=explode(',',$row->photo);
                                        // dd($photo);
                                    @endphp
                                    <div class="item back-carousel" style="background: url({{$photo[0]}});background-position: center center;
    background-size: cover;">
                                        <h4 class="first">First Released</h4>
                                        <h2 class="product-title">{{ \Illuminate\Support\Str::limit($row->title, 15, $end='...') }}</h2>
                                        <p class="just">Just only from</p>
                                        <h3 class="product-price">${{$row->price}}</h3>
                                        <a href="{{ route('product-detail',$row->slug ) }}"><button class="product-shop">Shop Now</button></a>
                                    </div>
                                @endforeach
                                </div>
                            </div>
                            <!-- <div class="col-md-6 pl-0">
                                <div class="row">
                                    <div class="col-md-6 pr-0">
                                        <div class="otten" style="background: url({{$slideproduct[0]->photo}})">
                                            <a href="{{ route('product-detail',$slideproduct[0]->slug ) }}">
                                                <h4 class="otten-tag">{{$slideproduct[0]->cat_info->title}}</h4>
                                            </a>
                                            <h3 class="otten-text">{{ \Illuminate\Support\Str::limit($slideproduct[0]->title, 15, $end='...') }}</h3>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="indoor"  style="background: url({{$slideproduct[1]->photo}})">
                                            <h3 class="otten-text">{{ \Illuminate\Support\Str::limit($slideproduct[1]->title, 15, $end='...') }}</h3>
                                            <h3 class="product-price1">From $300</h3>
                                            <a href="{{ route('product-detail',$slideproduct[1]->slug ) }}"><button class="product-shop">Shop Now</button></a>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pr-0">
                                        <div class="slk">
                                            <div class="row">
                                                <div class="col-md-6"  id="column-1">
                                                    <h3 class="otten-text">{{ \Illuminate\Support\Str::limit($slideproduct[2]->title, 15, $end='...') }}</h3>
                                                </div>
                                                <div class="col-md-6"  style="background: url({{$slideproduct[2]->photo}})" id="column-2">
                                                    <h3 class="otten-text">{{ \Illuminate\Support\Str::limit($slideproduct[2]->title, 15, $end='...') }}</h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="badminton"  style="background: url({{$slideproduct[3]->photo}})">
                                            <h3 class="otten-text">{{ \Illuminate\Support\Str::limit($slideproduct[3]->title, 15, $end='...') }}</h3>
                                            <h3 class="product-price1">From $300</h3>
                                            <a href="{{ route('product-detail',$slideproduct[3]->slug ) }}"><button class="product-shop">Shop Now</button></a>
                                        </div>
                                    </div>
                                </div>
                            </div> -->
                        </div>
                    </div>
                    <div class="all-products">
                        @if($catp1 != '[]')
                        <div class="net-product all">
                            <h2 class="product-nets">{{$catp1[0]->cat_info->title}}</h2>
                            <div class="net-row">
                                <a href="{{route('product-cat',$catp1[0]->cat_info->slug)}}">
                                    <h3 class="see-all-net">See All</h3>
                                </a>
                            </div>
                            <div class="row">
                                @foreach($catp1 as $row)
                                    @php 
                                        $photo=explode(',',$row->photo);
                                        // dd($photo);
                                    @endphp
                                <div class="col-md-3">
                                    <div class="image-box1">
                                        <a href="{{ route('product-detail',$row->slug ) }}" class="imganchor"><img src="{{$photo[0]}}"
                                                alt="product1" class="p1"></a>
                                    </div>
                                    <div class="price">
                                        <h3 class="paddle-price">${{$row->price}} Price</h3>
                                    </div>
                                    <a href="{{ route('product-detail',$row->slug ) }}">
                                        <h3 class="paddle-title">{{ \Illuminate\Support\Str::limit($row->title, 15, $end='...') }}</h3>
                                    </a>
                                </div>
                               @endforeach
                            </div>
                        </div>
                        @endif
                        @if($catp2 != '[]')
                        <div class="net-product all">
                            <h2 class="product-nets">{{$catp2[0]->cat_info->title}}</h2>
                            <div class="net-row">
                                <a href="{{route('product-cat',$catp2[0]->cat_info->slug)}}">
                                    <h3 class="see-all-net">See All</h3>
                                </a>
                            </div>
                            <div class="row">
                                @foreach($catp2 as $row)
                                    @php 
                                        $photo=explode(',',$row->photo);
                                        // dd($photo);
                                    @endphp
                                <div class="col-md-3">
                                    <div class="image-box1">
                                        <a href="{{ route('product-detail',$row->slug ) }}" class="imganchor"><img src="{{$photo[0]}}"
                                                alt="product1" class="p1"></a>
                                    </div>
                                    <div class="price">
                                        <h3 class="paddle-price">${{$row->price}} Price</h3>
                                    </div>
                                    <a href="{{ route('product-detail',$row->slug ) }}">
                                        <h3 class="paddle-title">{{ \Illuminate\Support\Str::limit($row->title, 15, $end='...') }}</h3>
                                    </a>
                                </div>
                               @endforeach
                            </div>
                        </div>
                        @endif
                        @if($catp3 != '[]')
                        <div class="net-product all">
                            <h2 class="product-nets">{{$catp3[0]->cat_info->title}}</h2>
                            <div class="net-row">
                                <a href="{{route('product-cat',$catp3[0]->cat_info->slug)}}">
                                    <h3 class="see-all-net">See All</h3>
                                </a>
                            </div>
                            <div class="row">
                                @foreach($catp3 as $row)
                                    @php 
                                        $photo=explode(',',$row->photo);
                                        // dd($photo);
                                    @endphp
                                <div class="col-md-3">
                                    <div class="image-box1">
                                        <a href="{{ route('product-detail',$row->slug ) }}" class="imganchor"><img src="{{$photo[0]}}"
                                                alt="product1" class="p1"></a>
                                    </div>
                                    <div class="price">
                                        <h3 class="paddle-price">${{$row->price}} Price</h3>
                                    </div>
                                    <a href="{{ route('product-detail',$row->slug ) }}">
                                        <h3 class="paddle-title">{{ \Illuminate\Support\Str::limit($row->title, 15, $end='...') }}</h3>
                                    </a>
                                </div>
                               @endforeach
                            </div>
                        </div>
                        @endif
                        @if($catp4 != '[]')
                        <div class="net-product all">
                            <h2 class="product-nets">{{$catp4[0]->cat_info->title}}</h2>
                            <div class="net-row">
                                <a href="{{route('product-cat',$catp4[0]->cat_info->slug)}}">
                                    <h3 class="see-all-net">See All</h3>
                                </a>
                            </div>
                            <div class="row">
                                @foreach($catp4 as $row)
                                    @php 
                                        $photo=explode(',',$row->photo);
                                        // dd($photo);
                                    @endphp
                                <div class="col-md-3">
                                    <div class="image-box1">
                                        <a href="{{ route('product-detail',$row->slug ) }}" class="imganchor"><img src="{{$photo[0]}}"
                                                alt="product1" class="p1"></a>
                                    </div>
                                    <div class="price">
                                        <h3 class="paddle-price">${{$row->price}} Price</h3>
                                    </div>
                                    <a href="{{ route('product-detail',$row->slug ) }}">
                                        <h3 class="paddle-title">{{ \Illuminate\Support\Str::limit($row->title, 15, $end='...') }}</h3>
                                    </a>
                                </div>
                               @endforeach
                            </div>
                        </div>
                        @endif
                        @if($catp5 != '[]')
                        <div class="net-product all">
                            <h2 class="product-nets">{{$catp5[0]->cat_info->title}}</h2>
                            <div class="net-row">
                                <a href="{{route('product-cat',$catp5[0]->cat_info->slug)}}">
                                    <h3 class="see-all-net">See All</h3>
                                </a>
                            </div>
                            <div class="row">
                                @foreach($catp5 as $row)
                                    @php 
                                        $photo=explode(',',$row->photo);
                                        // dd($photo);
                                    @endphp
                                <div class="col-md-3">
                                    <div class="image-box1">
                                        <a href="{{ route('product-detail',$row->slug ) }}" class="imganchor"><img src="{{$photo[0]}}"
                                                alt="product1" class="p1"></a>
                                    </div>
                                    <div class="price">
                                        <h3 class="paddle-price">${{$row->price}} Price</h3>
                                    </div>
                                    <a href="{{ route('product-detail',$row->slug ) }}">
                                        <h3 class="paddle-title">{{ \Illuminate\Support\Str::limit($row->title, 15, $end='...') }}</h3>
                                    </a>
                                </div>
                               @endforeach
                            </div>
                        </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
        </div>
    </section>
@endsection
