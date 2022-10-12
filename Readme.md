# PolarFire&reg; SoC Sev Kit Reference Design Generation Tcl Scripts - Libero&reg; SoC v2022.2

## Description

This repository can be used to generate a reference design for the PolarFire SoC Sev Kit. This reference design will have the same or extended functionality compared to the pre-programmed FPGA design on the Sev Kit.

A Libero SoC Tcl script is provided to generate the reference design using Libero SoC along with device specific I/O constraints.

This repository supports Libero SoC v2022.2, which is available for download [here](https://www.microsemi.com/product-directory/design-resources/1750-libero-soc#downloads).

## Using the reference design generation Tcl script

#### Standard design generation

To generate the standard reference design which is capable of running the majority of bare metal example applications and run Linux&reg; the following flow can be used:

1. Clone or download the repository
2. Open Libero v2022.2
3. Open the execute script dialog (CTRL + U)
4. Execute the "MPFS_SEV_KIT_REFERENCE_DESIGN.tcl" script
5. Configure the design if required
6. Run the Libero SoC design flow to program a device

## Programming the FPGA

Once the script has completed the design can be configured further if needed and the Libero SoC design flow can be run by double clicking on a stage in the design flow on the left hand side of Libero. Selecting an option requiring previous steps to be completed will run the full flow, i.e double clicking "Run Program Action" will run any required steps, such as, "Synthesize", "Place and Route", etc and then program the device.

## Board configuration

Setting up the jumpers on the SEV Kit, refer to the [SEV Kit user's guide](https://mi-v-ecosystem.github.io/redirects/boards-mpfs-sev-kit-sev-kit-user-guide).
The latest Linux images for the SEV Kit are available from the releases section of the [Meta PolarFire SoC Yocto BSP](https://mi-v-ecosystem.github.io/redirects/releases-meta-polarfire-soc-yocto-bsp) repository.  

## MSS Configuration

The Microprocessor Subsystem (MSS) is configured using the PolarFire SoC MSS Configurator.
This software tool takes user inputs and generates an MSS configuration file (.xml) along with an MSS component file (.cxz).
The XML file is used by the PolarFire SoC Configuration Generator to generate configuration header files for bare metal applications.
The MSS component file can be imported into a Libero SoC design and used in the FPGA design flow.

A saved configuration for the PolarFire SoC MSS Configurator is available in the "script_support" folder and can be opened by the PolarFire SoC MSS Configurator. These configurations will match the MSS configuration used in the design and can be used to regenerate XML and a Libero component. For argument based designs, MSS configuration files will be generated in the script_support/MSS_SEV/[configuration name] directory when a design is generated.

## XML

The Microcontroller Subsystem (MSS) configuration is captured in an XML file that is then used by the PolarFire SoC Configuration Generator to generate configuration header files. These header files are compiled as part of the MPFS HAL startup code to configure the system at power on.

XML generated for all available configurations is provided in the "XML" folder.

## Setting the boot mode and programming the eNVM

### Boot mode 0

Boot mode 0 will put all of the MSS cores into WFI (Wait For Interrupt) mode on power on, the cores will not boot until debugged. SoftConsole v6.5 or later can be used to set the PolarFire SoC boot mode to 0:
1. Connect the board to the PC using the embedded FlashPro6 or an external FlashPro and power on the board
2. In SoftConsole select the "External Tool" drop down menu
3. Select the "PolarFire SoC idle boot mode 0" configuration and run

### Boot mode 1

Boot mode 1 configures all of the MSS cores to boot from the eNVM, when setting the boot mode to 1 an eNVM client must also be provided An eNVM client can be a zero stage boot loader, such as the HSS, or a bare metal application. SoftConsole v6.4 and above or Libero SoC v12.6 and above can be used to set the boot mode and program the eNVM.

Build the bare metal application using the reference XML provided to configure the MPFS HAL (XML will also be generated in the script_support/components/[target] folder when an MSS component is generated as part of the flow).

#### Boot mode 1: SoftConsole

To set the PolarFire SoC boot mode to 1 and program an eNVM client in SoftConsole:
1. Select the project folder of the application to be used as an eNVM client in the project explorer
2. Connect the board to the PC using the embedded FlashPro6 or an external FlashPro and power on the board
3. In SoftConsole select the "External Tool" drop down menu
4. Select the "PolarFire SoC non-secure boot mode 1" configuration and run

#### Boot mode 1: Libero SoC

To set the PolarFire SoC boot mode to 1 and program and eNVM client in Libero:
1. Run the Libero SoC design flow so that "Generate FPGA Array Data" has completed and open the "Configure Design Initialization Data and Memories" tool
2. Select the "eNVM" tab
3. Select the "Add ..." option and select "Add Boot Mode 1" client
4. Navigate to the binary file to be used as a client and select ok
5. Save and add the client
6. Run the remainder of the Libero SoC design flow and program the device

Linux® is the registered trademark of Linus Torvalds in the U.S. and other countries.
Raspberry Pi is a trademark of the Raspberry Pi Foundation.
All other trademarks are the property of their respective owners.
