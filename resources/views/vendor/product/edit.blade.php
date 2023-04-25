@extends('frontend.layouts.master')
@section('title','Product Edit')

@section('content')
<link rel="stylesheet" href="{{asset('backend/summernote/summernote.min.css')}}">
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" /> -->

<style>
    .tabcontent{
        overflow-y: auto
    }
</style>
    <section class="dashboard">
        <h2 class="Shopping-heading">Dashboard</h2>
        <div class="container">
            <div class="row">
            @include('vendor.layouts.sidebar')
                <div class="col-md-8 p-0">
                    <div id="Profile" class="tabcontent" style="display: none;">
                    <div class="dash-div1">
                        <h2 class="dashboard-txt1">Your Information</h2>
                    </div>
                        <div class="profile-div">
                            <img src="./assets/images/profile-pic.png" alt="profile-pic" class="profile-pic">
                            <h4 class="profile-name">Mark Mathew</h4>
                            <h5 class="profile-email">markmathew1234@gmail.com</h5>
                            <div class="profile-social">
                                <a href="javascript:"><i class="fa-brands fa-facebook-f"></i></a>
                                <a href="javascript:"><i class="fa-brands fa-twitter"></i></a>
                                <a href="javascript:"><i class="fa-brands fa-google-plus-g"></i></a>
                                <a href="javascript:"><i class="fa-brands fa-pinterest-p"></i></a>
                                <a href="javascript:"><i class="fa fa-basketball"></i></a>
                            </div>
                            <p class="profile-desc"> We work with clients big and small across a range of sectors and we
                                utilise all
                                forms of media to get your name out there in a way that’s right for you. We have a
                                number of different teams within our agency that specialise in different areas.</p>
                        </div>
                    </div>

                    <div id="Products" class="tabcontent" style="display: none;">
                        <div class="dash-div1">
                            <h2 class="dashboard-txt1">Your Products</h2>
                        </div>
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>S.N.</th>
                                <th>Product Image</th>
                                <th>Product Info</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            @foreach($products as $product)
                            @php
                                $sub_cat_info=DB::table('categories')->select('title')->where('id',$product->child_cat_id)->get();
                                // dd($sub_cat_info);
                                $brands=DB::table('brands')->select('title')->where('id',$product->brand_id)->get();
                            @endphp
                            <tr>
                                <td>{{$product->id}}</td>
                                <td>
                                        @php
                                            $photo=explode(',',$product->photo);
                                            // dd($photo);
                                        @endphp
                                        <img src="{{$photo[0]}}" class="img-fluid zoom" style="max-width:200px" alt="{{$product->photo}}"><br>
                                </td>
                                <td>
                                    <b>Prodcuct Name</b> : {{$product->title}} <br>
                                    <b>Category</b> : {{$product->cat_info['title']}}  {{$product->sub_cat_info->title ?? ''}}<br>
                                    <b>Feature</b> : {{(($product->is_featured==1)? 'Yes': 'No')}} <br>
                                    <b>Price</b> : Rs. {{$product->price}} /- <br>
                                    <b>Discount</b> : {{$product->discount}}% OFF <br>
                                    <b>Size</b> : {{$product->size}} <br>
                                    <b>Condition</b> : {{$product->condition}} <br>
                                    <b>Brand</b> : {{ucfirst($product->brand->title)}} <br>
                                    <b>Stock</b> : {{$product->stock}} <br>
                                </td>
                                <td>
                                    @if($product->status=='active')
                                        <span class="badge badge-success">{{$product->status}}</span>
                                    @else
                                        <span class="badge badge-warning">{{$product->status}}</span>
                                    @endif
                                </td>
                                <td>
                                    @if(auth()->user()->role =='admin')
                                        <a href="{{route('product.edit',$product->id)}}" class="btn btn-primary btn-sm float-left mr-1" style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" title="edit" data-placement="bottom"><i class="fas fa-edit"></i></a>
                                    @else
                                        <a href="{{route('vproduct.edit',$product->id)}}" class="btn btn-primary btn-sm float-left mr-1" style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" title="edit" data-placement="bottom"><i class="fas fa-edit"></i></a>
                                        <!-- <a onclick="openTabb(event, 'Upload',{{$product->id}})" class="btn btn-primary btn-sm float-left mr-1" style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" title="edit" data-placement="bottom"><i class="fas fa-edit"></i></a> -->
                                    @endif
                                    <form method="POST" action="{{route('vproduct.destroy',[$product->id])}}">
                                        @csrf
                                        @method('delete')
                                        <button class="btn btn-danger btn-sm dltBtn" data-id='{{$product->id}}' style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" data-placement="bottom" title="Delete"><i class="fas fa-trash-alt"></i></button>
                                    </form>
                                </td>
                            </tr>
                        @endforeach
                    </table>   
                </div>

                    <div id="Upload" class="tabcontent" style="display: block;">
                    <div class="dash-div1">
                            <h2 class="dashboard-txt1">Edit Product</h2>
                        </div>


                        <form method="post" action="{{route('vproduct.update',$product->id)}}">
        @csrf 
        @method('PATCH')
        <div class="form-group">
          <input  type="text" name="user_id" value="{{auth()->user()->id}}" hidden>
          <label for="inputTitle" class="col-form-label">Title <span class="text-danger">*</span></label>
          <input id="inputTitle" type="text" name="title" placeholder="Enter title"  value="{{$editproduct->title}}" class="form-control">
          @error('title')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>

        <div class="form-group">
          <label for="summary" class="col-form-label">Summary <span class="text-danger">*</span></label>
          <textarea class="form-control" id="summary" name="summary">{{$editproduct->summary}}</textarea>
          @error('summary')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>

        <div class="form-group">
          <label for="description" class="col-form-label">Description</label>
          <textarea class="form-control" id="description" name="description">{{$editproduct->description}}</textarea>
          @error('description')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>

        <div class="form-group">
            <label for="specification" class="col-form-label">Specification</label>
            <textarea class="form-control" id="specification" name="specification">{{$editproduct->specification}}</textarea>
            @error('specification')
            <span class="text-danger">{{$message}}</span>
            @enderror
        </div>


        <div class="form-group">
          <label for="is_featured">Is Featured</label><br>
          <input type="checkbox" name='is_featured' id='is_featured' value='{{$editproduct->is_featured}}' {{(($editproduct->is_featured) ? 'checked' : '')}}> Yes                        
        </div>
              {{-- {{$categories}} --}}

        <div class="form-group">
          <label for="cat_id">Category <span class="text-danger">*</span></label>
          <select name="cat_id" id="cat_id" class="form-control">
              <option value="">--Select any category--</option>
              @foreach($categories as $key=>$cat_data)
                  <option value='{{$cat_data->id}}' {{(($editproduct->cat_id==$cat_data->id)? 'selected' : '')}}>{{$cat_data->title}}</option>
              @endforeach
          </select>
        </div>
        @php 
          $sub_cat_info=DB::table('categories')->select('title')->where('id',$editproduct->child_cat_id)->get();
        // dd($sub_cat_info);

        @endphp
        {{-- {{$product->child_cat_id}} --}}
        <div class="form-group {{(($product->child_cat_id)? '' : 'd-none')}}" id="child_cat_div">
          <label for="child_cat_id">Sub Category</label>
          <select name="child_cat_id" id="child_cat_id" class="form-control">
              <option value="">--Select any sub category--</option>
              
          </select>
        </div>

        <div class="form-group">
          <label for="price" class="col-form-label">Price(NRS) <span class="text-danger">*</span></label>
          <input id="price" type="text" name="price" placeholder="Enter price"  value="{{$editproduct->price}}" class="form-control">
          @error('price')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>

        <div class="form-group">
          <label for="price" class="col-form-label">SKU</label>
          <input id="price" type="text" name="sku" placeholder="Enter SKU"  value="{{$editproduct->sku }}" class="form-control">
          @error('sku')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>

        <div class="form-group">
          <label for="discount" class="col-form-label">Discount(%)</label>
          <input id="discount" type="number" name="discount" min="0" max="100" placeholder="Enter discount"  value="{{$editproduct->discount}}" class="form-control">
          @error('discount')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group">
          <label for="size">Size</label>
          <select name="size[]" class="form-control selectpicker"  multiple data-live-search="true">
              <option value="">--Select any size--</option>
              @foreach($items as $item)              
                @php 
                $data=explode(',',$item->size);
                // dd($data);
                @endphp
              <option value="S"  @if( in_array( "S",$data ) ) selected @endif>Small</option>
              <option value="M"  @if( in_array( "M",$data ) ) selected @endif>Medium</option>
              <option value="L"  @if( in_array( "L",$data ) ) selected @endif>Large</option>
              <option value="XL"  @if( in_array( "XL",$data ) ) selected @endif>Extra Large</option>
              @endforeach
          </select>
        </div>

        <div class="form-group">
            <label for="brand_id">Brand</label>
          <select name="brand_id" class="form-control">
              <option value="">--Select Brand--</option>
              @foreach($brandss as $row)
              <option value="{{$row->id}}" {{ ( $editproduct->brand_id==$row->id)? 'selected':''}}>{{$row->title}}</option>
              @endforeach
          </select>
        </div>

        <div class="form-group">
          <label for="condition">Condition</label>
          <select name="condition" class="form-control">
              <option value="">--Select Condition--</option>
              <option value="default" {{(($editproduct->condition=='default')? 'selected':'')}}>Default</option>
              <option value="new" {{(($editproduct->condition=='new')? 'selected':'')}}>New</option>
              <option value="hot" {{(($editproduct->condition=='hot')? 'selected':'')}}>Hot</option>
          </select>
        </div>

        <div class="form-group">
          <label for="stock">Quantity <span class="text-danger">*</span></label>
          <input type="number" name="stock" min="0" placeholder="Enter quantity" value="{{$editproduct->stock}}" class="form-control">
          @error('stock')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group">
          <label for="inputPhoto" class="col-form-label">Photo <span class="text-danger">*</span></label>
          <div class="input-group">
              <span class="input-group-btn">
                  <a id="lfm" data-input="thumbnail" data-preview="holder" class="btn btn-primary text-white">
                  <i class="fas fa-image"></i> Choose
                  </a>
              </span>
          <input id="thumbnail" class="form-control" type="text" name="photo" value="{{$editproduct->photo}}">
        </div>
        <div id="holder" style="margin-top:15px;max-height:100px;">
        <img src="{{$product->photo}}" width="100">  
      </div>
          @error('photo')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>

        @php 
                $post_tags=explode(',',$editproduct->tags);
                // dd($tags);
              @endphp
        <div class="form-group">
          <label for="tags">Tag</label>
          <select name="tags[]" multiple  data-live-search="true" class="form-control selectpicker">
              <option value="">--Select any tag--</option>
              @foreach($tags as $key=>$data)
              
              <option value="{{$data->title}}"  {{(( in_array( "$data->title",$post_tags ) ) ? 'selected' : '')}}>{{$data->title}}</option>
              @endforeach
          </select>
        </div>
        
        <div class="form-group">
          <label for="status" class="col-form-label">Status <span class="text-danger">*</span></label>
          <select name="status" class="form-control">
            <option value="active" {{(($editproduct->status=='active')? 'selected' : '')}}>Active</option>
            <option value="inactive" {{(($editproduct->status=='inactive')? 'selected' : '')}}>Inactive</option>
          </select>
          @error('status')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group mb-3">
           <button class="btn btn-success" type="submit">Update</button>
        </div>
      </form>

                                        
                    </div>
                    <div id="Earnings" class="tabcontent" style="display: none;">

                    </div>
                    <div id="Logout" class="tabcontent" style="display: none;">
                        
                    </div>
                </div>
            </div>
        </div>

    </section>
    
    
@endsection