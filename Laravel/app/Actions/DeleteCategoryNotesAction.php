<?php

namespace App\Actions;

use Spatie\QueueableAction\QueueableAction;

class DeleteCategoryNotesAction
{
    use QueueableAction;

    /**
     * Create a new action instance.
     *
     * @return void
     */
    public function __construct()
    {
        // Prepare the action for execution, leveraging constructor injection.
    }

    /**
     * Execute the action.
     *
     * @return mixed
     */
    public function execute($notes)
    {
        foreach($notes as $note){
            $note->delete();
        }
    }
}
