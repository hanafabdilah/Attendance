<form action="{{ url($delete_url) }}" method="post">
    @csrf @method('DELETE')
    @if ($edit_url)
        <a href="{{ $edit_url }}" class="btn btn-sm btn-info text-white fa fa-pencil"></a>
    @endif
    <a href="{{ $show_url }}" class="btn btn-sm btn-secondary fa fa-eye"></a>
    @if ($delete_url)
    <button
    type="submit"
    class="btn btn-danger btn-sm fa fa-trash"
    onclick="return confirm('Are you sure want to delete this data ?')"
    ></button>
    @endif
</form>
