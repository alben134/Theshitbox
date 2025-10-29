% Abraham, Jones, 1236002380

n = input('please enter a number between 100 and 200: ');

for x = 1:n
    if mod(x,3) == 0 || mod(x,7) == 0
        if mod(x,21) == 0
            disp(x)
        end
    else 
        disp(x)
    end
end
