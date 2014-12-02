/* Main function for architecture :work:master(behavioral) */
#include<freehdl/kernel-handle.hh>
int main (int argc, char *argv[]) 

{
  extern handle_info *L4work_E6master_A10behavioral_hinfo;
  extern int kernel_main (int, char *[], handle_info*);
  return kernel_main (argc, argv, L4work_E6master_A10behavioral_hinfo);
}

/* end of :work:master(behavioral) main function */
