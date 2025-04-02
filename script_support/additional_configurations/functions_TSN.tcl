proc create_eNVM_config {config client} {
    set envm_config [open $config w]
    
    puts $envm_config "set_plain_text_client \\"
    puts $envm_config "-client_name {BOOT_MODE_1_ENVM_CLIENT} \\"
    puts $envm_config "-number_of_bytes 117248 \\"
    puts $envm_config "-content_type {MEMORY_FILE} \\"
    puts $envm_config "-content_file_format {Intel-Hex} \\"
    puts $envm_config "-content_file {$client} \\"
    puts $envm_config "-mem_file_base_address {0x20220000} \\"
    puts $envm_config "-start_page 0 \\"
    puts $envm_config "-use_for_simulation 0 \\"
    puts $envm_config "-reprogram 1 \\"
    puts $envm_config "-use_as_rom 0 \\"
    puts $envm_config "-fabric_access_read 1 \\"
    puts $envm_config "-fabric_access_write 0 \\"
    puts $envm_config "-mss_access_read 1 \\"
    puts $envm_config "-mss_access_write 0"

    close $envm_config
}

proc export_fpe_job {name directory components} {
    export_prog_job \
        -job_file_name $name \
        -export_dir $directory \
        -bitstream_file_type {TRUSTED_FACILITY} \
        -bitstream_file_components $components \
        -zeroization_likenew_action 0 \
        -zeroization_unrecoverable_action 0 \
        -program_design 1 \
        -program_spi_flash 1 \
        -include_plaintext_passkey 0 \
        -design_bitstream_format {PPD} \
        -prog_optional_procedures {} \
        -skip_recommended_procedures {} \
        -sanitize_snvm 0 \
        -sanitize_envm 0
}

proc create_spiflash {spiflash src_path} {
    set spiflash [open $spiflash w]

    puts $spiflash "set_auto_update_mode {0} "
    puts $spiflash "set_spi_flash_memory_size {134217728} "
    puts $spiflash "set_client \ \\"
    puts $spiflash "-client_name    {DT_Overlay} \ \\"
    puts $spiflash "-client_type    {FILE_DATA_STORAGE_PLAIN_BIN} \ \\"
    puts $spiflash "-content_type   {MEMORY_FILE} \ \\"
    puts $spiflash "-content_file   {$src_path/mpfs_dtbo.bin} \ \\"
    puts $spiflash "-start_address  {1024} \ \\"
    puts $spiflash "-client_size    {6774} \ \\"
    puts $spiflash "-program        {1} "

    close $spiflash
}
