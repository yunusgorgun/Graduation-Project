function [] = c_fir_gen(name,coeffs,type,isInline)
    coef_no = length(coeffs);
    symmetricity = coeff_symmetry_checker(coeffs);

    %Input Nodes
    input_nodes(1) = Node(sprintf('x'),0,1,@basic_buffer,{sprintf('x')},{'num'});
    %me
    switch(symmetricity)
        case 'even_symmetric'
            for i=1:coef_no/2
                input_nodes(i+1) = Node(sprintf('h%d',i),0,1,@basic_buffer,{sprintf('h%d',i)},{'num'});
            end
        case 'odd_symmetric'
            for i=1:coef_no/2+1
                input_nodes(i+1) = Node(sprintf('h%d',i),0,1,@basic_buffer,{sprintf('h%d',i)},{'num'});
            end
        otherwise
            for i=1:coef_no
                input_nodes(i+1) = Node(sprintf('h%d',i),0,1,@basic_buffer,{sprintf('h%d',i)},{'num'});
            end
    end
    %%%

    %Circuit Nodes
        %Multiplication Nodes
    for i = 1:coef_no
        circuit_nodes(i) = Node(sprintf('MUL_%d',i),2,1,@basic_mul,{sprintf('MUL_%d',i)},{'num'});
        circuit_nodes(i).setInline(isInline);
    end

        %Addition Nodes
    for i = 1:coef_no-1
        circuit_nodes(i+coef_no) = Node(sprintf('ADD_%d',i),2,1,@basic_add,{sprintf('ADD_%d',i)},{'num'});
        circuit_nodes(i+coef_no).setInline(isInline);
    end

    %Output Node
    output_nodes = Node('y',1,0,@basic_buffer,{'y'},{'num'});

    %Connections
    switch(type)
        case 'direct'
            %Input Connections
            for i = 1:coef_no
                Node.connect(input_nodes(1),1,circuit_nodes(i),1,i-1);
                %c_node = Node(sprintf('h_%d',i),1,1,@basic_buffer,{sprintf('h_%d',i)},{'num'});%me
                % me,symmetric connection of coefficients
                switch(symmetricity)
                    case 'even_symmetric'
                        if i<=coef_no/2
                            Node.connect(input_nodes(i+1),1,circuit_nodes(i),2,0);
                        else
                            Node.connect(input_nodes(coef_no-i+2),1,circuit_nodes(i),2,0);
                        end
                    case 'odd_symmetric'
                        if i<=coef_no/2+1
                            Node.connect(input_nodes(i+1),1,circuit_nodes(i),2,0);                     
                        else
                            Node.connect(input_nodes(coef_no-i+2),1,circuit_nodes(i),2,0);
                        end
                    otherwise
                        if i<=coef_no
                            Node.connect(input_nodes(i+1),1,circuit_nodes(i),2,0);                    
                        end
                end
            end
            
            %Circuit Connections
            Node.connect(circuit_nodes(1),1,circuit_nodes(coef_no+1),1,0);
            Node.connect(circuit_nodes(2),1,circuit_nodes(coef_no+1),2,0);
            for i = 1:coef_no-2
                Node.connect(circuit_nodes(i+2),1,circuit_nodes(i+coef_no+1),1,0);
                Node.connect(circuit_nodes(i+coef_no),1,circuit_nodes(i+coef_no+1),2,0);
            end
            
            %Output Connections
            Node.connect(circuit_nodes(end),1,output_nodes(1),1,0);
        case 'transpose'
            %Input Connections
            for i = 1:coef_no
                Node.connect(input_nodes(1),1,circuit_nodes(i),1,0);
                %c_node = Node(sprintf('%d',coeffs(end-i+1)),1,1,@basic_buffer,{sprintf('%d',coeffs(i))},{'num'});
%                 c_node = Node(sprintf('%s',coef_no-i+1),1,1,@basic_buffer,{sprintf('%d',coeffs(i))},{'num'});
%                 Node.connect(c_node,1,circuit_nodes(i),2,0);
                  switch(symmetricity)
                    case 'even_symmetric'
                           if i<=coef_no/2
                                Node.connect(input_nodes(i+1),1,circuit_nodes(i),2,0);
                            else
                                Node.connect(input_nodes(coef_no-i+2),1,circuit_nodes(i),2,0);
                            end
                    case 'odd_symmetric'
                        if i<=coef_no/2+1
                            Node.connect(input_nodes(i+1),1,circuit_nodes(i),2,0);                     
                        else
                            Node.connect(input_nodes(coef_no-i+2),1,circuit_nodes(i),2,0);
                        end
                    otherwise
                        
                            Node.connect(input_nodes(end-i+1),1,circuit_nodes(i),2,0);                     
                        
                 end
            end
            
            %Circuit Connections
            Node.connect(circuit_nodes(1),1,circuit_nodes(coef_no+1),1,1);
            for i = 2:coef_no
                Node.connect(circuit_nodes(i),1,circuit_nodes(coef_no+i-1),2,0);
            end

            for i = 1:coef_no-2
                Node.connect(circuit_nodes(coef_no+i),1,circuit_nodes(coef_no+i+1),1,1);
            end
            
            %Output Connections
            Node.connect(circuit_nodes(end),1,output_nodes(1),1,0);
        otherwise
            error('Undefined FIR type')
    end

    %Generating function
    gen_coder_fcn_inline(name,input_nodes,circuit_nodes,output_nodes,symmetricity);
end