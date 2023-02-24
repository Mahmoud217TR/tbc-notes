<?php

namespace App\Http\Requests\Note;

use Illuminate\Foundation\Http\FormRequest;

class IndexRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'perpage' => ['required', 'integer', 'min:1', 'max:50'],
            'category' => ['nullable', 'exists:categories,id'],
            'is_done' => ['nullable', 'boolean'],
            'keyword' => ['nullable', 'string'],
        ];
    }
}
