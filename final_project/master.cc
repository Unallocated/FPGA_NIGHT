#include <freehdl/kernel.h>
#include <freehdl/std.h>


/* External declarations */
/* Definitions for enumeration type :IEEE:std_logic_1164:std_ulogic */
class L4ieee_Q14std_logic_1164_I10std_ulogic:public enum_info_base{
   static const char *values[];
public:
   L4ieee_Q14std_logic_1164_I10std_ulogic():enum_info_base(0,8,values) {};
   static const char **get_values() { return values; }
   static int low() { return 0; }
   static int high() { return 8; }
   static int left() { return 0; }
   static int right() { return 8; }
};
extern L4ieee_Q14std_logic_1164_I10std_ulogic L4ieee_Q14std_logic_1164_I10std_ulogic_INFO;
/** Enumeration info class :IEEE:std_logic_1164:std_logic */
class L4ieee_Q14std_logic_1164_I9std_logic:public enum_info_base{
   static const char **values;
public:
   L4ieee_Q14std_logic_1164_I9std_logic():enum_info_base(0,8,values) {};
   static const char **get_values() { return values; }
   static int low() { return 0; }
   static int high() { return 8; }
   static int left() { return 0; }
   static int right() { return 8; }
};
extern L4ieee_Q14std_logic_1164_I9std_logic L4ieee_Q14std_logic_1164_I9std_logic_INFO;
extern array_info L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO;
#define L4ieee_Q14std_logic_1164_T16std_logic_vector array_type<enumeration >
#define L4ieee_Q14std_logic_1164_I16std_logic_vector array_info

/* End of external declarations */
extern array_info L4work_E6master_I3_t0_INFO;
#define L4work_E6master_T3_t0 array_type<enumeration >
#define L4work_E6master_I3_t0 array_info

extern array_info L4work_E6master_I3_t1_INFO;
#define L4work_E6master_T3_t1 array_type<enumeration >
#define L4work_E6master_I3_t1 array_info

extern array_info L4work_E6master_I3_t2_INFO;
#define L4work_E6master_T3_t2 array_type<enumeration >
#define L4work_E6master_I3_t2 array_info

extern array_info L4work_E6master_I3_t3_INFO;
#define L4work_E6master_T3_t3 array_type<enumeration >
#define L4work_E6master_I3_t3 array_info

extern array_info L4work_E6master_I3_t4_INFO;
#define L4work_E6master_T3_t4 array_type<enumeration >
#define L4work_E6master_I3_t4 array_info

extern array_info L4work_E6master_I3_t5_INFO;
#define L4work_E6master_T3_t5 array_type<enumeration >
#define L4work_E6master_I3_t5 array_info

/* Entity class declaration */
class L4work_E6master {
public:
   void *father_component;
  L4work_E6master (name_stack &iname, map_list *mlist, void *father);
  ~L4work_E6master() {};
  sig_info<enumeration> *L4work_E6master_S3clk,*L4work_E6master_S3rst;
  sig_info<L4work_E6master_T3_t0> *L4work_E6master_S6adc_in;
  sig_info<enumeration> *L4work_E6master_S7adc_clk;
  sig_info<L4work_E6master_T3_t1> *L4work_E6master_S4leds;
  sig_info<L4work_E6master_T3_t2> *L4work_E6master_S8sine_out;
  sig_info<enumeration> *L4work_E6master_S2rx,*L4work_E6master_S2hs,*L4work_E6master_S2vs;
  sig_info<L4work_E6master_T3_t3> *L4work_E6master_S5green;
  sig_info<L4work_E6master_T3_t4> *L4work_E6master_S3red;
  sig_info<L4work_E6master_T3_t5> *L4work_E6master_S4blue;
};

L4work_E6master_I3_t0 L4work_E6master_I3_t0_INFO;
L4work_E6master_I3_t1 L4work_E6master_I3_t1_INFO;
L4work_E6master_I3_t2 L4work_E6master_I3_t2_INFO;
L4work_E6master_I3_t3 L4work_E6master_I3_t3_INFO;
L4work_E6master_I3_t4 L4work_E6master_I3_t4_INFO;
L4work_E6master_I3_t5 L4work_E6master_I3_t5_INFO;
/* Implementation of entity methods */
L4work_E6master::
L4work_E6master(name_stack &iname, map_list *mlist, void *father) {
    father_component = father;
    iname.push("");
    L4work_E6master_S3clk=new sig_info<enumeration>(iname,":clk",":work:master",mlist,(&L4ieee_Q14std_logic_1164_I9std_logic_INFO),vIN,this);
    L4work_E6master_S3rst=new sig_info<enumeration>(iname,":rst",":work:master",mlist,(&L4ieee_Q14std_logic_1164_I9std_logic_INFO),vIN,this);
    L4work_E6master_S6adc_in=new sig_info<L4work_E6master_T3_t0>(iname,":adc_in",":work:master",mlist,(&L4work_E6master_I3_t0_INFO),vIN,this);
    L4work_E6master_S7adc_clk=new sig_info<enumeration>(iname,":adc_clk",":work:master",mlist,(&L4ieee_Q14std_logic_1164_I9std_logic_INFO),vOUT,this);
    L4work_E6master_S4leds=new sig_info<L4work_E6master_T3_t1>(iname,":leds",":work:master",mlist,(&L4work_E6master_I3_t1_INFO),vOUT,this);
    L4work_E6master_S8sine_out=new sig_info<L4work_E6master_T3_t2>(iname,":sine_out",":work:master",mlist,(&L4work_E6master_I3_t2_INFO),vOUT,this);
    L4work_E6master_S2rx=new sig_info<enumeration>(iname,":rx",":work:master",mlist,(&L4ieee_Q14std_logic_1164_I9std_logic_INFO),vIN,this);
    L4work_E6master_S2hs=new sig_info<enumeration>(iname,":hs",":work:master",mlist,(&L4ieee_Q14std_logic_1164_I9std_logic_INFO),vOUT,this);
    L4work_E6master_S2vs=new sig_info<enumeration>(iname,":vs",":work:master",mlist,(&L4ieee_Q14std_logic_1164_I9std_logic_INFO),vOUT,this);
    L4work_E6master_S5green=new sig_info<L4work_E6master_T3_t3>(iname,":green",":work:master",mlist,(&L4work_E6master_I3_t3_INFO),vOUT,this);
    L4work_E6master_S3red=new sig_info<L4work_E6master_T3_t4>(iname,":red",":work:master",mlist,(&L4work_E6master_I3_t4_INFO),vOUT,this);
    L4work_E6master_S4blue=new sig_info<L4work_E6master_T3_t5>(iname,":blue",":work:master",mlist,(&L4work_E6master_I3_t5_INFO),vOUT,this);
    iname.pop();
};


