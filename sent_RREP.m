function S_Node = sent_RREP(S_Node,NoN)

j = NoN;

%%% If Destination-node have RREQ,
   if S_Node(NoN).RREQ > 0        
    
      %%% RREQ of destination-node shift RREP of destination-node.
        S_Node(NoN).RREP = fliplr(S_Node(NoN).RREQ);

      while(1)
  
      %%% find�Ł@����RREP�z��ƂȂ�@��@��T��
        x = find(S_Node(j).RREP == S_Node(j).number)+1;
      %%% ����x�Ł@����RREP�z��́@�������̂�������
        y = S_Node(j).RREP(x);
        S_Node(y).RREP = S_Node(j).RREP;
        j = y;
        
        if isempty(j) == 1 
            disp('RREP messege not arrival Destination node');
                break;
        else if S_Node(1).RREP > 0
                        D = fliplr(S_Node(1).RREP);
                        disp('RREP messege arrival Source node.');
                        disp(D);
                        break;
            end
        
        end      
  
      end

   end