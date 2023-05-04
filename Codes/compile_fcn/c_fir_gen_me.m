function [] = c_fir_gen_me(name,coeffs,type,isInline)
    coef_no = length(coeffs);
    symmetricity = coeff_symmetry_checker(coeffs);

    %Input Nodes
    input_nodes(1) = Node(sprintf('x'),0,1,@basic_buffer,{sprintf('x')},{'num'});
    %me
    switch(symmetricity)
        case 'even_symmetric'
            % Coefficients as input nodes
            for i=1:coef_no/2
                input_nodes(i+1) = Node(sprintf('h%d',i),0,1,@basic_buffer,{sprintf('h%d',i)},{'num'});
            end
            % Multiplication nodes
            for i = 1:coef_no/2
                MUL_nodes(i) = Node(sprintf('MUL_%d',i),2,1,@basic_mul,{sprintf('MUL_%d',i)},{'num'});
                MUL_nodes(i).setInline(isInline);
            end

        case 'odd_symmetric'
            for i=1:coef_no/2+1
                input_nodes(i+1) = Node(sprintf('h%d',i),0,1,@basic_buffer,{sprintf('h%d',i)},{'num'});
            end

            for i = 1:coef_no/2+1
                MUL_nodes(i) = Node(sprintf('MUL_%d',i),2,1,@basic_mul,{sprintf('MUL_%d',i)},{'num'});
                MUL_nodes(i).setInline(isInline);
            end 

        otherwise
            for i=1:coef_no
                input_nodes(i+1) = Node(sprintf('h%d',i),0,1,@basic_buffer,{sprintf('h%d',i)},{'num'});
            end

            for i = 1:coef_no
                MUL_nodes(i) = Node(sprintf('MUL_%d',i),2,1,@basic_mul,{sprintf('MUL_%d',i)},{'num'});
                MUL_nodes(i).setInline(isInline);
            end 
    end
    %%%

%     %Circuit Nodes
%         %Multiplication Nodes
%     for i = 1:coef_no
%         circuit_nodes(i) = Node(sprintf('MUL_%d',i),2,1,@basic_mul,{sprintf('MUL_%d',i)},{'num'});
%         circuit_nodes(i).setInline(isInline);
%     end

        %Addition Nodes
