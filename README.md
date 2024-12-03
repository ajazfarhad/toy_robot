# Usage
### Run Interactively
To run the application in interactive mode:
``
ruby your_script.rb
``
You will be prompted to enter commands. A sample command file is given under the lib directory. Type ``EXIT`` to quit.

# Run with a File
Create a text file with commands, for example, ``commands.txt``
``PLACE 0,0,NORTH``
``MOVE``
``LEFT``
``REPORT``
``EXIT``

Run the application with the file as an argument:
``ruby your_script.rb commands.txt``

## Testing
``bundle exec rspec``

## Testing Note
I did not add separate unit tests for the ``Table``, ``Position``, and ``Robot`` objects because their functionalities are thoroughly tested through the command objects ``(PlaceCommand, MoveCommand, LeftCommand, RightCommand, and ReportCommand).`` These command objects drive the behavior of the simulator and ensure that the underlying classes are functioning as expected.