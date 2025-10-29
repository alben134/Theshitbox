global key
InitKeyboard();

while true
    pause(0.1);
    switch key
    case 'space'
        brick.StopMotor('AB', 'Brake');
    case 'w'
        brick.MoveMotor('A', 100);
        brick.MoveMotor('B', 100);

    case 's'
        brick.MoveMotor('A', -100);
        brick.MoveMotor('B', -100);

    case 'a'
        brick.MoveMotor('A', -100);
        brick.MoveMotor('B', 100);

    case 'd'
        brick.MoveMotor('A', 100);
        brick.MoveMotor('B', -100);

    case 0
        brick.StopMotor('AB', 'Brake');
    end
end

% CloseKeyboard();
