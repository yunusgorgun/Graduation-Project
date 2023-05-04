function create_generate_hdl(name)

fileID = fopen("generate_hdl.m",'w');

fprintf(fileID,"function generate_hdl()"...
+"\nhdlsetuptoolpath('ToolName', 'Xilinx Vivado', 'ToolPath', 'D:\\Xilinx\\Vivado\\2022.1\\bin\\vivado.bat'); " ...
+"\nfixptcfg = coder.config('fixpt'); " ...
+"\nfixptcfg.TestBenchName = '%s_tb' ; " ...
+"\nhdlcfg = coder.config('hdl'); " ...
+"\nhdlcfg.InstantiateFunctions = true; " ...
+"\nhdlcfg.TestBenchName = '%s_tb' ; " ...
+"\nhdlcfg.TargetLanguage = 'VHDL'; " ...
+"\nhdlcfg.SimulateGeneratedCode = false; " ...
+"\nhdlcfg.GenerateHDLTestBench = true ; " ...
+"\nhdlcfg.SynthesizeGeneratedCode = true; " ...
+"\nhdlcfg.SynthesisTool = 'Xilinx Vivado'; " ...
+"\nhdlcfg.SynthesisToolChipFamily = 'Artix7' ; " ...
+"\nhdlcfg.SynthesisToolDeviceName = 'xc7a100t'; " ...
+"\nhdlcfg.SynthesisToolPackageName = 'csg324' ; " ...
+"\nhdlcfg.SynthesisToolSpeedValue = '-1' ; " ... 
+"\ncodegen  -config hdlcfg %s" ...
+"\nend",name,name,name);
%+"\nweb('codegen/%s/hdlsrc/resource_report.html','-new','-notoolbar')" ...
%+"\nweb('codegen/%s/hdlsrc/lastFilter_hdl_conformance_report.html','-new','-notoolbar') " ...
% +"\nhdlcfg.SimulationTool = 'ModelSim'; " ...-float2fixed fixptcfg

fclose(fileID);

end