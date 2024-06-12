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
        color: mintcream;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border-radius: 5px;
        box-sizing: border-box;
        border: none;
        filter: drop-shadow(0px 4px 4px rgba(0, 0, 0, 0.25));
    }
    ::placeholder {
    font-style: italic;
    font-size: 1em;
    color: mintcream;
    padding: auto;
    }

    button, input[type=submit]{
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

<h1><b>NEW DEFECT<b></h1>
<h5>NEW DEFECT DETAILS</h5>
@foreach($data as $item)
<form action="{{route('defect.store', $item->id)}}" method="post" enctype="multipart/form-data">
@endforeach

    <div class="flex flex-wrap mb-6">
        <label for="id" class="block text-gray-700 text-sm font-bold mb-2">
            {{ __('Project') }}
        </label>
        <br>

        <select id='id' name='id' style='width:50%' >
        @foreach($data as $item)
        <option value="{{ $item->id }}" >
            {{ $item->proj_name }}
        </option>
            @endforeach
        </select>

        @error('id')
            <p class="text-red-500 text-xs italic mt-4">
                {{ $message }}
            </p>
        @enderror
    </div>
    @csrf
    <div class="flex flex-wrap mb-6">
        <label for="def_title" class="block text-gray-700 text-sm font-bold mb-2">
        {{ __('Title') }}
        </label>

        <br>
        <input id="def_title" type="text" placeholder="Add your defect title" class="form-input w-full @error('def_title') border-red-500 @enderror" name="def_title" value="{{ old('def_title') }}" required autocomplete="def_title" autofocus>

        @error('def_title')
            <p class="text-red-500 text-xs italic mt-4">
                {{ $message }}
            </p>
        @enderror
    </div>

    <div class="flex flex-wrap mb-6">
        <label for="def_desc" class="block text-gray-700 text-sm font-bold mb-2">
        {{ __('Description') }}
        </label>

        <br>
        <input id="def_desc" type="text" placeholder="Add your defect description" class="form-input w-full @error('def_desc') border-red-500 @enderror" name="def_desc" value="{{ old('def_desc') }}" required autocomplete="def_desc" autofocus></textarea>

        @error('def_desc')
            <p class="text-red-500 text-xs italic mt-4">
                {{ $message }}
            </p>
        @enderror
    </div>

    <div class="flex flex-wrap mb-6">
        <label for="def_status" class="block text-gray-700 text-sm font-bold mb-2">
        {{ __('Status') }}
        </label>

        <br>
        <select id="def_status" type="text" class="form-input w-full @error('name')  border-red-500 @enderror" name="def_status" value="{{ old('def_status') }}" required autocomplete="def_status" autofocus>
            <option value="New">1 - New</option>
            <option value="Assigned">2 - Assigned</option>
            <option value="Open">3 - Open</option>
            <option value="Fixed">4 - Fixed</option>
            <option value="Pending Retest">5 - Pending Retest</option>
            <option value="Retest">6 - Retest</option>
            <option value="Verified">7 - Verified</option>
            <option value="Closed">8 - Closed</option>
        </select>
        @error('def_status')
            <p class="text-red-500 text-xs italic mt-4">
                {{ $message }}
            </p>
        @enderror
    </div>

    <div class="flex flex-wrap mb-6">
        <label for="def_severity" class="block text-gray-700 text-sm font-bold mb-2">
            {{ __('Severity') }}:
        </label>
        <br>
        <select id="def_severity" type="text" class="form-input w-full @error('name')  border-red-500 @enderror" name="def_severity" value="{{ old('def_severity') }}" required autocomplete="def_severity" autofocus>
            <option value="Cosmetic">1 - Cosmetic</option>
            <option value="Minor">2 - Minor</option>
            <option value="Moderate">3 - Moderate</option>
            <option value="Major">4 - Major</option>
            <option value="Critical">5 - Critical</option>
        </select>

        @error('def_severity')
            <p class="text-red-500 text-xs italic mt-4">
                {{ $message }}
            </p>
        @enderror
    </div>

    <div class="flex flex-wrap mb-6">
        <label for="def_actual_result" class="block text-gray-700 text-sm font-bold mb-2">
        {{ __('Actual Result') }}
        </label>

        <br>
        <input id="def_actual_result" type="text" placeholder="Add your defect actual result" class="form-input w-full @error('defectActualResult') border-red-500 @enderror" name="def_actual_result" value="{{ old('def_actual_result') }}" required autocomplete="def_actual_result" autofocus>

        @error('def_actual_result')
            <p class="text-red-500 text-xs italic mt-4">
                {{ $message }}
            </p>
        @enderror
    </div>

    <div class="flex flex-wrap mb-6">
        <label for="def_expected_result" class="block text-gray-700 text-sm font-bold mb-2">
        {{ __('Expected Result') }}
        </label>

        <br>
        <input id="def_expected_result" type="text" placeholder="Add your defect expected result" class="form-input w-full @error('def_expected_result') border-red-500 @enderror" name="def_expected_result" value="{{ old('def_expected_result') }}" required autocomplete="def_expected_result" autofocus>

        @error('def_expected_result')
            <p class="text-red-500 text-xs italic mt-4">
                {{ $message }}
            </p>
        @enderror
    </div>

    <div class="flex flex-wrap mb-6">
        <label for="def_flow" class="block text-gray-700 text-sm font-bold mb-2">
        {{ __('Defect Flow') }}
        </label>

        <br>
        <textarea id="def_flow" placeholder="Add your defect flow" class="form-input w-full @error('def_flow') border-red-500 @enderror" name="def_flow" value="{{ old('def_flow') }}" required autocomplete="def_flow" autofocus rows="5" cols="50"></textarea>

        @error('def_flow')
            <p class="text-red-500 text-xs italic mt-4">
                {{ $message }}
            </p>
        @enderror
    </div>

    <div class="flex flex-wrap mb-6">
        <label for="def_attachment" class="block text-gray-700 text-sm font-bold mb-2">
        {{ __('Attachment') }}
        </label>

        <br>
        <input id="def_attachment" type="file" placeholder="Add your defect attachment" class="form-input w-full @error('def_attachment') border-red-500 @enderror" name="def_attachment" value="{{ old('def_attachment') }}" required autocomplete="def_attachment" autofocus>

        @error('def_attachment')
            <p class="text-red-500 text-xs italic mt-4">
                {{ $message }}
            </p>
        @enderror


    <br>
    <input type="submit" value="Create">
    <button type='submit'><a href="{{route('defect.index', $item->id)}}">Back</a></button>
    <br><br><br>
</div>
</form>
<p></p>

</body>
</html>

@endsection