% IO Nodes
x = Node('x',0,1,@basic_buffer,{'x'},{'num'});
h0 = Node('h0',0,1,@basic_buffer,{'h0'},{'num'});
h1 = Node('h1',0,1,@basic_buffer,{'h1'},{'num'});
h2 = Node('h2',0,1,@basic_buffer,{'h2'},{'num'});
h3 = Node('h3',0,1,@basic_buffer,{'h3'},{'num'});
h4 = Node('h4',0,1,@basic_buffer,{'h4'},{'num'});
% h4 = Node('h4',0,1,@basic_buffer,{'h4'},{'num'});
% h3 = Node('h3',0,1,@basic_buffer,{'h3'},{'num'});
% h2 = Node('h2',0,1,@basic_buffer,{'h2'},{'num'});
% h1 = Node('h1',0,1,@basic_buffer,{'h1'},{'num'});
% h0 = Node('h0',0,1,@basic_buffer,{'h0'},{'num'});
y = Node('y',1,0,@basic_buffer,{'y'},{'num'});

% Circuit Nodes

%Multiplication Nodes
N1 = Node('N1',2,1,@basic_mul,{'N1_mul'},{'num'});
N2 = Node('N2',2,1,@basic_mul,{'N2_mul'},{'num'});
N3 = Node('N3',2,1,@basic_mul,{'N3_mul'},{'num'});
N4 = Node('N4',2,1,@basic_mul,{'N4_mul'},{'num'});
N5 = Node('N5',2,1,@basic_mul,{'N5_mul'},{'num'});
N6 = Node('N6',2,1,@basic_mul,{'N6_mul'},{'num'});
N7 = Node('N7',2,1,@basic_mul,{'N7_mul'},{'num'});
N8 = Node('N8',2,1,@basic_mul,{'N8_mul'},{'num'});
N9 = Node('N9',2,1,@basic_mul,{'N9_mul'},{'num'});
N10 = Node('N10',2,1,@basic_mul,{'N10_mul'},{'num'});

%Addition Nodes
N11 = Node('N11',2,1,@basic_add,{'N11_mul'},{'num'});
N12 = Node('N12',2,1,@basic_add,{'N12_mul'},{'num'});
N13 = Node('N13',2,1,@basic_add,{'N13_mul'},{'num'});
N14 = Node('N14',2,1,@basic_add,{'N14_mul'},{'num'});
N15 = Node('N15',2,1,@basic_add,{'N15_mul'},{'num'});
N16 = Node('N16',2,1,@basic_add,{'N16_mul'},{'num'});
N17 = Node('N17',2,1,@basic_add,{'N17_mul'},{'num'});
N18 = Node('N18',2,1,@basic_add,{'N18_mul'},{'num'});
N19 = Node('N19',2,1,@basic_add,{'N19_mul'},{'num'});

% Connections

% Input to Multiplication
Node.connect(x,1,N1,1,0);
Node.connect(h0,1,N1,2,0);

Node.connect(x,1,N2,1,1);
Node.connect(h1,1,N2,2,0);

Node.connect(x,1,N3,1,2);
Node.connect(h2,1,N3,2,0);

Node.connect(x,1,N4,1,3);
Node.connect(h3,1,N4,2,0);

Node.connect(x,1,N5,1,4);
Node.connect(h4,1,N5,2,0);

Node.connect(x,1,N6,1,5);
Node.connect(h4,1,N6,2,0);

Node.connect(x,1,N7,1,6);
Node.connect(h3,1,N7,2,0);

Node.connect(x,1,N8,1,7);
Node.connect(h2,1,N8,2,0);

Node.connect(x,1,N9,1,8);
Node.connect(h1,1,N9,2,0);

Node.connect(x,1,N10,1,9);
Node.connect(h0,1,N10,2,0);


%Multiplication to Addition
Node.connect(N1,1,N11,1,0);
Node.connect(N2,1,N11,2,0);

Node.connect(N3,1,N12,1,0);
Node.connect(N11,1,N12,2,0);

Node.connect(N4,1,N13,1,0);
Node.connect(N12,1,N13,2,0);

Node.connect(N5,1,N14,1,0);
Node.connect(N13,1,N14,2,0);

Node.connect(N6,1,N15,1,0);
Node.connect(N14,1,N15,2,0);

Node.connect(N7,1,N16,1,0);
Node.connect(N15,1,N16,2,0);

Node.connect(N8,1,N17,1,0);
Node.connect(N16,1,N17,2,0);

Node.connect(N9,1,N18,1,0);
Node.connect(N17,1,N18,2,0);

Node.connect(N10,1,N19,1,0);
Node.connect(N18,1,N19,2,0);

Node.connect(N19,1,y,1,0);

% Circuit Definition

coeffs = [h0,h1,h2,h3,h4];
input_nodes = [x,h0,h1,h2,h3,h4];
output_nodes = y;
circuit_nodes = [N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,N15,N16,N17,N18,N19];

% Code Generation
gen_coder_fcn_changed('direct_form_lowpass25khz', input_nodes, circuit_nodes,output_nodes,coeffs);



