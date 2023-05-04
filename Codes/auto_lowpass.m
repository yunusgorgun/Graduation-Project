function [auto_lowpass_out] = auto_lowpass(auto_lowpass_in)
	persistent auto_lowpass_in_reg_1 auto_lowpass_in_reg_2 auto_lowpass_in_reg_3 auto_lowpass_in_reg_4 auto_lowpass_in_reg_5 auto_lowpass_in_reg_6 auto_lowpass_in_reg_7 auto_lowpass_in_reg_8 auto_lowpass_in_reg_9;
	if (isempty(auto_lowpass_in_reg_1))
		 auto_lowpass_in_reg_1 = 0; auto_lowpass_in_reg_2 = 0; auto_lowpass_in_reg_3 = 0; auto_lowpass_in_reg_4 = 0; auto_lowpass_in_reg_5 = 0; auto_lowpass_in_reg_6 = 0; auto_lowpass_in_reg_7 = 0; auto_lowpass_in_reg_8 = 0; auto_lowpass_in_reg_9 = 0;
	end

	auto_lowpass_mul_1=0*auto_lowpass_in;
	auto_lowpass_mul_2=3.125000e-02*auto_lowpass_in_reg_1;
	auto_lowpass_mul_3=1.406250e-01*auto_lowpass_in_reg_2;
	auto_lowpass_mul_4=2.968750e-01*auto_lowpass_in_reg_3;
	auto_lowpass_mul_5=4.218750e-01*auto_lowpass_in_reg_4;
	auto_lowpass_mul_6=4.218750e-01*auto_lowpass_in_reg_5;
	auto_lowpass_mul_7=2.968750e-01*auto_lowpass_in_reg_6;
	auto_lowpass_mul_8=1.406250e-01*auto_lowpass_in_reg_7;
	auto_lowpass_mul_9=3.125000e-02*auto_lowpass_in_reg_8;
	auto_lowpass_mul_10=0*auto_lowpass_in_reg_9;
	auto_lowpass_add_1=auto_lowpass_mul_1+auto_lowpass_mul_2;
	auto_lowpass_add_2=auto_lowpass_mul_3+auto_lowpass_add_1;
	auto_lowpass_add_3=auto_lowpass_mul_4+auto_lowpass_add_2;
	auto_lowpass_add_4=auto_lowpass_mul_5+auto_lowpass_add_3;
	auto_lowpass_add_5=auto_lowpass_mul_6+auto_lowpass_add_4;
	auto_lowpass_add_6=auto_lowpass_mul_7+auto_lowpass_add_5;
	auto_lowpass_add_7=auto_lowpass_mul_8+auto_lowpass_add_6;
	auto_lowpass_add_8=auto_lowpass_mul_9+auto_lowpass_add_7;
	auto_lowpass_add_9=auto_lowpass_mul_10+auto_lowpass_add_8;

	auto_lowpass_out = auto_lowpass_add_9;

	auto_lowpass_in_reg_9 = auto_lowpass_in_reg_8;
	auto_lowpass_in_reg_8 = auto_lowpass_in_reg_7;
	auto_lowpass_in_reg_7 = auto_lowpass_in_reg_6;
	auto_lowpass_in_reg_6 = auto_lowpass_in_reg_5;
	auto_lowpass_in_reg_5 = auto_lowpass_in_reg_4;
	auto_lowpass_in_reg_4 = auto_lowpass_in_reg_3;
	auto_lowpass_in_reg_3 = auto_lowpass_in_reg_2;
	auto_lowpass_in_reg_2 = auto_lowpass_in_reg_1;
	auto_lowpass_in_reg_1 = auto_lowpass_in;
end