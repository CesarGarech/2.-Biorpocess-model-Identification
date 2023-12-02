function biofedbatch_PP(block)

setup(block);

function setup(block)

% Register number of ports
block.NumInputPorts  = 1;
block.NumOutputPorts = 1;


block.NumDialogPrms=4;

% Setup port properties to be inherited or dynamic
block.SetPreCompInpPortInfoToDynamic;
block.SetPreCompOutPortInfoToDynamic;

% Override input port properties
block.InputPort(1).Dimensions        = 4;
block.InputPort(1).DatatypeID  = 0;  % double
block.InputPort(1).Complexity  = 'Real';
% block.InputPort(1).DirectFeedthrough = true;
block.InputPort(1).SamplingMode ='Sample';

% Override output port properties
block.OutputPort(1).Dimensions       = 4;
block.OutputPort(1).SamplingMode ='Sample';
block.OutputPort(1).DatatypeID  = 0; % double
block.OutputPort(1).Complexity  = 'Real';

block.SampleTimes = [0 0];
block.NumContStates=4;

block.SimStateCompliance = 'DefaultSimState';

% block.RegBlockMethod('PostPropagationSetup',    @DoPostPropSetup);
block.RegBlockMethod('InitializeConditions', @InitializeConditions);
% block.RegBlockMethod('Start', @Start);
block.RegBlockMethod('Outputs', @Outputs);     % Required
% block.RegBlockMethod('Update', @Update);
block.RegBlockMethod('Derivatives', @Derivatives);
block.RegBlockMethod('Terminate', @Terminate); % Required

function InitializeConditions(block)

for k=1:4
    block.ContStates.Data(k)=block.DialogPrm(k).Data;
end

function Outputs(block)

for k=1:4
    block.OutputPort(1).Data(k) =block.ContStates.Data(k);
end

function Derivatives(block)
u1=block.InputPort(1).Data(1);
u2=block.InputPort(1).Data(2);
u3=block.InputPort(1).Data(3);
u4=block.InputPort(1).Data(4);
x=block.ContStates.Data;


dy=Modelo_loteal(x,u1,u2,u3,u4);

block.Derivatives.Data=dy;

function Terminate(~)