/* Initialization function for entity :work:master */
int L3std_Q8standard_init ();
int L4ieee_Q11numeric_std_init ();
int L4ieee_Q14std_logic_1164_init ();
bool L4work_E6master_init_done = false;
int L4work_E6master_init(){
if (L4work_E6master_init_done) return 1;
L4work_E6master_init_done=true;
L3std_Q8standard_init ();
L4ieee_Q11numeric_std_init ();
L4ieee_Q14std_logic_1164_init ();
register_source_file("/home/main/FPGA_NIGHT/final_project/master.vhd","master.vhd");
name_stack iname;
iname.push("");
L4work_E6master_I3_t0_INFO.set((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->element_type,parray_info((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO))->index_type,7,downto,0,-1).register_type(":work:master",":work:master:_t0",":_t0",NULL);
L4work_E6master_I3_t1_INFO.set((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->element_type,parray_info((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO))->index_type,7,downto,0,-1).register_type(":work:master",":work:master:_t1",":_t1",NULL);
L4work_E6master_I3_t2_INFO.set((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->element_type,parray_info((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO))->index_type,7,downto,0,-1).register_type(":work:master",":work:master:_t2",":_t2",NULL);
L4work_E6master_I3_t3_INFO.set((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->element_type,parray_info((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO))->index_type,2,downto,0,-1).register_type(":work:master",":work:master:_t3",":_t3",NULL);
L4work_E6master_I3_t4_INFO.set((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->element_type,parray_info((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO))->index_type,2,downto,0,-1).register_type(":work:master",":work:master:_t4",":_t4",NULL);
L4work_E6master_I3_t5_INFO.set((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->element_type,parray_info((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO))->index_type,1,downto,0,-1).register_type(":work:master",":work:master:_t5",":_t5",NULL);
iname.pop();
return 1;
}

/* end of L4work_E6master Entity */
/* External declarations */
/* Prototype for predefined function :IEEE:std_logic_1164:"&" */
extern array_info L4ieee_Q11numeric_std_I8unsigned_INFO;
#define L4ieee_Q11numeric_std_T8unsigned array_type<enumeration >
#define L4ieee_Q11numeric_std_I8unsigned array_info

/* Prototype for subprogram :IEEE:numeric_std:to_integer */
integer L4ieee_Q11numeric_std_Y10to_integer_i279(const L4ieee_Q11numeric_std_T8unsigned &);
/* Prototype for subprogram :IEEE:numeric_std:to_unsigned */
L4ieee_Q11numeric_std_T8unsigned L4ieee_Q11numeric_std_Y11to_unsigned_i284(const integer ,const integer );
/* Prototype for subprogram :IEEE:std_logic_1164:rising_edge */
enumeration L4ieee_Q14std_logic_1164_Y11rising_edge_i156(sig_info<enumeration> *,enumeration *);
/* No header for IIR_EnumerationLiteral */
/* Prototype for predefined function :IEEE:std_logic_1164:"=" */
/* No header for IIR_EnumerationLiteral */
/* End of external declarations */
extern array_info L4work_E6master_A10behavioral_I3_t6_INFO;
#define L4work_E6master_A10behavioral_T3_t6 array_type<enumeration >
#define L4work_E6master_A10behavioral_I3_t6 array_info

extern array_info L4work_E6master_A10behavioral_I3_t7_INFO;
#define L4work_E6master_A10behavioral_T3_t7 array_type<enumeration >
#define L4work_E6master_A10behavioral_I3_t7 array_info

extern array_info L4work_E6master_A10behavioral_I3_t8_INFO;
#define L4work_E6master_A10behavioral_T3_t8 array_type<enumeration >
#define L4work_E6master_A10behavioral_I3_t8 array_info

extern array_info L4work_E6master_A10behavioral_I3_t9_INFO;
#define L4work_E6master_A10behavioral_T3_t9 array_type<enumeration >
#define L4work_E6master_A10behavioral_I3_t9 array_info

extern array_info L4work_E6master_A10behavioral_I4_t10_INFO;
#define L4work_E6master_A10behavioral_T4_t10 array_type<enumeration >
#define L4work_E6master_A10behavioral_I4_t10 array_info

extern array_info L4work_E6master_A10behavioral_I4_t11_INFO;
#define L4work_E6master_A10behavioral_T4_t11 array_type<enumeration >
#define L4work_E6master_A10behavioral_I4_t11 array_info

extern array_info L4work_E6master_A10behavioral_I4_t12_INFO;
#define L4work_E6master_A10behavioral_T4_t12 array_type<enumeration >
#define L4work_E6master_A10behavioral_I4_t12 array_info

extern array_info L4work_E6master_A10behavioral_I4_t13_INFO;
#define L4work_E6master_A10behavioral_T4_t13 array_type<enumeration >
#define L4work_E6master_A10behavioral_I4_t13 array_info

extern array_info L4work_E6master_A10behavioral_I4_t16_INFO;
#define L4work_E6master_A10behavioral_T4_t16 array_type<enumeration >
#define L4work_E6master_A10behavioral_I4_t16 array_info

/* Definitions for enumeration type :work:master(behavioral):adc_state_t */
class L4work_E6master_A10behavioral_I11adc_state_t:public enum_info_base{
   static const char *values[];
public:
   L4work_E6master_A10behavioral_I11adc_state_t():enum_info_base(0,1,values) {};
   static const char **get_values() { return values; }
   static int low() { return 0; }
   static int high() { return 1; }
   static int left() { return 0; }
   static int right() { return 1; }
};
extern L4work_E6master_A10behavioral_I11adc_state_t L4work_E6master_A10behavioral_I11adc_state_t_INFO;
/* Definitions for enumeration type :work:master(behavioral):fft_state_t */
class L4work_E6master_A10behavioral_I11fft_state_t:public enum_info_base{
   static const char *values[];
public:
   L4work_E6master_A10behavioral_I11fft_state_t():enum_info_base(0,4,values) {};
   static const char **get_values() { return values; }
   static int low() { return 0; }
   static int high() { return 4; }
   static int left() { return 0; }
   static int right() { return 4; }
};
extern L4work_E6master_A10behavioral_I11fft_state_t L4work_E6master_A10behavioral_I11fft_state_t_INFO;
#define L4work_E6master_A10behavioral_T4_t14 array_type<enumeration >
#define L4work_E6master_A10behavioral_I4_t14 array_info

#define L4work_E6master_A10behavioral_T4_t15 array_type<enumeration >
#define L4work_E6master_A10behavioral_I4_t15 array_info

#define L4work_E6master_A10behavioral_T4_t17 array_type<enumeration >
#define L4work_E6master_A10behavioral_I4_t17 array_info

#define L4work_E6master_A10behavioral_T4_t18 array_type<enumeration >
#define L4work_E6master_A10behavioral_I4_t18 array_info

#define L4work_E6master_A10behavioral_T4_t19 array_type<enumeration >
#define L4work_E6master_A10behavioral_I4_t19 array_info

/* Architecture class declaration */
class L4work_E6master_A10behavioral : public L4work_E6master {
public:
  L4work_E6master_A10behavioral (name_stack &iname, map_list *mlist, void *father, int level);
  ~L4work_E6master_A10behavioral();
  sig_info<enumeration> *L4work_E6master_A10behavioral_S7vga_clk;
  sig_info<L4work_E6master_A10behavioral_T3_t6> *L4work_E6master_A10behavioral_S11sine_buffer;
  sig_info<L4work_E6master_A10behavioral_T3_t7> *L4work_E6master_A10behavioral_S9phase_inc;
  sig_info<enumeration> *L4work_E6master_A10behavioral_S12buffered_clk,*L4work_E6master_A10behavioral_S7dds_clk,*L4work_E6master_A10behavioral_S18adc_fifo_prog_full,*L4work_E6master_A10behavioral_S14adc_fifo_empty,*L4work_E6master_A10behavioral_S14adc_fifo_rd_en,*L4work_E6master_A10behavioral_S14adc_fifo_wr_en;
  sig_info<L4work_E6master_A10behavioral_T3_t8> *L4work_E6master_A10behavioral_S17adc_fifo_data_out;
  sig_info<enumeration> *L4work_E6master_A10behavioral_S6fft_dv,*L4work_E6master_A10behavioral_S8fft_done,*L4work_E6master_A10behavioral_S9fft_edone,*L4work_E6master_A10behavioral_S8fft_busy,*L4work_E6master_A10behavioral_S7fft_rfd,*L4work_E6master_A10behavioral_S10fft_unload,*L4work_E6master_A10behavioral_S9fft_start,*L4work_E6master_A10behavioral_S7fft_rst;
  sig_info<L4work_E6master_A10behavioral_T3_t9> *L4work_E6master_A10behavioral_S9fft_xk_im,*L4work_E6master_A10behavioral_S9fft_xk_re,*L4work_E6master_A10behavioral_S9fft_xn_re;
  sig_info<L4work_E6master_A10behavioral_T4_t10> *L4work_E6master_A10behavioral_S12fft_xn_index,*L4work_E6master_A10behavioral_S12fft_xk_index;
  sig_info<L4work_E6master_A10behavioral_T4_t11> *L4work_E6master_A10behavioral_S11fft_blk_exp;
  sig_info<enumeration> *L4work_E6master_A10behavioral_S16mag_output_valid,*L4work_E6master_A10behavioral_S15mag_input_valid;
  sig_info<L4work_E6master_A10behavioral_T4_t12> *L4work_E6master_A10behavioral_S11mag_idx_out,*L4work_E6master_A10behavioral_S10mag_idx_in;
  sig_info<L4work_E6master_A10behavioral_T4_t13> *L4work_E6master_A10behavioral_S6mag_im,*L4work_E6master_A10behavioral_S6mag_re,*L4work_E6master_A10behavioral_S7mag_out;
  L4work_E6master_A10behavioral_I4_t14 L4work_E6master_A10behavioral_I4_t14_INFO;
  sig_info<L4work_E6master_A10behavioral_T4_t14> *L4work_E6master_A10behavioral_S16vga_ram_out_data,*L4work_E6master_A10behavioral_S15vga_ram_in_data;
  L4work_E6master_A10behavioral_I4_t15 L4work_E6master_A10behavioral_I4_t15_INFO;
  sig_info<L4work_E6master_A10behavioral_T4_t15> *L4work_E6master_A10behavioral_S16vga_ram_out_addr,*L4work_E6master_A10behavioral_S15vga_ram_in_addr;
  sig_info<L4work_E6master_A10behavioral_T4_t16> *L4work_E6master_A10behavioral_S13vga_ram_in_we;
  L4work_E6master_A10behavioral_I4_t17 L4work_E6master_A10behavioral_I4_t17_INFO;
  sig_info<L4work_E6master_A10behavioral_T4_t17> *L4work_E6master_A10behavioral_S12vga_green_in;
  L4work_E6master_A10behavioral_I4_t18 L4work_E6master_A10behavioral_I4_t18_INFO;
  sig_info<L4work_E6master_A10behavioral_T4_t18> *L4work_E6master_A10behavioral_S10vga_red_in;
  L4work_E6master_A10behavioral_I4_t19 L4work_E6master_A10behavioral_I4_t19_INFO;
  sig_info<L4work_E6master_A10behavioral_T4_t19> *L4work_E6master_A10behavioral_S11vga_blue_in;
  sig_info<integer> *L4work_E6master_A10behavioral_S9vga_y_pos,*L4work_E6master_A10behavioral_S9vga_x_pos;
  sig_info<enumeration> *L4work_E6master_A10behavioral_S9adc_state,*L4work_E6master_A10behavioral_S9fft_state;
  sig_info<integer> *L4work_E6master_A10behavioral_S11setup_delay;
};

/* Concurrent statement class declaration(s) */


/* Class decl. process _150pn */
class L4work_E6master_A10behavioral_P6_150pn : public process_base {
public:
  L4work_E6master_A10behavioral_P6_150pn(L4work_E6master_A10behavioral* L4work_E6master_A10behavioral_AP_PAR,name_stack &iname);
  ~L4work_E6master_A10behavioral_P6_150pn() {};
  bool execute();
  L4work_E6master_A10behavioral* L4work_E6master_A10behavioral_AP;
  driver_info *L4work_E6master_D4leds;
  L4work_E6master_A10behavioral *arch;
};

/* Class decl. process _151pn */
class L4work_E6master_A10behavioral_P6_151pn : public process_base {
public:
  L4work_E6master_A10behavioral_P6_151pn(L4work_E6master_A10behavioral* L4work_E6master_A10behavioral_AP_PAR,name_stack &iname);
  ~L4work_E6master_A10behavioral_P6_151pn() {};
  bool execute();
  L4work_E6master_A10behavioral* L4work_E6master_A10behavioral_AP;
  driver_info *L4work_E6master_D7adc_clk;
  enumeration *L4work_E6master_A10behavioral_R7dds_clk;
  sig_info<enumeration> *L4work_E6master_A10behavioral_S7dds_clk;
  winfo_item winfo[1];
  L4work_E6master_A10behavioral *arch;
};

/* Class decl. process _152pn */
class L4work_E6master_A10behavioral_P6_152pn : public process_base {
public:
  L4work_E6master_A10behavioral_P6_152pn(L4work_E6master_A10behavioral* L4work_E6master_A10behavioral_AP_PAR,name_stack &iname);
  ~L4work_E6master_A10behavioral_P6_152pn() {};
  bool execute();
  L4work_E6master_A10behavioral* L4work_E6master_A10behavioral_AP;
  driver_info *L4work_E6master_D8sine_out;
  L4work_E6master_A10behavioral_T3_t8 *L4work_E6master_A10behavioral_R17adc_fifo_data_out;
  sig_info<L4work_E6master_A10behavioral_T3_t8> *L4work_E6master_A10behavioral_S17adc_fifo_data_out;
  winfo_item winfo[1];
  L4work_E6master_A10behavioral *arch;
};

/* Class decl. process _153pn */
class L4work_E6master_A10behavioral_P6_153pn : public process_base {
public:
  L4work_E6master_A10behavioral_P6_153pn(L4work_E6master_A10behavioral* L4work_E6master_A10behavioral_AP_PAR,name_stack &iname);
  ~L4work_E6master_A10behavioral_P6_153pn() {};
  bool execute();
  L4work_E6master_A10behavioral* L4work_E6master_A10behavioral_AP;
  driver_info *L4work_E6master_A10behavioral_D11setup_delay;
  enumeration *L4work_E6master_R3rst,*L4work_E6master_A10behavioral_R7dds_clk;
  integer *L4work_E6master_A10behavioral_R11setup_delay;
  sig_info<enumeration> *L4work_E6master_A10behavioral_S7dds_clk;
  winfo_item winfo[1];
  L4work_E6master_A10behavioral *arch;
};

/* Class decl. process _154pn */
class L4work_E6master_A10behavioral_P6_154pn : public process_base {
public:
  L4work_E6master_A10behavioral_P6_154pn(L4work_E6master_A10behavioral* L4work_E6master_A10behavioral_AP_PAR,name_stack &iname);
  ~L4work_E6master_A10behavioral_P6_154pn() {};
  bool execute();
  L4work_E6master_A10behavioral* L4work_E6master_A10behavioral_AP;
  driver_info *L4work_E6master_A10behavioral_D9adc_state,*L4work_E6master_A10behavioral_D14adc_fifo_wr_en;
  enumeration *L4work_E6master_R3rst,*L4work_E6master_A10behavioral_R7dds_clk;
  integer *L4work_E6master_A10behavioral_R11setup_delay;
  enumeration *L4work_E6master_A10behavioral_R9adc_state;
  enumeration *L4work_E6master_A10behavioral_R18adc_fifo_prog_full,*L4work_E6master_A10behavioral_R14adc_fifo_empty;
  sig_info<enumeration> *L4work_E6master_A10behavioral_S7dds_clk;
  winfo_item winfo[1];
  L4work_E6master_A10behavioral *arch;
};

/* Class decl. process _155pn */
class L4work_E6master_A10behavioral_P6_155pn : public process_base {
public:
  L4work_E6master_A10behavioral_P6_155pn(L4work_E6master_A10behavioral* L4work_E6master_A10behavioral_AP_PAR,name_stack &iname);
  ~L4work_E6master_A10behavioral_P6_155pn() {};
  bool execute();
  L4work_E6master_A10behavioral* L4work_E6master_A10behavioral_AP;
  driver_info *L4work_E6master_A10behavioral_D9fft_state,*L4work_E6master_A10behavioral_D9fft_start,*L4work_E6master_A10behavioral_D10fft_unload,*L4work_E6master_A10behavioral_D14adc_fifo_rd_en,*L4work_E6master_A10behavioral_D15mag_input_valid;
  enumeration *L4work_E6master_R3rst,*L4work_E6master_A10behavioral_R12buffered_clk;
  integer *L4work_E6master_A10behavioral_R11setup_delay;
  enumeration *L4work_E6master_A10behavioral_R9fft_state;
  enumeration *L4work_E6master_A10behavioral_R18adc_fifo_prog_full,*L4work_E6master_A10behavioral_R14adc_fifo_empty,*L4work_E6master_A10behavioral_R9fft_edone,*L4work_E6master_A10behavioral_R6fft_dv;
  sig_info<enumeration> *L4work_E6master_A10behavioral_S12buffered_clk;
  winfo_item winfo[1];
  L4work_E6master_A10behavioral *arch;
};

/* Class decl. process _156pn */
class L4work_E6master_A10behavioral_P6_156pn : public process_base {
public:
  L4work_E6master_A10behavioral_P6_156pn(L4work_E6master_A10behavioral* L4work_E6master_A10behavioral_AP_PAR,name_stack &iname);
  ~L4work_E6master_A10behavioral_P6_156pn() {};
  bool execute();
  L4work_E6master_A10behavioral* L4work_E6master_A10behavioral_AP;
  driver_info *L4work_E6master_A10behavioral_D11vga_blue_in,*L4work_E6master_A10behavioral_D10vga_red_in,*L4work_E6master_A10behavioral_D12vga_green_in,*L4work_E6master_A10behavioral_D16vga_ram_out_addr;
  enumeration *L4work_E6master_R3rst,*L4work_E6master_A10behavioral_R7vga_clk;
  integer *L4work_E6master_A10behavioral_R9vga_x_pos;
  L4work_E6master_A10behavioral_T4_t10 *L4work_E6master_A10behavioral_R12fft_xk_index;
  integer *L4work_E6master_A10behavioral_R9vga_y_pos;
  L4work_E6master_A10behavioral_T3_t9 *L4work_E6master_A10behavioral_R9fft_xk_im;
  L4work_E6master_A10behavioral_T4_t14 *L4work_E6master_A10behavioral_R16vga_ram_out_data;
  sig_info<enumeration> *L4work_E6master_A10behavioral_S7vga_clk;
  winfo_item winfo[1];
  L4work_E6master_A10behavioral *arch;
};
L4work_E6master_A10behavioral_I3_t6 L4work_E6master_A10behavioral_I3_t6_INFO;
L4work_E6master_A10behavioral_I3_t7 L4work_E6master_A10behavioral_I3_t7_INFO;
L4work_E6master_A10behavioral_I3_t8 L4work_E6master_A10behavioral_I3_t8_INFO;
L4work_E6master_A10behavioral_I3_t9 L4work_E6master_A10behavioral_I3_t9_INFO;
L4work_E6master_A10behavioral_I4_t10 L4work_E6master_A10behavioral_I4_t10_INFO;
L4work_E6master_A10behavioral_I4_t11 L4work_E6master_A10behavioral_I4_t11_INFO;
L4work_E6master_A10behavioral_I4_t12 L4work_E6master_A10behavioral_I4_t12_INFO;
L4work_E6master_A10behavioral_I4_t13 L4work_E6master_A10behavioral_I4_t13_INFO;
L4work_E6master_A10behavioral_I4_t16 L4work_E6master_A10behavioral_I4_t16_INFO;
L4work_E6master_A10behavioral_I11adc_state_t L4work_E6master_A10behavioral_I11adc_state_t_INFO;
/* Implementation of enumeration type :work:master(behavioral):adc_state_t */
const char *L4work_E6master_A10behavioral_I11adc_state_t::values[]={"ADC_WRITING","ADC_WAITING"};
L4work_E6master_A10behavioral_I11fft_state_t L4work_E6master_A10behavioral_I11fft_state_t_INFO;
/* Implementation of enumeration type :work:master(behavioral):fft_state_t */
const char *L4work_E6master_A10behavioral_I11fft_state_t::values[]={"FFT_WAITING","FFT_READING","FFT_WAIT_FOR_EDONE","FFT_WAIT_FOR_DV","FFT_UNLOAD_DATA"};
enumeration L4work_E6master_A10behavioral_itn20_lit[]={2,2,2,2,2,2,2,2};
enumeration L4work_E6master_A10behavioral_itn21_lit[]={};
  /* Implementation of process :work:master(behavioral):_150pn methods */
L4work_E6master_A10behavioral_P6_150pn::
L4work_E6master_A10behavioral_P6_150pn(L4work_E6master_A10behavioral *L4work_E6master_A10behavioral_AP_PAR,name_stack &iname) : process_base(iname) {
    L4work_E6master_A10behavioral_AP=L4work_E6master_A10behavioral_AP_PAR;
    L4work_E6master_D4leds=kernel.get_driver(this,L4work_E6master_A10behavioral_AP->L4work_E6master_S4leds);
}
bool L4work_E6master_A10behavioral_P6_150pn::execute() {
    L4work_E6master_D4leds->inertial_assign(L4work_E6master_T3_t1(new array_info((&L4work_E6master_I3_t1_INFO)->element_type,(&L4work_E6master_I3_t1_INFO)->index_type,7,downto,0,0),enumeration(2)),0,vtime(0));
    return true;
}

  /* Implementation of process :work:master(behavioral):_151pn methods */
L4work_E6master_A10behavioral_P6_151pn::
L4work_E6master_A10behavioral_P6_151pn(L4work_E6master_A10behavioral *L4work_E6master_A10behavioral_AP_PAR,name_stack &iname) : process_base(iname) {
    L4work_E6master_A10behavioral_AP=L4work_E6master_A10behavioral_AP_PAR;
    L4work_E6master_A10behavioral_S7dds_clk=L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S7dds_clk;
    L4work_E6master_A10behavioral_R7dds_clk=&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S7dds_clk->reader();
    L4work_E6master_D7adc_clk=kernel.get_driver(this,L4work_E6master_A10behavioral_AP->L4work_E6master_S7adc_clk);
    {
     sigacl_list sal(1);
     sal.add(L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S7dds_clk);
     winfo[0]=kernel.setup_wait_info(sal,this);
    }
}
bool L4work_E6master_A10behavioral_P6_151pn::execute() {
    L4work_E6master_D7adc_clk->inertial_assign((*L4work_E6master_A10behavioral_R7dds_clk),vtime(0));
    return true;
}

  /* Implementation of process :work:master(behavioral):_152pn methods */
L4work_E6master_A10behavioral_P6_152pn::
L4work_E6master_A10behavioral_P6_152pn(L4work_E6master_A10behavioral *L4work_E6master_A10behavioral_AP_PAR,name_stack &iname) : process_base(iname) {
    L4work_E6master_A10behavioral_AP=L4work_E6master_A10behavioral_AP_PAR;
    L4work_E6master_A10behavioral_S17adc_fifo_data_out=L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S17adc_fifo_data_out;
    L4work_E6master_A10behavioral_R17adc_fifo_data_out=&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S17adc_fifo_data_out->reader();
    L4work_E6master_D8sine_out=kernel.get_driver(this,L4work_E6master_A10behavioral_AP->L4work_E6master_S8sine_out);
    {
     sigacl_list sal(1);
     sal.add(L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S17adc_fifo_data_out);
     winfo[0]=kernel.setup_wait_info(sal,this);
    }
}
bool L4work_E6master_A10behavioral_P6_152pn::execute() {
    L4work_E6master_D8sine_out->inertial_assign((*L4work_E6master_A10behavioral_R17adc_fifo_data_out),0,vtime(0));
    return true;
}

  /* Implementation of process :work:master(behavioral):_153pn methods */
L4work_E6master_A10behavioral_P6_153pn::
L4work_E6master_A10behavioral_P6_153pn(L4work_E6master_A10behavioral *L4work_E6master_A10behavioral_AP_PAR,name_stack &iname) : process_base(iname) {
    L4work_E6master_A10behavioral_AP=L4work_E6master_A10behavioral_AP_PAR;
    L4work_E6master_A10behavioral_S7dds_clk=L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S7dds_clk;
    L4work_E6master_R3rst=&L4work_E6master_A10behavioral_AP->L4work_E6master_S3rst->reader();
    L4work_E6master_A10behavioral_R7dds_clk=&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S7dds_clk->reader();
    L4work_E6master_A10behavioral_R11setup_delay=&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S11setup_delay->reader();
    L4work_E6master_A10behavioral_D11setup_delay=kernel.get_driver(this,L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S11setup_delay);
    {
     sigacl_list sal(2);
     sal.add(L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S7dds_clk);
     sal.add(L4work_E6master_A10behavioral_AP->L4work_E6master_S3rst);
     winfo[0]=kernel.setup_wait_info(sal,this);
    }
}
bool L4work_E6master_A10behavioral_P6_153pn::execute() {
    if(((*L4work_E6master_R3rst)==enumeration(3))) {
      L4work_E6master_A10behavioral_D11setup_delay->inertial_assign(10,vtime(0));
    } else {
      if(L4ieee_Q14std_logic_1164_Y11rising_edge_i156 (L4work_E6master_A10behavioral_S7dds_clk,L4work_E6master_A10behavioral_R7dds_clk)) {
        if(((*L4work_E6master_A10behavioral_R11setup_delay)!=0)) {
          L4work_E6master_A10behavioral_D11setup_delay->inertial_assign(((*L4work_E6master_A10behavioral_R11setup_delay)-1),vtime(0));
        }
      }
    }
    return true;
}

  /* Implementation of process :work:master(behavioral):_154pn methods */
L4work_E6master_A10behavioral_P6_154pn::
L4work_E6master_A10behavioral_P6_154pn(L4work_E6master_A10behavioral *L4work_E6master_A10behavioral_AP_PAR,name_stack &iname) : process_base(iname) {
    L4work_E6master_A10behavioral_AP=L4work_E6master_A10behavioral_AP_PAR;
    L4work_E6master_A10behavioral_S7dds_clk=L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S7dds_clk;
    L4work_E6master_R3rst=&L4work_E6master_A10behavioral_AP->L4work_E6master_S3rst->reader();
    L4work_E6master_A10behavioral_R7dds_clk=&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S7dds_clk->reader();
    L4work_E6master_A10behavioral_R11setup_delay=&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S11setup_delay->reader();
    L4work_E6master_A10behavioral_R9adc_state=&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S9adc_state->reader();
    L4work_E6master_A10behavioral_R18adc_fifo_prog_full=&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S18adc_fifo_prog_full->reader();
    L4work_E6master_A10behavioral_R14adc_fifo_empty=&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S14adc_fifo_empty->reader();
    L4work_E6master_A10behavioral_D9adc_state=kernel.get_driver(this,L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S9adc_state);
    L4work_E6master_A10behavioral_D14adc_fifo_wr_en=kernel.get_driver(this,L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S14adc_fifo_wr_en);
    {
     sigacl_list sal(2);
     sal.add(L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S7dds_clk);
     sal.add(L4work_E6master_A10behavioral_AP->L4work_E6master_S3rst);
     winfo[0]=kernel.setup_wait_info(sal,this);
    }
}
bool L4work_E6master_A10behavioral_P6_154pn::execute() {
    if(((*L4work_E6master_R3rst)==enumeration(3))) {
      L4work_E6master_A10behavioral_D9adc_state->inertial_assign(enumeration(1),vtime(0));
    } else {
      if(L4ieee_Q14std_logic_1164_Y11rising_edge_i156 (L4work_E6master_A10behavioral_S7dds_clk,L4work_E6master_A10behavioral_R7dds_clk)) {
        if(((*L4work_E6master_A10behavioral_R11setup_delay)==0)) {
          switch((*L4work_E6master_A10behavioral_R9adc_state)) {
          case 0: {
            L4work_E6master_A10behavioral_D14adc_fifo_wr_en->inertial_assign(enumeration(3),vtime(0));
            if(((*L4work_E6master_A10behavioral_R18adc_fifo_prog_full)==enumeration(3))) {
              L4work_E6master_A10behavioral_D14adc_fifo_wr_en->inertial_assign(enumeration(2),vtime(0));
              L4work_E6master_A10behavioral_D9adc_state->inertial_assign(enumeration(1),vtime(0));
            }
           } break;
          case 1: {
            L4work_E6master_A10behavioral_D14adc_fifo_wr_en->inertial_assign(enumeration(2),vtime(0));
            if(((*L4work_E6master_A10behavioral_R14adc_fifo_empty)==enumeration(3))) {
              L4work_E6master_A10behavioral_D9adc_state->inertial_assign(enumeration(0),vtime(0));
            }
           } break;
          }
        }
      }
    }
    return true;
}

  /* Implementation of process :work:master(behavioral):_155pn methods */
L4work_E6master_A10behavioral_P6_155pn::
L4work_E6master_A10behavioral_P6_155pn(L4work_E6master_A10behavioral *L4work_E6master_A10behavioral_AP_PAR,name_stack &iname) : process_base(iname) {
    L4work_E6master_A10behavioral_AP=L4work_E6master_A10behavioral_AP_PAR;
    L4work_E6master_A10behavioral_S12buffered_clk=L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S12buffered_clk;
    L4work_E6master_R3rst=&L4work_E6master_A10behavioral_AP->L4work_E6master_S3rst->reader();
    L4work_E6master_A10behavioral_R12buffered_clk=&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S12buffered_clk->reader();
    L4work_E6master_A10behavioral_R11setup_delay=&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S11setup_delay->reader();
    L4work_E6master_A10behavioral_R9fft_state=&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S9fft_state->reader();
    L4work_E6master_A10behavioral_R18adc_fifo_prog_full=&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S18adc_fifo_prog_full->reader();
    L4work_E6master_A10behavioral_R14adc_fifo_empty=&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S14adc_fifo_empty->reader();
    L4work_E6master_A10behavioral_R9fft_edone=&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S9fft_edone->reader();
    L4work_E6master_A10behavioral_R6fft_dv=&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S6fft_dv->reader();
    L4work_E6master_A10behavioral_D9fft_state=kernel.get_driver(this,L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S9fft_state);
    L4work_E6master_A10behavioral_D9fft_start=kernel.get_driver(this,L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S9fft_start);
    L4work_E6master_A10behavioral_D10fft_unload=kernel.get_driver(this,L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S10fft_unload);
    L4work_E6master_A10behavioral_D14adc_fifo_rd_en=kernel.get_driver(this,L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S14adc_fifo_rd_en);
    L4work_E6master_A10behavioral_D15mag_input_valid=kernel.get_driver(this,L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S15mag_input_valid);
    {
     sigacl_list sal(2);
     sal.add(L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S12buffered_clk);
     sal.add(L4work_E6master_A10behavioral_AP->L4work_E6master_S3rst);
     winfo[0]=kernel.setup_wait_info(sal,this);
    }
}
bool L4work_E6master_A10behavioral_P6_155pn::execute() {
    if(((*L4work_E6master_R3rst)==enumeration(3))) {
      L4work_E6master_A10behavioral_D9fft_state->inertial_assign(enumeration(0),vtime(0));
      L4work_E6master_A10behavioral_D9fft_start->inertial_assign(enumeration(2),vtime(0));
      L4work_E6master_A10behavioral_D10fft_unload->inertial_assign(enumeration(2),vtime(0));
      L4work_E6master_A10behavioral_D14adc_fifo_rd_en->inertial_assign(enumeration(2),vtime(0));
      L4work_E6master_A10behavioral_D15mag_input_valid->inertial_assign(enumeration(2),vtime(0));
    } else {
      if(L4ieee_Q14std_logic_1164_Y11rising_edge_i156 (L4work_E6master_A10behavioral_S12buffered_clk,L4work_E6master_A10behavioral_R12buffered_clk)) {
        if(((*L4work_E6master_A10behavioral_R11setup_delay)==0)) {
          switch((*L4work_E6master_A10behavioral_R9fft_state)) {
          case 0: {
            L4work_E6master_A10behavioral_D14adc_fifo_rd_en->inertial_assign(enumeration(2),vtime(0));
            if(((*L4work_E6master_A10behavioral_R18adc_fifo_prog_full)==enumeration(3))) {
              L4work_E6master_A10behavioral_D9fft_state->inertial_assign(enumeration(1),vtime(0));
              L4work_E6master_A10behavioral_D9fft_start->inertial_assign(enumeration(3),vtime(0));
            }
           } break;
          case 1: {
            L4work_E6master_A10behavioral_D9fft_start->inertial_assign(enumeration(2),vtime(0));
            L4work_E6master_A10behavioral_D14adc_fifo_rd_en->inertial_assign(enumeration(3),vtime(0));
            if(((*L4work_E6master_A10behavioral_R14adc_fifo_empty)==enumeration(3))) {
              L4work_E6master_A10behavioral_D9fft_state->inertial_assign(enumeration(2),vtime(0));
              L4work_E6master_A10behavioral_D14adc_fifo_rd_en->inertial_assign(enumeration(2),vtime(0));
            }
           } break;
          case 2: {
            if(((*L4work_E6master_A10behavioral_R9fft_edone)==enumeration(3))) {
              L4work_E6master_A10behavioral_D9fft_state->inertial_assign(enumeration(3),vtime(0));
              L4work_E6master_A10behavioral_D10fft_unload->inertial_assign(enumeration(3),vtime(0));
            }
           } break;
          case 3: {
            if(((*L4work_E6master_A10behavioral_R6fft_dv)==enumeration(3))) {
              L4work_E6master_A10behavioral_D15mag_input_valid->inertial_assign(enumeration(3),vtime(0));
              L4work_E6master_A10behavioral_D10fft_unload->inertial_assign(enumeration(2),vtime(0));
              L4work_E6master_A10behavioral_D9fft_state->inertial_assign(enumeration(4),vtime(0));
            }
           } break;
          case 4: {
            if(((*L4work_E6master_A10behavioral_R6fft_dv)==enumeration(2))) {
              L4work_E6master_A10behavioral_D10fft_unload->inertial_assign(enumeration(2),vtime(0));
              L4work_E6master_A10behavioral_D15mag_input_valid->inertial_assign(enumeration(2),vtime(0));
              L4work_E6master_A10behavioral_D9fft_state->inertial_assign(enumeration(0),vtime(0));
            }
           } break;
          }
        }
      }
    }
    return true;
}

  /* Implementation of process :work:master(behavioral):_156pn methods */
L4work_E6master_A10behavioral_P6_156pn::
L4work_E6master_A10behavioral_P6_156pn(L4work_E6master_A10behavioral *L4work_E6master_A10behavioral_AP_PAR,name_stack &iname) : process_base(iname) {
    L4work_E6master_A10behavioral_AP=L4work_E6master_A10behavioral_AP_PAR;
    L4work_E6master_A10behavioral_S7vga_clk=L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S7vga_clk;
    L4work_E6master_R3rst=&L4work_E6master_A10behavioral_AP->L4work_E6master_S3rst->reader();
    L4work_E6master_A10behavioral_R7vga_clk=&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S7vga_clk->reader();
    L4work_E6master_A10behavioral_R9vga_x_pos=&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S9vga_x_pos->reader();
    L4work_E6master_A10behavioral_R12fft_xk_index=&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S12fft_xk_index->reader();
    L4work_E6master_A10behavioral_R9vga_y_pos=&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S9vga_y_pos->reader();
    L4work_E6master_A10behavioral_R9fft_xk_im=&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S9fft_xk_im->reader();
    L4work_E6master_A10behavioral_R16vga_ram_out_data=&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S16vga_ram_out_data->reader();
    L4work_E6master_A10behavioral_D11vga_blue_in=kernel.get_driver(this,L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S11vga_blue_in);
    L4work_E6master_A10behavioral_D10vga_red_in=kernel.get_driver(this,L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S10vga_red_in);
    L4work_E6master_A10behavioral_D12vga_green_in=kernel.get_driver(this,L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S12vga_green_in);
    L4work_E6master_A10behavioral_D16vga_ram_out_addr=kernel.get_driver(this,L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S16vga_ram_out_addr);
    {
     sigacl_list sal(2);
     sal.add(L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_S7vga_clk);
     sal.add(L4work_E6master_A10behavioral_AP->L4work_E6master_S3rst);
     winfo[0]=kernel.setup_wait_info(sal,this);
    }
}
bool L4work_E6master_A10behavioral_P6_156pn::execute() {
    if(((*L4work_E6master_R3rst)==enumeration(3))) {
      L4work_E6master_A10behavioral_D11vga_blue_in->inertial_assign(L4work_E6master_A10behavioral_T4_t19(new array_info((&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_I4_t19_INFO)->element_type,(&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_I4_t19_INFO)->index_type,1,downto,0,0),enumeration(2)),0,vtime(0));
      L4work_E6master_A10behavioral_D10vga_red_in->inertial_assign(L4work_E6master_A10behavioral_T4_t18(new array_info((&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_I4_t18_INFO)->element_type,(&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_I4_t18_INFO)->index_type,2,downto,0,0),enumeration(2)),0,vtime(0));
      L4work_E6master_A10behavioral_D12vga_green_in->inertial_assign(L4work_E6master_A10behavioral_T4_t17(new array_info((&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_I4_t17_INFO)->element_type,(&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_I4_t17_INFO)->index_type,2,downto,0,0),enumeration(2)),0,vtime(0));
    } else {
      if(L4ieee_Q14std_logic_1164_Y11rising_edge_i156 (L4work_E6master_A10behavioral_S7vga_clk,L4work_E6master_A10behavioral_R7vga_clk)) {
        L4work_E6master_A10behavioral_D16vga_ram_out_addr->inertial_assign(array_alias<L4ieee_Q14std_logic_1164_T16std_logic_vector >((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO),L4ieee_Q11numeric_std_Y11to_unsigned_i284 (((*L4work_E6master_A10behavioral_R9vga_x_pos)+1),9)),0,vtime(0));
        if((((*L4work_E6master_A10behavioral_R9vga_x_pos)<512)&&((*L4work_E6master_A10behavioral_R9vga_y_pos)<256))) {
          if(((256-L4ieee_Q11numeric_std_Y10to_integer_i279 (array_alias<L4ieee_Q11numeric_std_T8unsigned >((&L4ieee_Q11numeric_std_I8unsigned_INFO),(*L4work_E6master_A10behavioral_R16vga_ram_out_data))))>=(*L4work_E6master_A10behavioral_R9vga_y_pos))) {
            L4work_E6master_A10behavioral_D11vga_blue_in->inertial_assign(L4work_E6master_A10behavioral_T4_t19(new array_info((&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_I4_t19_INFO)->element_type,(&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_I4_t19_INFO)->index_type,1,downto,0,0),enumeration(3)),0,vtime(0));
          } else {
            L4work_E6master_A10behavioral_D11vga_blue_in->inertial_assign(L4work_E6master_A10behavioral_T4_t19(new array_info((&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_I4_t19_INFO)->element_type,(&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_I4_t19_INFO)->index_type,1,downto,0,0),enumeration(2)),0,vtime(0));
          }
        } else {
          L4work_E6master_A10behavioral_D11vga_blue_in->inertial_assign(L4work_E6master_A10behavioral_T4_t19(new array_info((&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_I4_t19_INFO)->element_type,(&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_I4_t19_INFO)->index_type,1,downto,0,0),enumeration(2)),0,vtime(0));
          L4work_E6master_A10behavioral_D10vga_red_in->inertial_assign(L4work_E6master_A10behavioral_T4_t18(new array_info((&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_I4_t18_INFO)->element_type,(&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_I4_t18_INFO)->index_type,2,downto,0,0),enumeration(2)),0,vtime(0));
          L4work_E6master_A10behavioral_D12vga_green_in->inertial_assign(L4work_E6master_A10behavioral_T4_t17(new array_info((&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_I4_t17_INFO)->element_type,(&L4work_E6master_A10behavioral_AP->L4work_E6master_A10behavioral_I4_t17_INFO)->index_type,2,downto,0,0),enumeration(2)),0,vtime(0));
        }
      }
    }
    return true;
}

                /* handle for simulator to find architecture */
void*
L4work_E6master_A10behavioral_handle(name_stack &iname, map_list *mlist, void *father, int level) {
 REPORT(cout << "Starting constructor L4work_E6master_A10behavioral ..." << endl);
 return new L4work_E6master_A10behavioral(iname, mlist, father, level);
};
extern int L4work_E6master_A10behavioral_init ();
handle_info *L4work_E6master_A10behavioral_hinfo =
  add_handle("work","master","behavioral",&L4work_E6master_A10behavioral_handle,&L4work_E6master_A10behavioral_init);
/* Architecture Constructor */
L4work_E6master_A10behavioral::
L4work_E6master_A10behavioral(name_stack &iname, map_list *mlist, void *father, int level) :
  L4work_E6master(iname, mlist, father) {
    iname.push(":behavioral");
    iname.push("");
    L4work_E6master_A10behavioral_S7vga_clk=new sig_info<enumeration > (iname, ":vga_clk",":work:master(behavioral)",(&L4ieee_Q14std_logic_1164_I9std_logic_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S7vga_clk->init(enumeration(2));
    L4work_E6master_A10behavioral_S11sine_buffer=new sig_info<L4work_E6master_A10behavioral_T3_t6 > (iname, ":sine_buffer",":work:master(behavioral)",(&L4work_E6master_A10behavioral_I3_t6_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S9phase_inc=new sig_info<L4work_E6master_A10behavioral_T3_t7 > (iname, ":phase_inc",":work:master(behavioral)",(&L4work_E6master_A10behavioral_I3_t7_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S9phase_inc->init(L4work_E6master_A10behavioral_T3_t7(new array_info((&L4work_E6master_A10behavioral_I3_t7_INFO)->element_type,(&L4work_E6master_A10behavioral_I3_t7_INFO)->index_type,13,downto,0,0),enumeration(2)));
    L4work_E6master_A10behavioral_S12buffered_clk=new sig_info<enumeration > (iname, ":buffered_clk",":work:master(behavioral)",(&L4ieee_Q14std_logic_1164_I9std_logic_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S12buffered_clk->init(enumeration(2));
    L4work_E6master_A10behavioral_S7dds_clk=new sig_info<enumeration > (iname, ":dds_clk",":work:master(behavioral)",(&L4ieee_Q14std_logic_1164_I9std_logic_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S7dds_clk->init(enumeration(2));
    L4work_E6master_A10behavioral_S18adc_fifo_prog_full=new sig_info<enumeration > (iname, ":adc_fifo_prog_full",":work:master(behavioral)",(&L4ieee_Q14std_logic_1164_I9std_logic_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S18adc_fifo_prog_full->init(enumeration(2));
    L4work_E6master_A10behavioral_S14adc_fifo_empty=new sig_info<enumeration > (iname, ":adc_fifo_empty",":work:master(behavioral)",(&L4ieee_Q14std_logic_1164_I9std_logic_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S14adc_fifo_empty->init(enumeration(2));
    L4work_E6master_A10behavioral_S14adc_fifo_rd_en=new sig_info<enumeration > (iname, ":adc_fifo_rd_en",":work:master(behavioral)",(&L4ieee_Q14std_logic_1164_I9std_logic_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S14adc_fifo_rd_en->init(enumeration(2));
    L4work_E6master_A10behavioral_S14adc_fifo_wr_en=new sig_info<enumeration > (iname, ":adc_fifo_wr_en",":work:master(behavioral)",(&L4ieee_Q14std_logic_1164_I9std_logic_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S14adc_fifo_wr_en->init(enumeration(2));
    L4work_E6master_A10behavioral_S17adc_fifo_data_out=new sig_info<L4work_E6master_A10behavioral_T3_t8 > (iname, ":adc_fifo_data_out",":work:master(behavioral)",(&L4work_E6master_A10behavioral_I3_t8_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S6fft_dv=new sig_info<enumeration > (iname, ":fft_dv",":work:master(behavioral)",(&L4ieee_Q14std_logic_1164_I9std_logic_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S6fft_dv->init(enumeration(2));
    L4work_E6master_A10behavioral_S8fft_done=new sig_info<enumeration > (iname, ":fft_done",":work:master(behavioral)",(&L4ieee_Q14std_logic_1164_I9std_logic_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S8fft_done->init(enumeration(2));
    L4work_E6master_A10behavioral_S9fft_edone=new sig_info<enumeration > (iname, ":fft_edone",":work:master(behavioral)",(&L4ieee_Q14std_logic_1164_I9std_logic_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S9fft_edone->init(enumeration(2));
    L4work_E6master_A10behavioral_S8fft_busy=new sig_info<enumeration > (iname, ":fft_busy",":work:master(behavioral)",(&L4ieee_Q14std_logic_1164_I9std_logic_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S8fft_busy->init(enumeration(2));
    L4work_E6master_A10behavioral_S7fft_rfd=new sig_info<enumeration > (iname, ":fft_rfd",":work:master(behavioral)",(&L4ieee_Q14std_logic_1164_I9std_logic_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S7fft_rfd->init(enumeration(2));
    L4work_E6master_A10behavioral_S10fft_unload=new sig_info<enumeration > (iname, ":fft_unload",":work:master(behavioral)",(&L4ieee_Q14std_logic_1164_I9std_logic_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S10fft_unload->init(enumeration(2));
    L4work_E6master_A10behavioral_S9fft_start=new sig_info<enumeration > (iname, ":fft_start",":work:master(behavioral)",(&L4ieee_Q14std_logic_1164_I9std_logic_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S9fft_start->init(enumeration(2));
    L4work_E6master_A10behavioral_S7fft_rst=new sig_info<enumeration > (iname, ":fft_rst",":work:master(behavioral)",(&L4ieee_Q14std_logic_1164_I9std_logic_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S7fft_rst->init(enumeration(2));
    L4work_E6master_A10behavioral_S9fft_xk_im=new sig_info<L4work_E6master_A10behavioral_T3_t9 > (iname, ":fft_xk_im",":work:master(behavioral)",(&L4work_E6master_A10behavioral_I3_t9_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S9fft_xk_im->init(L4work_E6master_A10behavioral_T3_t9(new array_info((&L4work_E6master_A10behavioral_I3_t9_INFO)->element_type,(&L4work_E6master_A10behavioral_I3_t9_INFO)->index_type,7,downto,0,0),enumeration(2)));
    L4work_E6master_A10behavioral_S9fft_xk_re=new sig_info<L4work_E6master_A10behavioral_T3_t9 > (iname, ":fft_xk_re",":work:master(behavioral)",(&L4work_E6master_A10behavioral_I3_t9_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S9fft_xk_re->init(L4work_E6master_A10behavioral_T3_t9(new array_info((&L4work_E6master_A10behavioral_I3_t9_INFO)->element_type,(&L4work_E6master_A10behavioral_I3_t9_INFO)->index_type,7,downto,0,0),enumeration(2)));
    L4work_E6master_A10behavioral_S9fft_xn_re=new sig_info<L4work_E6master_A10behavioral_T3_t9 > (iname, ":fft_xn_re",":work:master(behavioral)",(&L4work_E6master_A10behavioral_I3_t9_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S9fft_xn_re->init(L4work_E6master_A10behavioral_T3_t9(new array_info((&L4work_E6master_A10behavioral_I3_t9_INFO)->element_type,(&L4work_E6master_A10behavioral_I3_t9_INFO)->index_type,7,downto,0,0),enumeration(2)));
    L4work_E6master_A10behavioral_S12fft_xn_index=new sig_info<L4work_E6master_A10behavioral_T4_t10 > (iname, ":fft_xn_index",":work:master(behavioral)",(&L4work_E6master_A10behavioral_I4_t10_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S12fft_xn_index->init(L4work_E6master_A10behavioral_T4_t10(new array_info((&L4work_E6master_A10behavioral_I4_t10_INFO)->element_type,(&L4work_E6master_A10behavioral_I4_t10_INFO)->index_type,8,downto,0,0),enumeration(2)));
    L4work_E6master_A10behavioral_S12fft_xk_index=new sig_info<L4work_E6master_A10behavioral_T4_t10 > (iname, ":fft_xk_index",":work:master(behavioral)",(&L4work_E6master_A10behavioral_I4_t10_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S12fft_xk_index->init(L4work_E6master_A10behavioral_T4_t10(new array_info((&L4work_E6master_A10behavioral_I4_t10_INFO)->element_type,(&L4work_E6master_A10behavioral_I4_t10_INFO)->index_type,8,downto,0,0),enumeration(2)));
    L4work_E6master_A10behavioral_S11fft_blk_exp=new sig_info<L4work_E6master_A10behavioral_T4_t11 > (iname, ":fft_blk_exp",":work:master(behavioral)",(&L4work_E6master_A10behavioral_I4_t11_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S11fft_blk_exp->init(L4work_E6master_A10behavioral_T4_t11(new array_info((&L4work_E6master_A10behavioral_I4_t11_INFO)->element_type,(&L4work_E6master_A10behavioral_I4_t11_INFO)->index_type,4,downto,0,0),enumeration(2)));
    L4work_E6master_A10behavioral_S16mag_output_valid=new sig_info<enumeration > (iname, ":mag_output_valid",":work:master(behavioral)",(&L4ieee_Q14std_logic_1164_I9std_logic_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S16mag_output_valid->init(enumeration(2));
    L4work_E6master_A10behavioral_S15mag_input_valid=new sig_info<enumeration > (iname, ":mag_input_valid",":work:master(behavioral)",(&L4ieee_Q14std_logic_1164_I9std_logic_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S15mag_input_valid->init(enumeration(2));
    L4work_E6master_A10behavioral_S11mag_idx_out=new sig_info<L4work_E6master_A10behavioral_T4_t12 > (iname, ":mag_idx_out",":work:master(behavioral)",(&L4work_E6master_A10behavioral_I4_t12_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S11mag_idx_out->init(L4work_E6master_A10behavioral_T4_t12(new array_info((&L4work_E6master_A10behavioral_I4_t12_INFO)->element_type,(&L4work_E6master_A10behavioral_I4_t12_INFO)->index_type,8,downto,0,0),enumeration(2)));
    L4work_E6master_A10behavioral_S10mag_idx_in=new sig_info<L4work_E6master_A10behavioral_T4_t12 > (iname, ":mag_idx_in",":work:master(behavioral)",(&L4work_E6master_A10behavioral_I4_t12_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S10mag_idx_in->init(L4work_E6master_A10behavioral_T4_t12(new array_info((&L4work_E6master_A10behavioral_I4_t12_INFO)->element_type,(&L4work_E6master_A10behavioral_I4_t12_INFO)->index_type,8,downto,0,0),enumeration(2)));
    L4work_E6master_A10behavioral_S6mag_im=new sig_info<L4work_E6master_A10behavioral_T4_t13 > (iname, ":mag_im",":work:master(behavioral)",(&L4work_E6master_A10behavioral_I4_t13_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S6mag_im->init(L4work_E6master_A10behavioral_T4_t13(new array_info((&L4work_E6master_A10behavioral_I4_t13_INFO)->element_type,(&L4work_E6master_A10behavioral_I4_t13_INFO)->index_type,7,downto,0,0),enumeration(2)));
    L4work_E6master_A10behavioral_S6mag_re=new sig_info<L4work_E6master_A10behavioral_T4_t13 > (iname, ":mag_re",":work:master(behavioral)",(&L4work_E6master_A10behavioral_I4_t13_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S6mag_re->init(L4work_E6master_A10behavioral_T4_t13(new array_info((&L4work_E6master_A10behavioral_I4_t13_INFO)->element_type,(&L4work_E6master_A10behavioral_I4_t13_INFO)->index_type,7,downto,0,0),enumeration(2)));
    L4work_E6master_A10behavioral_S7mag_out=new sig_info<L4work_E6master_A10behavioral_T4_t13 > (iname, ":mag_out",":work:master(behavioral)",(&L4work_E6master_A10behavioral_I4_t13_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S7mag_out->init(L4work_E6master_A10behavioral_T4_t13(new array_info((&L4work_E6master_A10behavioral_I4_t13_INFO)->element_type,(&L4work_E6master_A10behavioral_I4_t13_INFO)->index_type,7,downto,0,0),enumeration(2)));
    L4work_E6master_A10behavioral_I4_t14_INFO.set((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->element_type,parray_info((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO))->index_type,7,downto,0,-1).register_type(":work:master(behavioral)",":work:master(behavioral):_t14",":_t14",NULL);
    L4work_E6master_A10behavioral_S16vga_ram_out_data=new sig_info<L4work_E6master_A10behavioral_T4_t14 > (iname, ":vga_ram_out_data",":work:master(behavioral)",(&L4work_E6master_A10behavioral_I4_t14_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S15vga_ram_in_data=new sig_info<L4work_E6master_A10behavioral_T4_t14 > (iname, ":vga_ram_in_data",":work:master(behavioral)",(&L4work_E6master_A10behavioral_I4_t14_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_I4_t15_INFO.set((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->element_type,parray_info((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO))->index_type,8,downto,0,-1).register_type(":work:master(behavioral)",":work:master(behavioral):_t15",":_t15",NULL);
    L4work_E6master_A10behavioral_S16vga_ram_out_addr=new sig_info<L4work_E6master_A10behavioral_T4_t15 > (iname, ":vga_ram_out_addr",":work:master(behavioral)",(&L4work_E6master_A10behavioral_I4_t15_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S15vga_ram_in_addr=new sig_info<L4work_E6master_A10behavioral_T4_t15 > (iname, ":vga_ram_in_addr",":work:master(behavioral)",(&L4work_E6master_A10behavioral_I4_t15_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S13vga_ram_in_we=new sig_info<L4work_E6master_A10behavioral_T4_t16 > (iname, ":vga_ram_in_we",":work:master(behavioral)",(&L4work_E6master_A10behavioral_I4_t16_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S13vga_ram_in_we->init(L4work_E6master_A10behavioral_T4_t16(new array_info((&L4work_E6master_A10behavioral_I4_t16_INFO)->element_type,(&L4work_E6master_A10behavioral_I4_t16_INFO)->index_type,0,downto,0,0),enumeration(2)));
    L4work_E6master_A10behavioral_I4_t17_INFO.set((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->element_type,parray_info((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO))->index_type,2,downto,0,-1).register_type(":work:master(behavioral)",":work:master(behavioral):_t17",":_t17",NULL);
    L4work_E6master_A10behavioral_S12vga_green_in=new sig_info<L4work_E6master_A10behavioral_T4_t17 > (iname, ":vga_green_in",":work:master(behavioral)",(&L4work_E6master_A10behavioral_I4_t17_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_I4_t18_INFO.set((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->element_type,parray_info((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO))->index_type,2,downto,0,-1).register_type(":work:master(behavioral)",":work:master(behavioral):_t18",":_t18",NULL);
    L4work_E6master_A10behavioral_S10vga_red_in=new sig_info<L4work_E6master_A10behavioral_T4_t18 > (iname, ":vga_red_in",":work:master(behavioral)",(&L4work_E6master_A10behavioral_I4_t18_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_I4_t19_INFO.set((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->element_type,parray_info((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO))->index_type,1,downto,0,-1).register_type(":work:master(behavioral)",":work:master(behavioral):_t19",":_t19",NULL);
    L4work_E6master_A10behavioral_S11vga_blue_in=new sig_info<L4work_E6master_A10behavioral_T4_t19 > (iname, ":vga_blue_in",":work:master(behavioral)",(&L4work_E6master_A10behavioral_I4_t19_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S9vga_y_pos=new sig_info<integer > (iname, ":vga_y_pos",":work:master(behavioral)",(&L3std_Q8standard_I7integer_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S9vga_x_pos=new sig_info<integer > (iname, ":vga_x_pos",":work:master(behavioral)",(&L3std_Q8standard_I7integer_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S9adc_state=new sig_info<enumeration > (iname, ":adc_state",":work:master(behavioral)",(&L4work_E6master_A10behavioral_I11adc_state_t_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S9adc_state->init(enumeration(1));
    L4work_E6master_A10behavioral_S9fft_state=new sig_info<enumeration > (iname, ":fft_state",":work:master(behavioral)",(&L4work_E6master_A10behavioral_I11fft_state_t_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S9fft_state->init(enumeration(0));
    L4work_E6master_A10behavioral_S11setup_delay=new sig_info<integer > (iname, ":setup_delay",":work:master(behavioral)",(&L3std_Q8standard_I7integer_INFO),vREGISTER,this);
    L4work_E6master_A10behavioral_S11setup_delay->init(10);
    kernel.add_process(new L4work_E6master_A10behavioral_P6_150pn(this,iname.set(":_150pn")),":work:master(behavioral)",":_150pn",this);
    kernel.add_process(new L4work_E6master_A10behavioral_P6_151pn(this,iname.set(":_151pn")),":work:master(behavioral)",":_151pn",this);
    kernel.add_process(new L4work_E6master_A10behavioral_P6_152pn(this,iname.set(":_152pn")),":work:master(behavioral)",":_152pn",this);
    kernel.add_process(new L4work_E6master_A10behavioral_P6_153pn(this,iname.set(":_153pn")),":work:master(behavioral)",":_153pn",this);
    kernel.add_process(new L4work_E6master_A10behavioral_P6_154pn(this,iname.set(":_154pn")),":work:master(behavioral)",":_154pn",this);
    kernel.add_process(new L4work_E6master_A10behavioral_P6_155pn(this,iname.set(":_155pn")),":work:master(behavioral)",":_155pn",this);
    kernel.add_process(new L4work_E6master_A10behavioral_P6_156pn(this,iname.set(":_156pn")),":work:master(behavioral)",":_156pn",this);
    tmpml.reset(); tmpml.signal_map(":rst",NULL,vIN,L4work_E6master_S3rst,NULL); tmpml.signal_map(":wr_clk",NULL,vIN,L4work_E6master_A10behavioral_S7dds_clk,NULL); tmpml.signal_map(":rd_clk",NULL,vIN,L4work_E6master_A10behavioral_S12buffered_clk,NULL); tmpml.signal_map(":din",NULL,vIN,L4work_E6master_A10behavioral_S11sine_buffer,NULL); tmpml.signal_map(":wr_en",NULL,vIN,L4work_E6master_A10behavioral_S14adc_fifo_wr_en,NULL); tmpml.signal_map(":rd_en",NULL,vIN,L4work_E6master_A10behavioral_S14adc_fifo_rd_en,NULL); tmpml.signal_map(":dout",NULL,vOUT,L4work_E6master_A10behavioral_S17adc_fifo_data_out,NULL); tmpml.signal_map(":full",NULL,vOUT); tmpml.signal_map(":empty",NULL,vOUT,L4work_E6master_A10behavioral_S14adc_fifo_empty,NULL); tmpml.signal_map(":prog_full",NULL,vOUT,L4work_E6master_A10behavioral_S18adc_fifo_prog_full,NULL); kernel.elaborate_component ("adc_fifo",NULL, NULL, iname, ":adc_fifo_inst", &tmpml, this, level);
    tmpml.reset(); tmpml.signal_map(":clk_in1",NULL,vIN,L4work_E6master_S3clk,NULL); tmpml.signal_map(":clk_100mhz",NULL,vOUT,L4work_E6master_A10behavioral_S12buffered_clk,NULL); tmpml.signal_map(":clk_10mhz",NULL,vOUT,L4work_E6master_A10behavioral_S7dds_clk,NULL); tmpml.signal_map(":vga_25mhz",NULL,vOUT,L4work_E6master_A10behavioral_S7vga_clk,NULL); kernel.elaborate_component ("dcm",NULL, NULL, iname, ":dcm_inst", &tmpml, this, level);
    tmpml.reset(); tmpml.signal_map(":clk",NULL,vIN,L4work_E6master_A10behavioral_S7dds_clk,NULL); tmpml.signal_map(":rst",NULL,vIN,L4work_E6master_S3rst,NULL); tmpml.signal_map(":phase_inc",NULL,vIN,L4work_E6master_A10behavioral_S9phase_inc,NULL); tmpml.signal_map(":sine_out",NULL,vOUT,L4work_E6master_A10behavioral_S11sine_buffer,NULL); kernel.elaborate_component ("test_signal_gen",NULL, NULL, iname, ":inst_test_signal_gen", &tmpml, this, level);
    tmpml.reset(); tmpml.signal_map(":clk",NULL,vIN,L4work_E6master_A10behavioral_S12buffered_clk,NULL); tmpml.signal_map(":rst",NULL,vIN,L4work_E6master_S3rst,NULL); tmpml.signal_map(":rx",NULL,vIN,L4work_E6master_S2rx,NULL); tmpml.signal_map(":leds",NULL,vOUT); tmpml.signal_map(":phase_inc",NULL,vOUT,L4work_E6master_A10behavioral_S9phase_inc,NULL); kernel.elaborate_component ("uart_comms",NULL, NULL, iname, ":inst_uart_comms", &tmpml, this, level);
    tmpml.reset(); tmpml.signal_map(":clk",NULL,vIN,L4work_E6master_A10behavioral_S12buffered_clk,NULL); tmpml.signal_map(":sclr",NULL,vIN,L4work_E6master_A10behavioral_S7fft_rst,NULL); tmpml.signal_map(":start",NULL,vIN,L4work_E6master_A10behavioral_S9fft_start,NULL); tmpml.signal_map(":unload",NULL,vIN,L4work_E6master_A10behavioral_S10fft_unload,NULL); tmpml.signal_map(":xn_re",NULL,vIN,L4work_E6master_A10behavioral_S17adc_fifo_data_out,NULL); tmpml.signal_map(":xn_im",NULL,vIN,const_pointer(array_alias<L4ieee_Q14std_logic_1164_T16std_logic_vector >(new array_info((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->element_type,(&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->index_type,7,downto,0,0),L4work_E6master_A10behavioral_itn20_lit)),(new array_info((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->element_type,(&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->index_type,7,downto,0,0))); tmpml.signal_map(":fwd_inv",NULL,vIN,const_pointer(enumeration(3)),(&L4ieee_Q14std_logic_1164_I10std_ulogic_INFO)); tmpml.signal_map(":fwd_inv_we",NULL,vIN,const_pointer(enumeration(3)),(&L4ieee_Q14std_logic_1164_I10std_ulogic_INFO)); tmpml.signal_map(":rfd",NULL,vOUT,L4work_E6master_A10behavioral_S7fft_rfd,NULL); tmpml.signal_map(":xn_index",NULL,vOUT,L4work_E6master_A10behavioral_S12fft_xn_index,NULL); tmpml.signal_map(":busy",NULL,vOUT,L4work_E6master_A10behavioral_S8fft_busy,NULL); tmpml.signal_map(":edone",NULL,vOUT,L4work_E6master_A10behavioral_S9fft_edone,NULL); tmpml.signal_map(":done",NULL,vOUT,L4work_E6master_A10behavioral_S8fft_done,NULL); tmpml.signal_map(":dv",NULL,vOUT,L4work_E6master_A10behavioral_S6fft_dv,NULL); tmpml.signal_map(":xk_index",NULL,vOUT,L4work_E6master_A10behavioral_S12fft_xk_index,NULL); tmpml.signal_map(":xk_re",NULL,vOUT,L4work_E6master_A10behavioral_S9fft_xk_re,NULL); tmpml.signal_map(":xk_im",NULL,vOUT,L4work_E6master_A10behavioral_S9fft_xk_im,NULL); tmpml.signal_map(":blk_exp",NULL,vOUT,L4work_E6master_A10behavioral_S11fft_blk_exp,NULL); kernel.elaborate_component ("fft",NULL, NULL, iname, ":fft_instance", &tmpml, this, level);
    tmpml.reset(); tmpml.signal_map(":clk",NULL,vIN,L4work_E6master_A10behavioral_S12buffered_clk,NULL); tmpml.signal_map(":rst",NULL,vIN,L4work_E6master_S3rst,NULL); tmpml.signal_map(":input_valid",NULL,vIN,L4work_E6master_A10behavioral_S6fft_dv,NULL); tmpml.signal_map(":re",NULL,vIN,L4work_E6master_A10behavioral_S9fft_xk_re,NULL); tmpml.signal_map(":im",NULL,vIN,L4work_E6master_A10behavioral_S9fft_xk_im,NULL); tmpml.signal_map(":idx_in",NULL,vIN,L4work_E6master_A10behavioral_S12fft_xk_index,NULL); tmpml.signal_map(":idx_out",NULL,vOUT,L4work_E6master_A10behavioral_S11mag_idx_out,NULL); tmpml.signal_map(":mag",NULL,vOUT,L4work_E6master_A10behavioral_S7mag_out,NULL); tmpml.signal_map(":output_valid",NULL,vOUT,L4work_E6master_A10behavioral_S16mag_output_valid,NULL); kernel.elaborate_component ("mag",NULL, NULL, iname, ":inst_mag", &tmpml, this, level);
    tmpml.reset(); tmpml.signal_map(":clka",NULL,vIN,L4work_E6master_A10behavioral_S12buffered_clk,NULL); tmpml.signal_map(":rsta",NULL,vIN,L4work_E6master_S3rst,NULL); tmpml.signal_map(":wea",NULL,vIN,const_pointer(concat<L4ieee_Q14std_logic_1164_T16std_logic_vector,enumeration>(L4ieee_Q14std_logic_1164_T16std_logic_vector(new array_info(L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO.element_type,L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO.index_type,0,to,0,0),(*L4work_E6master_A10behavioral_R16mag_output_valid)),array_alias<L4ieee_Q14std_logic_1164_T16std_logic_vector >(new array_info((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->element_type,(&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->index_type,0,to,0+-1,0),L4work_E6master_A10behavioral_itn21_lit))),(&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)); tmpml.signal_map(":addra",NULL,vIN,L4work_E6master_A10behavioral_S11mag_idx_out,NULL); tmpml.signal_map(":dina",NULL,vIN,L4work_E6master_A10behavioral_S7mag_out,NULL); tmpml.signal_map(":douta",NULL,vOUT); tmpml.signal_map(":clkb",NULL,vIN,L4work_E6master_A10behavioral_S7vga_clk,NULL); tmpml.signal_map(":web",NULL,vIN,const_pointer(L4ieee_Q14std_logic_1164_T16std_logic_vector(new array_info((new array_info((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->element_type,(&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->index_type,0,downto,0,0))->element_type,(new array_info((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->element_type,(&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->index_type,0,downto,0,0))->index_type,0,downto,0,0),enumeration(2))),(new array_info((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->element_type,(&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->index_type,0,downto,0,0))); tmpml.signal_map(":addrb",NULL,vIN,L4work_E6master_A10behavioral_S16vga_ram_out_addr,NULL); tmpml.signal_map(":dinb",NULL,vIN,const_pointer(L4ieee_Q14std_logic_1164_T16std_logic_vector(new array_info((new array_info((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->element_type,(&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->index_type,7,downto,0,0))->element_type,(new array_info((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->element_type,(&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->index_type,7,downto,0,0))->index_type,7,downto,0,0),enumeration(2))),(new array_info((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->element_type,(&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->index_type,7,downto,0,0))); tmpml.signal_map(":doutb",NULL,vOUT,L4work_E6master_A10behavioral_S16vga_ram_out_data,NULL); kernel.elaborate_component ("vga_ram",NULL, NULL, iname, ":your_instance_name", &tmpml, this, level);
    tmpml.reset(); tmpml.signal_map(":clk",NULL,vIN,L4work_E6master_A10behavioral_S7vga_clk,NULL); tmpml.signal_map(":rst",NULL,vIN,L4work_E6master_S3rst,NULL); tmpml.signal_map(":hs",NULL,vOUT,L4work_E6master_S2hs,NULL); tmpml.signal_map(":vs",NULL,vOUT,L4work_E6master_S2vs,NULL); tmpml.signal_map(":green",NULL,vOUT,L4work_E6master_S5green,NULL); tmpml.signal_map(":red",NULL,vOUT,L4work_E6master_S3red,NULL); tmpml.signal_map(":blue",NULL,vOUT,L4work_E6master_S4blue,NULL); tmpml.signal_map(":x_pos",NULL,vOUT,L4work_E6master_A10behavioral_S9vga_x_pos,NULL); tmpml.signal_map(":y_pos",NULL,vOUT,L4work_E6master_A10behavioral_S9vga_y_pos,NULL); tmpml.signal_map(":blue_in",NULL,vIN,L4work_E6master_A10behavioral_S11vga_blue_in,NULL); tmpml.signal_map(":red_in",NULL,vIN,L4work_E6master_A10behavioral_S10vga_red_in,NULL); tmpml.signal_map(":green_in",NULL,vIN,L4work_E6master_A10behavioral_S12vga_green_in,NULL); kernel.elaborate_component ("vga_configurable",NULL, NULL, iname, ":inst_vga_configurable", &tmpml, this, level);
    iname.pop(); /* pop last declaration from name stack */ iname.pop(); /* pop architecture from name stack */
};

/* Initialization function for architecture :work:master(behavioral) */
int L4work_E6master_init ();
int L3std_Q8standard_init ();
bool L4work_E6master_A10behavioral_init_done = false;
int L4work_E6master_A10behavioral_init(){
if (L4work_E6master_A10behavioral_init_done) return 1;
L4work_E6master_A10behavioral_init_done=true;
L4work_E6master_init ();
L3std_Q8standard_init ();
register_source_file("/home/main/FPGA_NIGHT/final_project/master.vhd","master.vhd");
name_stack iname;
iname.push("");
L4work_E6master_A10behavioral_I3_t6_INFO.set((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->element_type,parray_info((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO))->index_type,7,downto,0,-1).register_type(":work:master(behavioral)",":work:master(behavioral):_t6",":_t6",NULL);
L4work_E6master_A10behavioral_I3_t7_INFO.set((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->element_type,parray_info((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO))->index_type,13,downto,0,-1).register_type(":work:master(behavioral)",":work:master(behavioral):_t7",":_t7",NULL);
L4work_E6master_A10behavioral_I3_t8_INFO.set((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->element_type,parray_info((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO))->index_type,7,downto,0,-1).register_type(":work:master(behavioral)",":work:master(behavioral):_t8",":_t8",NULL);
L4work_E6master_A10behavioral_I3_t9_INFO.set((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->element_type,parray_info((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO))->index_type,7,downto,0,-1).register_type(":work:master(behavioral)",":work:master(behavioral):_t9",":_t9",NULL);
L4work_E6master_A10behavioral_I4_t10_INFO.set((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->element_type,parray_info((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO))->index_type,8,downto,0,-1).register_type(":work:master(behavioral)",":work:master(behavioral):_t10",":_t10",NULL);
L4work_E6master_A10behavioral_I4_t11_INFO.set((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->element_type,parray_info((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO))->index_type,4,downto,0,-1).register_type(":work:master(behavioral)",":work:master(behavioral):_t11",":_t11",NULL);
L4work_E6master_A10behavioral_I4_t12_INFO.set((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->element_type,parray_info((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO))->index_type,8,downto,0,-1).register_type(":work:master(behavioral)",":work:master(behavioral):_t12",":_t12",NULL);
L4work_E6master_A10behavioral_I4_t13_INFO.set((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->element_type,parray_info((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO))->index_type,7,downto,0,-1).register_type(":work:master(behavioral)",":work:master(behavioral):_t13",":_t13",NULL);
L4work_E6master_A10behavioral_I4_t16_INFO.set((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO)->element_type,parray_info((&L4ieee_Q14std_logic_1164_I16std_logic_vector_INFO))->index_type,0,downto,0,-1).register_type(":work:master(behavioral)",":work:master(behavioral):_t16",":_t16",NULL);
L4work_E6master_A10behavioral_I11adc_state_t_INFO.register_type(":work:master(behavioral)",":work:master(behavioral):adc_state_t",":adc_state_t",NULL);
L4work_E6master_A10behavioral_I11fft_state_t_INFO.register_type(":work:master(behavioral)",":work:master(behavioral):fft_state_t",":fft_state_t",NULL);
iname.pop();
return 1;
}

/* end of :work:master(behavioral) Architecture */
