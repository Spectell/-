%%% This program-code may be unfinished.
% use RREQ and RREP,RERR,ACK 
clear
clf

%%% �����Ōo�H���o�����쐬����
T = 1; %%% �o�H���o��
success = 0; %%% �o�H���o�̐�����
plusNumber = 1; %%% �����Ă����[����

for s = 1:plusNumber
disp("s");
for i = 1:T
   clf

%%%%%%%%%%%%%%%%%%%%%%%%%%% Rewritable %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
E = 1000;         % Range of enviroment
NoN = 15;        % Number of node
attack_NoN = 0; % �P���s���m�[�h�̌�
R = 250;          % Submit range of node

%%%�@���́@k�@�Ɓ@j�@�����Ԃ݂����Ȃ��́i���ۂɂ͓����X�V�͎����ł��Ă��Ȃ��j
%%% k�́@RREQ���ł̎󂯓n���́@�D�揇�ʁ@���i�[����
%%% j�́@RREP���ł̎󂯓n���́@�D�揇�ʁ@���i�[����
k = 1;                 % RREQ start at node(1):Source node
j = NoN;               % RREP start at node(NoN):Distance node
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



    S_Node = status_and_disp(E,R,NoN,attack_NoN); % (Decide status of node) and (Disp node)

    for j = 1:1

        if isempty(k) == 1
            break
        end
    
    [S_Node,k] = sent_RREQ(S_Node,NoN,k);  % sent RREQ(:hello messeage)

    %%%�@�s���m�[�h�ɓn�������_�ŁC�I������
    if ~(isempty(k) == 1)
        if S_Node(k(1)).attack == 2
            break
        end
    end
    
    S_Node = sent_RREP(S_Node,NoN);  % sent RREP

    %%% �����񐔂𐔂��Ă���
    if S_Node(1).RREP > 0
       success = success + 1; 
    end
    
    
    end

end
%%% A���O���t�ɂ����炢��
A(s) = (success / T) * 100;
success = 0;

end

%%%�@�������ԃm�[�h���V�����o�H��ێ����Ă����
%%%  ���M��̑����RREP���b�Z�[�W��Ԃ��悤�ɂȂ��Ă���


