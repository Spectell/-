%%% This program-code may be unfinished.
% use RREQ and RREP,RERR,ACK 
clear
clf

%%% Rewritable %%%%%%%%%%%%%%%%%%%%%%%%%%
E = 10;         % Range of enviroment
NoN = 8;        % Number of node 
R = 5;          % Submit range of node

attack_node = 1; % �s���m�[�h

%%%�@���́@k�@�Ɓ@j�@�����Ԃ݂����Ȃ��́i���ۂɂ͓����X�V�͎����ł��Ă��Ȃ��j
%%% k�́@RREQ���ł̎󂯓n���́@�D�揇�ʁ@���i�[����
%%% j�́@RREP���ł̎󂯓n���́@�D�揇�ʁ@���i�[����
k = 1;                 % RREQ start at node(1):Source node
j = NoN;               % RREP start at node(NoN):Distance node
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

S_Node = status_and_disp(E,R,NoN); % (Decide status of node) and (Disp node)

for i = 1:1

S_Node = sent_RREQ(S_Node,NoN,k);  % sent RREQ(:hello messeage)

S_Node = sent_RREP(S_Node,NoN,j);  % sent RREP

end

%%%�@�s���m�[�h����ꂽ�ꍇ�̃v���O���������Ă�������
%%%  RREQ������C������RREP��Ԃ�

%%%%%%%%%%%%%%%%%%%%%%%%�@���Ȃ� %%%%%%%%%%%%%%%%%%%%%%%%%%
%%% ���������Ă�������
%%% ���[�e�B���O�\�z���A�\�z��Ƀ����_���� + �ړ�������C���[�W
%%% RREP�̃��b�Z�[�W�@���T�����Ă��瑗�銴���Ȃ̂�
%%% ����Ƃ����j�L���X�g�ő��邩��Anode�w��݂̂ł�����̂��C�ɂȂ�


