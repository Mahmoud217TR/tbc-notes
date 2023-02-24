<?php

namespace App\Http\Controllers\API;

use App\Actions\DeleteCategoryNotesAction;
use App\Http\Controllers\Controller;
use App\Http\Requests\Category\IndexRequest;
use App\Http\Requests\Category\StoreRequest;
use App\Http\Requests\Category\UpdateRequest;
use App\Models\Category;
use App\Http\Resources\CategoryResource;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(IndexRequest $request)
    {
        $query = user()->categories()
            ->when(filled($request->keyword), fn($query) => $query->withKeyword($request->keyword));

        return CategoryResource::collection(
           $query->paginate($request->perpage)
        );
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreCategoryRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreRequest $request)
    {
        $category = Category::create([
            'name' => $request->name,
            'user_id' => user()->id,
        ]);

        return new CategoryResource($category);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function show(Category $category)
    {
        $this->authorize('view', $category);
        return new CategoryResource($category->load('notes'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateCategoryRequest  $request
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateRequest $request, Category $category)
    {
        $this->authorize('update', $category);

        $category->update($request->all());

        return  new CategoryResource($category);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function destroy(Category $category, DeleteCategoryNotesAction $action)
    {
        $this->authorize('delete', $category);

        $action->onQueue()->execute($category->notes);
        $category->delete();

        return response()->json([
            'message' => "Category Deleted Successfully",
        ]);
    }
}