%     for i = 1:coef_no-1
%         circuit_nodes(i+coef_no) = Node(sprintf('ADD_%d',i),2,1,@basic_add,{sprintf('ADD_%d',i)},{'num'});
%         circuit_nodes(i+coef_no).setInline(isInline);
%     end

        %Addition Nodes
        for i = 1:coef_no-1
              ADD_nodes(i) = Node(sprintf('ADD_%d',i),2,1,@basic_add,{sprintf('ADD_%d',i)},{'num'});
              ADD_nodes(i).setInline(isInline);
        end
    %Output Node
    output_nodes = Node('y',1,0,@basic_buffer,{'y'},{'num'});

    %Connections
    switch(type)
        case 'direct'
            
               
            
                switch(symmetricity)
                    case 'even_symmetric'
                        %Input Connections
                        for i = 1:coef_no/2
                            Node.connect(input_nodes(1),1,ADD_nodes(i),1,i-1);
                            Node.connect(input_nodes(1),1,ADD_nodes(i),2,coef_no-i);
                        end
                            
                        for i = 1:coef_no/2
                            Node.connect(input_nodes(i+1),1,MUL_nodes(i),1,0);
                            Node.connect(ADD_nodes(i),1,MUL_nodes(i),2,0);
                        end
                            Node.connect(MUL_nodes(1),1,ADD_nodes(coef_no/2+1),1,0);
                        for i = (coef_no/2+1):coef_no-1
                            Node.connect(MUL_nodes(i-coef_no/2+1),1,ADD_nodes(i),2,0);
                        end
                        
                        for i = coef_no/2+1:coef_no-2
                            Node.connect(ADD_nodes(i),1,ADD_nodes(i+1),1,0);
                            
                        end
                        
                    case 'odd_symmetric'
                        %Input Connections
                        for i = 1:coef_no/2
                            Node.connect(input_nodes(1),1,ADD_nodes(i),1,i-1);
                            Node.connect(input_nodes(1),1,ADD_nodes(i),2,coef_no-i);
                        end
                            Node.connect(input_nodes(end),1,MUL_nodes(end),1,0);
                            Node.connect(input_nodes(1),1,MUL_nodes(end),2,floor(coef_no/2));
                        for i = 1:coef_no/2
                            Node.connect(input_nodes(i+1),1,MUL_nodes(i),1,0);
                            Node.connect(ADD_nodes(i),1,MUL_nodes(i),2,0);
                        end
                           
                        for i = ceil(coef_no/2):coef_no-1
                            Node.connect(MUL_nodes(i-ceil(coef_no/2)+2),1,ADD_nodes(i),2,0);
                        end
                            Node.connect(MUL_nodes(1),1,ADD_nodes(ceil(coef_no/2)),1,0);
                        for i = ceil(coef_no/2):coef_no-2
                            Node.connect(ADD_nodes(i),1,ADD_nodes(i+1),1,0);
                            
                        end

                    otherwise
                        for i = 1:coef_no
                            Node.connect(input_nodes(1),1,MUL_nodes(i),1,i-1);
                            Node.connect(input_nodes(i+1),1,MUL_nodes(i),2,0);
                        end
                        for i = 2:coef_no
                            Node.connect(MUL_nodes(i),1,ADD_nodes(i-1),2,0);
                        end
                            Node.connect(MUL_nodes(1),1,ADD_nodes(1),1,0);
                        for i = 1:coef_no-2
                            Node.connect(ADD_nodes(i),1,ADD_nodes(i+1),1,0);
                        end

                end
            
                      
            
           

        case 'transpose'
            
                  switch(symmetricity)
                    case 'even_symmetric'
                        for i = 1:coef_no/2
                            Node.connect(input_nodes(1),1,MUL_nodes(i),1,0);
                            Node.connect(input_nodes(i+1),1,MUL_nodes(i),2,0);                            
                        end
                            %Circuit Connections
                            Node.connect(MUL_nodes(1),1,ADD_nodes(1),1,1);
                        for i = 2:coef_no
                            if i<=coef_no/2
                                Node.connect(MUL_nodes(i),1,ADD_nodes(i-1),2,0);
                            else
                                Node.connect(MUL_nodes(coef_no-i+1),1,ADD_nodes(i-1),2,0);
                            end
                        end
                        for i = 1:coef_no-2
                            Node.connect(ADD_nodes(i),1,ADD_nodes(i+1),1,1);
                        end



                    case 'odd_symmetric'
                        for i = 1:coef_no/2+1
                            Node.connect(input_nodes(1),1,MUL_nodes(i),1,0);
                            Node.connect(input_nodes(i+1),1,MUL_nodes(i),2,0);                     
                        end
                        %Circuit Connections
                            Node.connect(MUL_nodes(1),1,ADD_nodes(1),1,1);
                        for i = 2:coef_no
                            if i<=coef_no/2
                                Node.connect(MUL_nodes(i),1,ADD_nodes(i-1),2,0);
                            else
                                Node.connect(MUL_nodes(coef_no-i+1),1,ADD_nodes(i-1),2,0);
                            end
                        end
                        for i = 1:coef_no-2
                            Node.connect(ADD_nodes(i),1,ADD_nodes(i+1),1,1);
                        end

                    otherwise
                        for i = 1:coef_no
                            Node.connect(input_nodes(1),1,MUL_nodes(i),1,0);                        
                            Node.connect(input_nodes(end-i+1),1,MUL_nodes(i),2,0);                     
                        end
                        %Circuit Connections
                            Node.connect(MUL_nodes(1),1,ADD_nodes(1),1,1);
                        for i = 2:coef_no
                            
                             Node.connect(MUL_nodes(i),1,ADD_nodes(i-1),2,0);
                            
                        end
                        for i = 1:coef_no-2
                            Node.connect(ADD_nodes(i),1,ADD_nodes(i+1),1,1);
                        end
                  end
            
            
        otherwise
            error('Undefined FIR type')
       
    end
    %Output Connections
    Node.connect(ADD_nodes(end),1,output_nodes(1),1,0);
    circuit_nodes = [MUL_nodes(:);ADD_nodes(:)];
    %Generating function
    gen_coder_fcn_me(name,input_nodes,circuit_nodes,output_nodes);
end