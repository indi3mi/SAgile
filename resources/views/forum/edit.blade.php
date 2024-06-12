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

    input[type=submit] {
        float: right;
        width: 5%;
        background-color: #022133;
        color: white;
        padding: 12px;
        margin: auto;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
</style>

@section('dashboard')


@endsection

@section('content')

<h1><b>UPDATE FORUM<b></h1>
<h5>UPDATE YOUR FORUM<h5>
<form action="{{route('forum.update', [$data[0]->forumID, $data[0]->project_id])}}" method="post" enctype="multipart/form-data">
    @csrf
    <div class="flex flex-wrap mb-6">
        <input hidden type='int' value="{{ $data[0]->forumID }}" name='parentID' />
        <input hidden type='int' value="{{ $data[0]->forumTitle }}" name='forumTitle' />
    <div class="flex flex-wrap mb-6">
        <label for="forumDesc" class="block text-gray-700 text-sm font-bold mb-2">
            {{ __('Description') }}
        </label>
        <textarea id="forumDesc" placeholder="Add your forum description" required autocomplete="forumDesc" autofocus rows="10" cols="50" class="form-input w-full @error('forumDesc') border-red-500 @enderror" name="forumDesc">{{  $data[0]->forumDesc  }}</textarea>
        @error('forumDesc')
            <p class="text-red-500 text-xs italic mt-4">
                {{ $message }}
            </p>
        @enderror
        <br>
        <input type="submit" value="Update">
        <br><br><br>
</form>
<p></p>

</body>
</html>

@endsection
