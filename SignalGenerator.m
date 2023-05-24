        % % % Signal Generator % % % 
fs = input('Enter Sampling Frequency: ');
start = input ('Enter start of time scale: ');
ending = input ('Enter end of time scale: ');
brkPtsCount = input ('Enter number of break points: ');
brkPts =[];

%reading break points from user
for i = 1:1:brkPtsCount
    temp = input(['Enter t of break point number ' num2str(i) ': ']);
    while (temp >=ending || temp<=start || ismember(temp,brkPts)) %making sure they lie within range
        if(temp >=ending || temp<=start)
            temp = input(['Invalid entry: the break point should be in the following range:' ...
                ' )' num2str(start) ',' num2str(ending) '( : ']);
        elseif (ismember(temp,brkPts))
            temp = input('Invalid entry: you have already entered this break point. Try again!');
        end
    end
    brkPts =[brkPts temp];
end

brkPts = sort(brkPts); %sorts the array in case user has entered unordered points

yFinal =[]; %final graph to be plotted
tFinal = []; %final t-axis 

   %  % determining form of every region %  %
for i = 1:1:brkPtsCount+1
    %1st: determine start and end point of region
    if (brkPtsCount ==0)
        t1 = start; t2=ending;
    elseif (i==1) %first region
        t1=start; t2=brkPts(1);
    elseif (i==brkPtsCount+1)
        t2 = ending; t1=brkPts(length(brkPts));
    else
        t1 =brkPts(i-1); t2= brkPts(i);
    end   
    %2nd: recieve from user their choice
    choice = input(['Choose the type of signal of region from ' num2str(t1) ' to ' num2str(t2) ' (just enter the number of the choice):\n' ...
        '1]DC \n2]Ramp \n3]General Order Polynomial\n4]Exponential\n5]Sinusoidal\n']);
    td = linspace(t1,t2,(t2-t1)*fs);
    %3rd: handling the choice
    switch choice
        case 1
            amplitude = input('Enter the amplitude of the signal: ');
            x = amplitude*ones(1,(t2-t1)*fs);
        case 2
            m = input('Enter the slope of the signal: ');
            c = input('Enter y-axis intercept: ');
            x = m * td + c;
        case 3
            ampPower = input('Enter the amplitude power: ');
            Powers = [];
            for k = 0:1:ampPower
                p = input(['Enter coefficient of X^' num2str(ampPower-k) ':']);
                Powers = [Powers p];
            end
            x = polyval(Powers,td);
        case 4
            amplitude = input('Enter the amplitude of the signal: ');
            e = input ('Enter exponent: ');
            x = amplitude * exp(e*td);
        case 5
            amplitude = input('Enter the amplitude of the signal: ');
            ph = input('Enter phase: ');
            f = input('Enter frequency: ');
            x = amplitude * sin(2*pi*f*td+ph);
    end
    yFinal = [yFinal x];
    tFinal = [tFinal td];
end
plot(tFinal,yFinal);
grid on;

   % % operating on signal % %
tTemp = tFinal; yTemp = yFinal; %creating temporary versions to operate on
%1st: recieve from user their choice(s)
choice = 0;
while (choice~=6) 
    choice = input(['Choose an operation to perform on the resulted signal (just enter the number of the choice):\n' ...
            '1]Amplitude scaling \n2]Time reversal \n3]Time shift\n4]Expansion \n5]Compression \n6]None\n']);
    %2nd: operating on signal
    switch choice
        case 1
            amp = input('Enter scale value: ');
            if (amp~=0)
                yTemp = amp * yTemp;
            else
                disp('Scale value can not be 0 ... no change!');
            end
        case 2
            tTemp = -1 * tTemp;
        case 3
            shift = input('Enter required shift: ');
            tTemp = tTemp + shift;
        case 4
            expan = input('Enter expansion value: ');
            if (expan~=0)
                tTemp = expan * tTemp;
            else
                disp('Expansion value can not be 0 ... no change!');
            end
        case 5
            comp = input('Enter compression value: ');
            if (comp~=0)
                tTemp = tTemp/comp;
            else
                disp('Compression value can not be 0 ... no change!');
            end
    end
end

%plotting both original & modified signals side-by-side for comparison
subplot(1,2,1)
plot(tFinal,yFinal);
grid on; title('Before'); axis = gca;
axis.XAxisLocation = 'origin';
axis.YAxisLocation = 'origin';

subplot(1,2,2)
plot(tTemp,yTemp);
grid on; title('After'); axis = gca;
axis.XAxisLocation = 'origin';
axis.YAxisLocation = 'origin';