global key
InitKeyboard();
collisionHandled = false;

% --- Configuration for Backup Assist ---
% Reverse power is set to -33 (33% of maximum power 100)
BACKUP_POWER = -33; 
Fs = 44100;         % Audio Sampling frequency (samples/second)
DURATION = 0.005;     % Beep duration in seconds
FREQUENCY = 1500;   % Tone frequency (Hz)
% ---------------------------------------

while true
    pause(0.1);
    leftPressed  = brick.TouchPressed(1);
    rightPressed = brick.TouchPressed(2);

    switch key
    case 'space'
        brick.StopMotor('AB', 'Brake');
    case 'w'
        brick.MoveMotor('A', 100);
        brick.MoveMotor('B', 100);

    case 's'
            % --- MODIFIED: 33% Reverse Speed and Beeping ---
            
            % 1. Beeping Logic: Generate and play the sound
            t_samples = round(Fs * DURATION);
            t = (0:t_samples-1)' / Fs;
            beep_signal = 0.5 * sin(2 * pi * FREQUENCY * t);
            
            % Play the beep sound (requires a working MATLAB audio environment)
            sound(beep_signal, Fs); 

            % 2. Movement Logic: Use the limited 33% speed
            power = BACKUP_POWER; % power is -33
            
            brick.MoveMotor('A', power);
            brick.MoveMotor('B', power);
    case 'a'
        brick.MoveMotor('A', -100);
        brick.MoveMotor('B', 100);

    case 'd'
        brick.MoveMotor('A', 100);
        brick.MoveMotor('B', -100);

    case 0
        brick.StopMotor('AB', 'Brake');
    end

    if leftPressed && rightPressed
        if ~collisionHandled
            disp('Collision detected!');
            brick.playTone(100, 500, 500);
            collisionHandled = true;
        end
    else
        collisionHandled = false;
    end
end