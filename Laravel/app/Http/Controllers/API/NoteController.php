<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\Note\IndexRequest;
use App\Http\Requests\Note\StoreRequest;
use App\Http\Requests\Note\UpdateRequest;
use App\Models\Note;
use App\Http\Resources\NoteResource;

class NoteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(IndexRequest $request)
    {
        $query = user()->notes()
            ->when(filled($request->category), fn($query) => $query->inCategory($request->category))
            ->when(filled($request->is_done), fn($query) => $query->whereDoneIs($request->is_done))
            ->when(filled($request->keyword), fn($query) => $query->withKeyword($request->keyword));

        return NoteResource::collection(
            $query->paginate($request->perpage)->load('images')
        );
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreNoteRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreRequest $request)
    {
        $note = Note::create([
            'title' => $request->title,
            'content' => $request->content,
            'category_id' => $request->category,
            'user_id' => user()->id,
        ]);

        return new NoteResource($note->load('images'));
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Note  $note
     * @return \Illuminate\Http\Response
     */
    public function show(Note $note)
    {
        $this->authorize('view', $note);
        return new NoteResource($note->load('images'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateNoteRequest  $request
     * @param  \App\Models\Note  $note
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateRequest $request, Note $note)
    {
        $this->authorize('update', $note);
        
        $note->update($request->only('title','content','category','done'));

        return new NoteResource($note->load('images','category'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Note  $note
     * @return \Illuminate\Http\Response
     */
    public function destroy(Note $note)
    {
        $this->authorize('delete', $note);

        $note->delete();

        return response()->json([
            'message' => "Note Deleted Successfully",
        ]);
    }
}
