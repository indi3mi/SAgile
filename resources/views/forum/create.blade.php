@extends('layouts.app2')

<style>
    h1, h5{
        padding: 12px 20px 12px 15px;
        margin: 8px ;
    }

    div{
        border-radius: 5px;
        background-color: #f2f2f2;
        padding: 20px;
    }
    input[type=text], textarea, select{
        font-family:verdana;
        width: 100%;
        background-color: #3C87B0;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border-radius: 5px;
        box-sizing: border-box;
        border: none;
        filter: drop-shadow(0px 4px 4px rgba(0, 0, 0, 0.25));
    }
    ::placeholder, select {
    font-style: italic;
    font-size: 1em;
    color: mintcream;
    padding: auto;
    }

    input[type=submit], button {
        float: right;
        width: 5%;
        background-color: #022133;
        color: white;
        padding: 12px;
        margin: 5px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    a:hover, a:link{
        text-align: center;
        text-decoration: none;
        display:inline-block;
        color: yellow;
    }
</style>

@section('dashboard')


@endsection

@section('content')

<h1><b>NEW FORUM<b></h1>
<h5>NEW FORUM DETAILS</h5>
<br>
@foreach($data as $item)
<form action="{{route('forum.store', $item->id)}}" method="post" enctype="multipart/form-data">
@endforeach

<div class="flex flex-wrap mb-6">
<label for="id" class="block text-gray-700 text-sm font-bold mb-2">
            {{ __('Project') }}
        </label>
        <br>

        <select id='id' name='id' style='width:50%' disabled>
        @foreach($data as $item)
        <option value="{{ $item->id }}" selected>
            {{ $item->proj_name }}
        </option>
            @endforeach
        </select>
        <!-- <input id="project_id" type="text" placeholder="Add your forum title" class="form-input w-full @error('forumTitle') border-red-500 @enderror" name="forumTitle" value="{{ old('forumTitle') }}" required autocomplete="forumTitle" autofocus> -->

        @error('id')
            <p class="text-red-500 text-xs italic mt-4">
                {{ $message }}
            </p>
        @enderror
    </div>
@csrf
    <div class="flex flex-wrap mb-6">
        <label for="forumTitle" class="block text-gray-700 text-sm font-bold mb-2">
            {{ __('Title') }}
        </label>

        <br>
        <input id="forumTitle" type="text" placeholder="Add your forum title" class="form-input w-full @error('forumTitle') border-red-500 @enderror" name="forumTitle" value="{{ old('forumTitle') }}" required autocomplete="forumTitle" autofocus>

        @error('forumTitle')
            <p class="text-red-500 text-xs italic mt-4">
                {{ $message }}
            </p>
        @enderror
    </div>
    <br>
    <div class="flex flex-wrap mb-6">
        <label for="forumDesc" class="block text-gray-700 text-sm font-bold mb-2">
            {{ __('Description') }}
        </label>

        <br>
        <textarea id="forumDesc" placeholder="Add your forum description" class="form-input w-full @error('forumDesc') border-red-500 @enderror" name="forumDesc" value="{{ old('forumDesc') }}" required autocomplete="forumDesc" autofocus rows="10" cols="50"></textarea>

        @error('forumDesc')
            <p class="text-red-500 text-xs italic mt-4">
                {{ $message }}
            </p>
        @enderror
        <br>
        <input type="submit" value="Create">
        <button type='submit'>

            <a href="{{route('forum.index', $item->id)}}">Back</a></button>

        <br><br><br>
</div>
</form>

<p></p>

</body>
</html>

@endsection