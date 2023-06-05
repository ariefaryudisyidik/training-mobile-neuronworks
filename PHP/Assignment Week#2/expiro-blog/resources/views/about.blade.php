@extends('layouts.main')

@section('container')
    <h1 class="text-center mb-3">About Page</h1>
    <div class="d-flex justify-content-center">
        <img src="img/{{ $image }}" alt="{{ $name }}" width="200" class="img-thumbnail rounded-circle mb-3">
    </div>
    <h3 class="text-center">{{ $name }}</h3>
    <p class="text-center">{{ $email }}</p></p>
@endsection