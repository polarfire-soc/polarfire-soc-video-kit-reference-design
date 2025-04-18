# PolarFire® SoC Video Kit - Reference Design Generation Using Tcl Scripts and Libero® SoC Design Suite

## Table of Contents

- [PolarFire&reg; SoC Video Kit Reference Design Generation Tcl Scripts - Libero&reg; SoC](#polarfire-soc-video-kit-reference-design-generation-tcl-scripts---libero-soc)
  - [Table of Contents](#table-of-contents)
  - [Description](#description)
  - [Using the reference design generation Tcl scripts](#using-the-reference-design-generation-tcl-script)
    - [Licensing](#licensing)
    - [Reference Design Generation](#reference-design-generation)
    - [Arguments supported](#arguments-supported)
    - [Argument based design generation](#argument-based-design-generation)
    	- [Design Generation Example](#design-generation-example)
  - [Programming the FPGA](#programming-the-fpga)
  - [Board configuration](#board-configuration)
  - [MSS Configuration](#mss-configuration)
  - [XML](#xml)
  - [Setting the boot mode and programming the eNVM](#setting-the-boot-mode-and-programming-the-envm)
    - [Boot mode 0](#boot-mode-0)
    - [Boot mode 1](#boot-mode-1)
      - [Boot mode 1: SoftConsole](#boot-mode-1-softconsole)
      - [Boot mode 1: Libero SoC](#boot-mode-1-libero-soc)

<a name="description"></a>
## Description

This repository can be used to generate reference designs, corresponding to reference solutions, for the PolarFire SoC Video Kit. These reference designs will have the same or extended functionality compared to the pre-programmed FPGA design on the Video Kit. More details on these reference designs or reference solutions are available in the upcoming sections.

A base-level, Libero SoC Tcl script, viz., MPFS_VIDEO_KIT_REFERENCE_DESIGN.tcl, is provided to choose the reference design to be generated by the next level script. Based on the argument passed to the above script, for example, H264_MM, RAW_BAYER or TSN, the corresponding next-level script generates the reference design using Libero SoC, along with device specific I/O constraints.

This repository supports Libero SoC Design Suite versions v2023.2 or v2024.1, based on the reference design selected. For details, refer to the release notes [here](https://github.com/polarfire-soc/polarfire-soc-video-kit-reference-design/releases).

The Libero SoC Design Suite versions are available for download [here](https://www.microchip.com/en-us/products/fpgas-and-plds/fpga-and-soc-design-tools/fpga/libero-software-later-versions#Documents%20and%20Downloads) .


<a name="licensing"></a>
### Licensing

The Reference Designs in the Video Kit can be generated using any of the free or paid Libero licenses. Licensing information is available on the Microchip website [here](https://www.microchip.com/en-us/products/fpgas-and-plds/fpga-and-soc-design-tools/fpga/licensing).

One or more of the IPs included in the design could be licensed as well. For example, the H.264 I-Frame Encoder Encrypted IP is Licensed. If the license is not available, the TCL generates the design with an Evaluation license which expires after an hour’s use on the hardware. Hence, the video streaming would stop after an hour of operation.

<a name="using-the-reference-design-generation-tcl-script"></a>
## Using the reference design generation Tcl scripts

<a name="reference-design-generation"></a>
### Reference Design Generation

To generate a reference design, following flow can be used:

1. Clone or download the repository
2. Open the respective Libero version based on the desired reference design, refer [Release notes](https://github.com/polarfire-soc/polarfire-soc-video-kit-reference-design/releases).
3. Open the execute script dialog (CTRL + U)
4. Execute the base-level Tcl script, i.e., "MPFS_VIDEO_KIT_REFERENCE_DESIGN.tcl" with the required arguments. Refer to the below section for argument list and examples. **Note:** If no design-based argument is provided to the base Tcl script, it would pick "MPFS_VIDEO_KIT_REFERENCE_DESIGN.tcl" by default, which is the legacy H.264 design.
5. Configure the design if required
6. Run the Libero SoC design flow to program a device

<a name="arguments-supported"></a>
### Arguments supported

Following arguments are supported to modify or configure aspects of the Libero SoC design flow:

| Argument                  | Description                                                                                                                                |
| :------------------------ | :------------------------------------------------------------------------------------------------------------------------------------------|
| HSS_UPDATE                | Downloads the HSS release hex file associated with this release of the reference design. <br>The hex file is added as an eNVM client in Libero. <br>This argument requires wget to be installed. <br>This is installed by default on most Linux systems, on Windows® wget (version 1.14 or above) <br>should be installed and added to the system path, steps are shown in the following [guide](https://www.addictivetips.com/windows-tips/install-and-use-wget-in-windows-10/) |
| SYNTHESIZE                | Runs the synthesis step after design generation has completed                                                         |
| PLACEROUTE                | Runs the synthesis and place and route steps after design generation has completed                                    |
| VERIFY_TIMING             | Runs the synthesis, place and route and timing verification steps after design generation has completed               |
| GENERATE_PROGRAMMING_DATA | Generates the files required to generate a bitstream for programming a device                                         |
| PROGRAM                   | Runs the full design flow after generating a design and programs a connected device. <br>Note: the device must be connected when the "Run PROGRAM Action" stage of the design flow is reached and only one device should be connected |
| EXPORT_FPE                | Runs the full design flow after generating a design and exports a FlashPro Express file to the local directory
| SPIFLASH_DATA             | Adds the data client to the SPI Flash to pick the dtbo file based on the design selection               |


<a name="argument-based-design-generation"></a>
### Argument based design generation

Each reference design in this repository corresponds to a reference solution. A reference solution consists of the hardware (video kit and any additional peripherals), the reference fabric design and the corresponding software available across the other [polarfire-soc repositories](https://github.com/polarfire-soc). The reference design can be generated by passing the relevant argument to the base level Tcl script. 
Following reference design arguments are supported:

| Design                  | Description                                                                                                                                |
| :-----------------------| :------------------------------------------------------------------------------------------------------------------------------------------|
| RAW_BAYER               | This argument would generate a reference design corresponding to a raw-bayer camera pipeline, which would consist of the following IPs <br> Imx334 camera (SRGGB10 format /dev/v4l-subdev0) --> MIPI CSI2 IP (serial data to parallel data /dev/v4l-subdev1) --> Video DMA IP (/dev/video0). For more information, refer [here](https://github.com/polarfire-soc/polarfire-soc-linux-examples/tree/master/multimedia/v4l2). Also, it is a must to use the SPIFLASH_DATA argument with this, during design generation. |
| H264_MM                 | This argument would generate a reference design corresponding to a modular H264 pipeline, which would consist of the following IP's <br> Camera → MIPI  → GVPC (Mono2RGB) → Image-Enhancement → Scaler → OSD → GVPC (RGB2YUV420) → H.264 → Video-Capture (/dev/video0). For more information, refer [here](https://github.com/polarfire-soc/polarfire-soc-documentation/blob/master/applications-and-demos/mpfs-video-kit-h264-modular-pipeline-demo.md). Also, it is a must to use the SPIFLASH_DATA argument with this, during design generation. |
| TSN                     | This argument would generate a reference design corresponding to a time sensitive networking solution pipeline, which consists of CORETSN, CORE1588, CORESGMII and COREAXI4PROTOCONV IP's. For more information, refer [here](App Note Link). Also, it is a must to use the SPIFLASH_DATA argument with this, during design generation. |

<a name="design-generation-example"></a>
### Design Generation Example

The following is a typical example of generating a design with an argument based approach for TSN:

TSN SYNTHESIZE PLACEROUTE VERIFY_TIMING HSS_UPDATE SPIFLASH_DATA EXPORT_FPE

<a name="programming-the-fpga"></a>
## Programming the FPGA

Once the script has completed the design can be configured further if needed and the Libero SoC design flow can be run by double clicking on a stage in the design flow on the left hand side of Libero. Selecting an option requiring previous steps to be completed will run the full flow, i.e double clicking "Run Program Action" will run any required steps, such as, "Synthesize", "Place and Route", etc and then program the device.

<a name="board-configuration"></a>
## Board configuration

Setting up the jumpers on the PolarFire SoC Video Kit, refer to the [Video Kit user's guide](https://mi-v-ecosystem.github.io/redirects/boards-mpfs-sev-kit-sev-kit-user-guide).
The latest Linux images for the PolarFire SoC Video Kit are available from the releases section of the [Meta PolarFire SoC Yocto BSP](https://mi-v-ecosystem.github.io/redirects/releases-meta-polarfire-soc-yocto-bsp) repository.

<a name="mss-configuration"></a>
## MSS Configuration

The Microprocessor Subsystem (MSS) is configured using the PolarFire SoC MSS Configurator.
This software tool takes user inputs and generates an MSS configuration file (.xml) along with an MSS component file (.cxz).
The XML file is used by the PolarFire SoC Configuration Generator to generate configuration header files for bare metal applications.
The MSS component file can be imported into a Libero SoC design and used in the FPGA design flow.

A saved configuration for the PolarFire SoC MSS Configurator is available in the "script_support" folder and can be opened by the PolarFire SoC MSS Configurator. These configurations will match the MSS configuration used in the design and can be used to regenerate XML and a Libero component. For argument based designs, MSS configuration files will be generated in the script_support/MSS_VIDEO_KIT/[configuration name] directory when a design is generated.

<a name="xml"></a>
## XML

The Microcontroller Subsystem (MSS) configuration is captured in an XML file that is then used by the PolarFire SoC Configuration Generator to generate configuration header files. These header files are compiled as part of the MPFS HAL startup code to configure the system at power on.

XML generated for all available configurations is provided in the "XML" folder.

<a name="setting-the-spi-data-client-for-dt-overlay"></a>
## Setting the spi data client for dt overlay

Run the below command to generate spi data client for dt overlay:

```
python generate_overlays_spiclient_data.py <build arg>
```
where,
**build arg** should be one among: H264, RAW_BAYER, H264_MM or TSN.

H264 = H.264 Compact Design

RAW_BAYER = Raw Bayer Design


H264_MM = New H.264 Modular Design


TSN = Time Sensitive Networking Design

Example: If H.264 Compact Design SPI Client Data is required, then run the following command:

```
python generate_overlays_spiclient_data.py H264
```
Above command will generate mpfs_dtbo.bin file to be used as SPI Data Client

**NOTE:** If it is required to run this in windows we need to run in the WSL environment and all required pakages should be installed in the WSL (device-tree-compiler, wget, gcc and python).

WSL installation instructions [here](https://learn.microsoft.com/en-us/windows/wsl/install)

<a name="setting-the-boot-mode-and-programming-the-envm"></a>
## Setting the boot mode and programming the eNVM

<a name="boot-mode-0"></a>
### Boot mode 0

Boot mode 0 will put all of the MSS cores into WFI (Wait For Interrupt) mode on power on, the cores will not boot until debugged. SoftConsole v6.5 or later can be used to set the PolarFire SoC boot mode to 0:

1. Connect the board to the PC using the embedded FlashPro6 or an external FlashPro and power on the board
2. In SoftConsole select the "External Tool" drop down menu
3. Select the "PolarFire SoC idle boot mode 0" configuration and run

<a name="boot-mode-1"></a>
### Boot mode 1

Boot mode 1 configures all of the MSS cores to boot from the eNVM, when setting the boot mode to 1 an eNVM client must also be provided An eNVM client can be a zero stage boot loader, such as the HSS, or a bare metal application. SoftConsole v6.4 and above or Libero SoC v12.6 and above can be used to set the boot mode and program the eNVM.

Build the bare metal application using the reference XML provided to configure the MPFS HAL (XML will also be generated in the script_support/components/[target] folder when an MSS component is generated as part of the flow).

<a name="boot-mode-1-softconsole"></a>
#### Boot mode 1: SoftConsole

To set the PolarFire SoC boot mode to 1 and program an eNVM client in SoftConsole:

1. Select the project folder of the application to be used as an eNVM client in the project explorer
2. Connect the board to the PC using the embedded FlashPro6 or an external FlashPro and power on the board
3. In SoftConsole select the "External Tool" drop down menu
4. Select the "PolarFire SoC non-secure boot mode 1" configuration and run

<a name="boot-mode-1-libero-soc"></a>
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
