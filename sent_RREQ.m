function [S_Node,k] = sent_RREQ(S_Node,NoN,k)



while(1)
%%% �T���m�[�h�@�Ɓ@���ׂẴm�[�h�@���ׂĂ��
    for i = 1 : NoN
        if i ~= k  % equal point does not arrival.
            % k_RREQ sent i_RREQ 
            % by using (k's submit range) and (distance from i to k).
            
        %%% �p�P�b�g����������Ƃ��Ă��j�����邾���̃u���b�N�z�[���^�́C���Ă����Ȃ��̂Ƃ��Ȃ����ƍl�����炢���D
        %%% �m�[�h�����炵���̂ƁC�m�[�h�����̂܂܂��ׂ���悳�����D�����C�d�͏���ɂ��Ă͑��M�������ꂻ���ȋC�͂���D
        
           if sqrt( (S_Node(k(1)).line - S_Node(i).line)^2+(S_Node(k(1)).row - S_Node(i).row)^2 )<= S_Node(k(1)).range
                % (RREQ�̒������Z���ق������� && �����̃��[�g�������Ă��Ȃ�����) || (���������Ă��Ȃ�) 
                if (all(S_Node(i).RREQ ~= k(1)) && (length(S_Node(i).RREQ) > length(S_Node(k(1)).RREQ)+1)) || isempty(S_Node(i).RREQ) == 1
                    S_Node(i).RREQ = [S_Node(k(1)).RREQ k(1)];
                    k = [k i];
                end
           end
        end
    end
     k(1)=[];
     %%% �T������ꏊ���Ȃ��Ȃ�����I��
    if isempty(k) == 1 
           disp('RREQ messege not arrival Destination node');
            break;
    end
    
    %%% �s���m�[�h��������
      if S_Node(k(1)).attack == 1
    S_Node(k(1)).attack = 2;  %%% attack ��2�����������ɂ���
    disp('<<<<<<<<<<<<<<<fault>>>>>>>>>>>>>>>>');
    break;
      end    
    
    
     %%% ���������ۂ̂��̂ƈႤ�̂ŁC�ς��Ă����DRREP��������I���H
     if S_Node(NoN).RREQ > 0
         if all(S_Node(NoN).RREQ ~= NoN)  % �������CRREQ�̍Ō��NoN�l�����Ă���
           S_Node(NoN).RREQ = [S_Node(NoN).RREQ  NoN];     %%% ������ς����ق�������
         end
           disp('RREQ messege arrival Destination node.');
       break
     end
     
     
end

end
