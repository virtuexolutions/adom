@extends('frontend.layouts.master')
@section('title','Product Create')

@section('content')
<link rel="stylesheet" href="{{asset('backend/summernote/summernote.min.css')}}">
<section class="dashboard">
        <h2 class="Shopping-heading">Create Product</h2>
        <div class="container">
            <div class="row">
                @include('vendor.layouts.sidebar')
                <div class="col-md-8 p-0">
                    <div class="dash-div1">
                        <h2 class="dashboard-txt1">Create Product</h2>
                    </div>
                    <div id="Products" class="tabcontent" style="display: block;">
                        <form method="post" action="{{route('vproduct.store')}}">
                            {{csrf_field()}}
                            <div class="form-group">
                                <label for="inputTitle" class="col-form-label">Title <span class="text-danger">*</span></label>
                                <input  type="text" name="user_id" value="{{auth()->user()->id}}" hidden>
                                <input type="text" name="title" placeholder="Enter title" id="title" value="{{old('title')}}" class="form-control">
                                @error('title')
                                    <span class="text-danger">{{$message}}</span>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label for="summary" class="col-form-label">Summary <span class="text-danger">*</span></label>
                                <textarea class="form-control" id="summary" name="summary">{{old('summary')}}</textarea>
                                @error('summary')
                                <span class="text-danger">{{$message}}</span>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label for="description" class="col-form-label">Description</label>
                                <textarea class="form-control" id="description" name="description">{{old('description')}}</textarea>
                                @error('description')
                                <span class="text-danger">{{$message}}</span>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label for="specification" class="col-form-label">Specification</label>
                                <textarea class="form-control" id="specification" name="specification">{{old('specification')}}</textarea>
                                @error('specification')
                                <span class="text-danger">{{$message}}</span>
                                @enderror
                            </div>


                            <div class="form-group">
                                <label for="is_featured">Is Featured</label><br>
                                <input type="checkbox" name='is_featured' id='is_featured' value='1' checked> Yes                        
                            </div>
                            {{-- {{$categories}} --}}

                            <div class="form-group">
                                <label for="cat_id">Category <span class="text-danger">*</span></label>
                                <select name="cat_id" id="cat_id" class="form-control">
                                    <option value="">--Select any category--</option>
                                    @foreach($categories as $key=>$cat_data)
                                        <option value='{{$cat_data->id}}'>{{$cat_data->title}}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="form-group d-none" id="child_cat_div">
                                <label for="child_cat_id">Sub Category</label>
                                <select name="child_cat_id" id="child_cat_id" class="form-control">
                                    <option value="">--Select any category--</option>
                                    {{-- @foreach($parent_cats as $key=>$parent_cat)
                                        <option value='{{$parent_cat->id}}'>{{$parent_cat->title}}</option>
                                    @endforeach --}}
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="price" class="col-form-label">Price(NRS) <span class="text-danger">*</span></label>
                                <input id="price" type="number" name="price" placeholder="Enter price"  value="{{old('price')}}" class="form-control">
                                @error('price')
                                <span class="text-danger">{{$message}}</span>
                                @enderror
                            </div>
                            
                            <div class="form-group">
                                <label for="sku" class="col-form-label">SKU</label>
                                <input id="sku" type="text" name="sku" placeholder="Enter SKU"  value="{{old('sku')}}" class="form-control">
                                @error('sku')
                                <span class="text-danger">{{$message}}</span>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label for="discount" class="col-form-label">Discount(%)</label>
                                <input id="discount" type="number" name="discount" min="0" max="100" placeholder="Enter discount"  value="{{old('discount')}}" class="form-control">
                                @error('discount')
                                <span class="text-danger">{{$message}}</span>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label for="size">Size</label>
                                <select name="size[]" class="form-control selectpicker"  multiple data-live-search="true">
                                    <option value="">--Select any size--</option>
                                    <option value="S">Small (S)</option>
                                    <option value="M">Medium (M)</option>
                                    <option value="L">Large (L)</option>
                                    <option value="XL">Extra Large (XL)</option>
                                </select>
                            </div>
                            

                            <div class="form-group">
                                <label for="brand_id">Brand</label>
                                {{-- {{$brands}} --}}

                                <select name="brand_id" id="brandId" class="form-control">
                                    <option value="">--Select Brand--</option>
                                    @foreach($brands as $row)
                                        <option value="{{$row->id}}" >{{$row->title}}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="condition">Condition</label>
                                <select name="condition" class="form-control">
                                    <option value="">--Select Condition--</option>
                                    <option value="default">Default</option>
                                    <option value="new">New</option>
                                    <option value="hot">Hot</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="stock">Quantity <span class="text-danger">*</span></label>
                                <input id="price" type="number" name="stock" min="0" placeholder="Enter quantity"  value="{{old('stock')}}" class="form-control">
                                <!-- <input id="quantity" type="number" name="stock" min="0" placeholder="Enter quantity"  value="{{old('stock')}}" class="form-control"> -->
                                @error('stock')
                                <span class="text-danger">{{$message}}</span>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label for="inputPhoto" class="col-form-label">Photo <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <span class="input-group-btn">
                                        <a id="lfm" data-input="thumbnail" data-preview="holder" class="btn btn-primary">
                                        <i class="fa fa-picture-o"></i> Choose
                                        </a>
                                    </span>
                                    <input id="thumbnail" class="form-control" readonly style="margin-right: 70px;" placeholder="Choose Photo" name="photo" value="{{old('photo')}}">
                                </div>
                                <div id="holder" style="margin-top:15px;max-height:100px;"></div>
                                @error('photo')
                                <span class="text-danger">{{$message}}</span>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label for="tags">Tag</label>
                                <select name="tags[]" multiple  data-live-search="true" class="form-control selectpicker">
                                    <option value="">--Select any tag--</option>
                                    @foreach($tags as $key=>$data)
                                        <option value='{{$data->title}}'>{{$data->title}}</option>
                                    @endforeach
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <label for="status" class="col-form-label">Status <span class="text-danger">*</span></label>
                                <select name="status" class="form-control">
                                    <option value="active">Active</option>
                                    <option value="inactive">Inactive</option>
                                </select>
                                @error('status')
                                <span class="text-danger">{{$message}}</span>
                                @enderror
                            </div>
                            <div class="form-group mb-3">
                                <button class="btn btn-success" type="submit">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </section>
@endsection