function generate_hdl()
hdlsetuptoolpath('ToolName', 'Xilinx Vivado', 'ToolPath', 'D:\Xilinx\Vivado\2022.1\bin\vivado.bat'); 
fixptcfg = coder.config('fixpt'); 
fixptcfg.TestBenchName = 'restrictedAdder2_tb' ; 
hdlcfg = coder.config('hdl'); 
hdlcfg.InstantiateFunctions = true; 
hdlcfg.TestBenchName = 'restrictedAdder2_tb' ; 
hdlcfg.TargetLanguage = 'VHDL'; 
hdlcfg.SimulateGeneratedCode = false; 
hdlcfg.GenerateHDLTestBench = true ; 
hdlcfg.SynthesizeGeneratedCode = true; 
hdlcfg.SynthesisTool = 'Xilinx Vivado'; 
hdlcfg.SynthesisToolChipFamily = 'Artix7' ; 
hdlcfg.SynthesisToolDeviceName = 'xc7a100t'; 
hdlcfg.SynthesisToolPackageName = 'csg324' ; 
hdlcfg.SynthesisToolSpeedValue = '-1' ; 
codegen  -config hdlcfg restrictedAdder2
end