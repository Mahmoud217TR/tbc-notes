<?php

namespace App\Http\Requests\Note;

use Illuminate\Foundation\Http\FormRequest;

class UpdateRequest extends FormRequest
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
            'title' => ['nullable', 'string'],
            'content' => ['nullable', 'string'],
            'category' => ['nullable', 'int', 'exists:categories,id'],
            'done' => ['nullable', 'boolean'],
        ];
    }
}
