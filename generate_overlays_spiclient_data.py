import os
import struct
import ctypes
import sys
import subprocess

from gather_dtso import gather_dtso

global dtbo_info


def gen_magic():
    global dtbo_info
    struct.pack_into('cccc', dtbo_info, 0, b'M', b'C', b'H', b'P')


def gen_descriptor_length(no_of_contexts):
    global dtbo_info
    # - 12 bytes for the static part of the description
    # - 4 bytes for a each context's dtbo struct's address
    descriptor_length = 12 + (4 * no_of_contexts)
    struct.pack_into('I', dtbo_info, 4, descriptor_length)

    return descriptor_length

# 2 bytes longs version number
def gen_version():
    global dtbo_info
    version = 0
    struct.pack_into('H', dtbo_info, 8, version)


def gen_number_of_contexts(no_of_contexts):
    global dtbo_info
    in_number_of_contexts = no_of_contexts
    struct.pack_into('H', dtbo_info, 10, in_number_of_contexts)


def get_dtbo_files_list(build_option_dir):
    initial_directory = os.getcwd()
    context_dir = os.path.join(initial_directory, "work", build_option_dir, "dtbo", "context-0")
    dtbo_files_list = []
    for root, dirs, files in os.walk(context_dir):
        for file in files:
            if file.endswith(".dtbo"):
                dtbo_files_list.append(os.path.join(root, file))
    return dtbo_files_list


def get_dtbo_total_size(dtbo_list):
    size = 0
    for dtbo_file in dtbo_list:
        size = size + os.path.getsize(dtbo_file)
    return size


def gen_dtbo_info(overlay_dir_path, dtbo_list, dtbo_desc_list_start_offset):
    struct.pack_into('I', dtbo_info, 12, dtbo_desc_list_start_offset)
    no_of_dtbo = len(dtbo_list)
    struct.pack_into('I', dtbo_info, 16, no_of_dtbo)
    dtbo_data_offset = 20 + (no_of_dtbo * 12)
    dtbo_idx = 0
    for dtbo_file in dtbo_list:
        size = os.path.getsize(dtbo_file)
        struct.pack_into('I', dtbo_info, 20 + (dtbo_idx * 12), dtbo_data_offset)
        struct.pack_into('I', dtbo_info, 24 + (dtbo_idx * 12), dtbo_data_offset + size)
        struct.pack_into('I', dtbo_info, 28 + (dtbo_idx * 12), size)
        dtbo_data_offset += size
        dtbo_idx += 1

    dtbo_full_path = os.path.join(overlay_dir_path, "mpfs_dtbo.bin")
    with open(dtbo_full_path, "wb") as mpfs_dtbo:
        mpfs_dtbo.write(dtbo_info)

    #
    # Append the actual dtbo files to the dtbo_file
    #
    with open(dtbo_full_path, "ab") as mpfs_dtbo:
        for dtbo_file in dtbo_list:
            with open(dtbo_file, "rb") as in_dtbo_file:
                mpfs_dtbo.write(in_dtbo_file.read())


def create_dtbo_info(overlay_dir_path, build_option_dir):
    global dtbo_info

    dtbo_list = get_dtbo_files_list(build_option_dir)
    print("number of gateware device tree overlays: ", len(dtbo_list))
    for dtbo_file in dtbo_list:
        print(dtbo_file)
    no_of_contexts = 1
    no_of_dtbo = len(dtbo_list)

    #
    # Generate the DTBO info binary.
    # - 12 bytes for the static part of the description
    # - 4 bytes for a single context for dtbo struct's address
    # - 4 bytes for the number of dtbs in the single contexts dtbo struct
    # - 12 bytes per dtbo for start/end addresses and the size of the dtbo
    #
    dtbo_info_length = 12 + 4 + 4 + (12 * no_of_dtbo)

    dtbo_info = ctypes.create_string_buffer(dtbo_info_length)
    gen_magic()
    descriptor_length = gen_descriptor_length(no_of_contexts=1)
    gen_version()
    gen_number_of_contexts(no_of_contexts=1)
    # For a single context, can pack the dtbo struct in directly after the
    # descriptor
    dtbo_desc_list_start_offset = descriptor_length
    gen_dtbo_info(overlay_dir_path, dtbo_list, dtbo_desc_list_start_offset)
    print(dtbo_info[:])


def download_devicetree_rebasing(work_dir):
    devicetree_rebasing = os.path.join(work_dir, 'devicetree_rebasing')
    if not os.path.exists(devicetree_rebasing):
        os.makedirs(devicetree_rebasing)
        cmd = 'wget -O work/devicetree-rebasing_6.1.tar.gz https://kernel.googlesource.com/pub/scm/linux/kernel/git/devicetree/devicetree-rebasing.git/+archive/a79c60ad06c0264c627993dbaa73650befe2c3ec.tar.gz'
        print(cmd)
        os.system(cmd)
        cmd = "tar -xvf work/devicetree-rebasing_6.1.tar.gz -C work/devicetree_rebasing"
        print(cmd)
        os.system(cmd)

def compile_dtso(work_dir, build_option_dir):
    root_dir = os.path.join(work_dir, build_option_dir, 'dtbo', 'context-0')
    print(root_dir)
    for root, dirs, files in os.walk(root_dir):
        for file in files:
            if file.endswith(".dtso"):
                dtso_file = os.path.join(root, file)
                dtso_pre_file = os.path.splitext(dtso_file)[0] + '.dtso.preprocessed'
                dtbo_file = os.path.splitext(dtso_file)[0] + '.dtbo'
                cmd = 'cpp -nostdinc -I ' + work_dir + '/devicetree_rebasing/include ' +  '-I arch  -undef -x assembler-with-cpp ' + dtso_file + ' ' +  dtso_pre_file
                print(cmd)
                os.system(cmd)
                cmd = 'dtc -O dtb -I dts -o ' + dtbo_file + ' ' + dtso_pre_file
                print(cmd)
                os.system(cmd)


def generate_device_tree_overlays(overlay_dir_path, build_option_dir):
    print("================================================================================")
    print("                            Generate Device Tree Overlays")
    print("================================================================================\r\n", flush=True)
    bitstream_builder_root = os.getcwd()
    work_dir = os.path.join(bitstream_builder_root, 'work')
    dtso_src_dir = os.path.join(bitstream_builder_root, 'script_support', 'dtso_overlay')
    gather_dtso(dtso_src_dir, work_dir, build_option_dir)
    download_devicetree_rebasing(work_dir)
    compile_dtso(work_dir, build_option_dir)
    create_dtbo_info(overlay_dir_path, build_option_dir)


def generate_gateware_overlays(overlay_dir_path, build_options_list):
    generate_device_tree_overlays(overlay_dir_path, build_options_list)


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("One arguments expected: build option directory paths.")
        exit()

    argumentList = sys.argv[1:]
    build_option_dir = argumentList[0]

    generate_device_tree_overlays(os.path.join(os.getcwd()), build_option_dir)
