pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E107 : Short_Integer; pragma Import (Ada, E107, "ada__tags_E");
   E098 : Short_Integer; pragma Import (Ada, E098, "ada__strings__text_buffers_E");
   E096 : Short_Integer; pragma Import (Ada, E096, "system__bb__timing_events_E");
   E030 : Short_Integer; pragma Import (Ada, E030, "ada__exceptions_E");
   E049 : Short_Integer; pragma Import (Ada, E049, "system__soft_links_E");
   E047 : Short_Integer; pragma Import (Ada, E047, "system__exception_table_E");
   E154 : Short_Integer; pragma Import (Ada, E154, "ada__streams_E");
   E161 : Short_Integer; pragma Import (Ada, E161, "system__finalization_root_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "ada__finalization_E");
   E163 : Short_Integer; pragma Import (Ada, E163, "system__storage_pools_E");
   E158 : Short_Integer; pragma Import (Ada, E158, "system__finalization_masters_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "ada__real_time_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "system__bb__execution_time_E");
   E165 : Short_Integer; pragma Import (Ada, E165, "system__pool_global_E");
   E228 : Short_Integer; pragma Import (Ada, E228, "system__tasking__protected_objects_E");
   E127 : Short_Integer; pragma Import (Ada, E127, "system__tasking__restricted__stages_E");
   E156 : Short_Integer; pragma Import (Ada, E156, "hal__gpio_E");
   E188 : Short_Integer; pragma Import (Ada, E188, "hal__i2c_E");
   E181 : Short_Integer; pragma Import (Ada, E181, "hal__spi_E");
   E192 : Short_Integer; pragma Import (Ada, E192, "hal__uart_E");
   E201 : Short_Integer; pragma Import (Ada, E201, "memory_barriers_E");
   E199 : Short_Integer; pragma Import (Ada, E199, "cortex_m__nvic_E");
   E218 : Short_Integer; pragma Import (Ada, E218, "nrf__events_E");
   E147 : Short_Integer; pragma Import (Ada, E147, "nrf__gpio_E");
   E220 : Short_Integer; pragma Import (Ada, E220, "nrf__gpio__tasks_and_events_E");
   E222 : Short_Integer; pragma Import (Ada, E222, "nrf__interrupts_E");
   E176 : Short_Integer; pragma Import (Ada, E176, "nrf__rtc_E");
   E179 : Short_Integer; pragma Import (Ada, E179, "nrf__spi_master_E");
   E205 : Short_Integer; pragma Import (Ada, E205, "nrf__tasks_E");
   E203 : Short_Integer; pragma Import (Ada, E203, "nrf__adc_E");
   E241 : Short_Integer; pragma Import (Ada, E241, "nrf__clock_E");
   E224 : Short_Integer; pragma Import (Ada, E224, "nrf__ppi_E");
   E183 : Short_Integer; pragma Import (Ada, E183, "nrf__timers_E");
   E186 : Short_Integer; pragma Import (Ada, E186, "nrf__twi_E");
   E190 : Short_Integer; pragma Import (Ada, E190, "nrf__uart_E");
   E137 : Short_Integer; pragma Import (Ada, E137, "nrf__device_E");
   E194 : Short_Integer; pragma Import (Ada, E194, "microbit__console_E");
   E196 : Short_Integer; pragma Import (Ada, E196, "microbit__iosfortasking_E");
   E239 : Short_Integer; pragma Import (Ada, E239, "microbit__timehighspeed_E");
   E246 : Short_Integer; pragma Import (Ada, E246, "mymotordriver_E");
   E244 : Short_Integer; pragma Import (Ada, E244, "taskact_E");
   E237 : Short_Integer; pragma Import (Ada, E237, "ultrasonic_E");
   E235 : Short_Integer; pragma Import (Ada, E235, "mybrain_E");
   E248 : Short_Integer; pragma Import (Ada, E248, "tasksense_E");
   E250 : Short_Integer; pragma Import (Ada, E250, "taskthink_E");

   Sec_Default_Sized_Stacks : array (1 .. 4) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (Ada, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := 2;
      Time_Slice_Value := 0;
      WC_Encoding := 'b';
      Locking_Policy := 'C';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := 'F';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 1;
      Default_Stack_Size := -1;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 4;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Ada.Strings.Text_Buffers'Elab_Spec;
      E098 := E098 + 1;
      System.Bb.Timing_Events'Elab_Spec;
      E096 := E096 + 1;
      Ada.Exceptions'Elab_Spec;
      System.Soft_Links'Elab_Spec;
      Ada.Tags'Elab_Body;
      E107 := E107 + 1;
      System.Exception_Table'Elab_Body;
      E047 := E047 + 1;
      E049 := E049 + 1;
      E030 := E030 + 1;
      Ada.Streams'Elab_Spec;
      E154 := E154 + 1;
      System.Finalization_Root'Elab_Spec;
      E161 := E161 + 1;
      Ada.Finalization'Elab_Spec;
      E159 := E159 + 1;
      System.Storage_Pools'Elab_Spec;
      E163 := E163 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E158 := E158 + 1;
      Ada.Real_Time'Elab_Body;
      E131 := E131 + 1;
      System.Bb.Execution_Time'Elab_Body;
      E129 := E129 + 1;
      System.Pool_Global'Elab_Spec;
      E165 := E165 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E228 := E228 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E127 := E127 + 1;
      HAL.GPIO'ELAB_SPEC;
      E156 := E156 + 1;
      HAL.I2C'ELAB_SPEC;
      E188 := E188 + 1;
      HAL.SPI'ELAB_SPEC;
      E181 := E181 + 1;
      HAL.UART'ELAB_SPEC;
      E192 := E192 + 1;
      E201 := E201 + 1;
      E199 := E199 + 1;
      E218 := E218 + 1;
      Nrf.Gpio'Elab_Spec;
      Nrf.Gpio'Elab_Body;
      E147 := E147 + 1;
      E220 := E220 + 1;
      E222 := E222 + 1;
      E176 := E176 + 1;
      Nrf.Spi_Master'Elab_Spec;
      Nrf.Spi_Master'Elab_Body;
      E179 := E179 + 1;
      E205 := E205 + 1;
      E203 := E203 + 1;
      E241 := E241 + 1;
      E224 := E224 + 1;
      Nrf.Timers'Elab_Spec;
      Nrf.Timers'Elab_Body;
      E183 := E183 + 1;
      Nrf.Twi'Elab_Spec;
      Nrf.Twi'Elab_Body;
      E186 := E186 + 1;
      Nrf.Uart'Elab_Spec;
      Nrf.Uart'Elab_Body;
      E190 := E190 + 1;
      Nrf.Device'Elab_Spec;
      Nrf.Device'Elab_Body;
      E137 := E137 + 1;
      Microbit.Console'Elab_Body;
      E194 := E194 + 1;
      Microbit.Iosfortasking'Elab_Spec;
      Microbit.Iosfortasking'Elab_Body;
      E196 := E196 + 1;
      Microbit.Timehighspeed'Elab_Body;
      E239 := E239 + 1;
      Mymotordriver'Elab_Spec;
      E246 := E246 + 1;
      Taskact'Elab_Spec;
      Taskact'Elab_Body;
      E244 := E244 + 1;
      E237 := E237 + 1;
      Mybrain'Elab_Spec;
      E235 := E235 + 1;
      Tasksense'Elab_Spec;
      Tasksense'Elab_Body;
      E248 := E248 + 1;
      Taskthink'Elab_Spec;
      Taskthink'Elab_Body;
      E250 := E250 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   procedure main is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
   end;

--  BEGIN Object file/option list
   --   C:\Users\kevin\Documents\git-repos\Ada_Drivers_Library\examples\MicroBit_v2\ravenscar\tasking_project_sense_think_act\obj\mymotordriver.o
   --   C:\Users\kevin\Documents\git-repos\Ada_Drivers_Library\examples\MicroBit_v2\ravenscar\tasking_project_sense_think_act\obj\taskact.o
   --   C:\Users\kevin\Documents\git-repos\Ada_Drivers_Library\examples\MicroBit_v2\ravenscar\tasking_project_sense_think_act\obj\ultrasonic.o
   --   C:\Users\kevin\Documents\git-repos\Ada_Drivers_Library\examples\MicroBit_v2\ravenscar\tasking_project_sense_think_act\obj\mybrain.o
   --   C:\Users\kevin\Documents\git-repos\Ada_Drivers_Library\examples\MicroBit_v2\ravenscar\tasking_project_sense_think_act\obj\tasksense.o
   --   C:\Users\kevin\Documents\git-repos\Ada_Drivers_Library\examples\MicroBit_v2\ravenscar\tasking_project_sense_think_act\obj\taskthink.o
   --   C:\Users\kevin\Documents\git-repos\Ada_Drivers_Library\examples\MicroBit_v2\ravenscar\tasking_project_sense_think_act\obj\mycontroller.o
   --   C:\Users\kevin\Documents\git-repos\Ada_Drivers_Library\examples\MicroBit_v2\ravenscar\tasking_project_sense_think_act\obj\main.o
   --   -LC:\Users\kevin\Documents\git-repos\Ada_Drivers_Library\examples\MicroBit_v2\ravenscar\tasking_project_sense_think_act\obj\
   --   -LC:\Users\kevin\Documents\git-repos\Ada_Drivers_Library\examples\MicroBit_v2\ravenscar\tasking_project_sense_think_act\obj\
   --   -LC:\Users\kevin\Documents\git-repos\Ada_Drivers_Library\boards\MicroBit_v2\obj\full_lib_Debug\
   --   -LC:\gnat\2021-arm-elf\arm-eabi\lib\gnat\ravenscar-full-nrf52833\adalib\
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
