#  NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE
#  This is an automatically generated file by osboxes on Thu 20 Feb 01:56:03 EST 2020
# 
#  cmd:    swerv -snapshot=pynqz2 -ret_stack_size=8 -iccm_enable=0 dccm_enable=0 -fpga_optimize = 1 
# 
# To use this in a perf script, use 'require $RV_ROOT/configs/config.pl'
# Reference the hash via $config{name}..


%config = (
            'pic' => {
                       'pic_bits' => 15,
                       'pic_base_addr' => '0xf00c0000',
                       'pic_meie_offset' => '0x2000',
                       'pic_total_int_plus1' => 9,
                       'pic_meip_offset' => '0x1000',
                       'pic_mpiccfg_offset' => '0x3000',
                       'pic_total_int' => 8,
                       'pic_meigwctrl_offset' => '0x4000',
                       'pic_size' => 32,
                       'pic_meipl_offset' => '0x0000',
                       'pic_int_words' => 1,
                       'pic_region' => '0xf',
                       'pic_offset' => '0xc0000',
                       'pic_meigwclr_offset' => '0x5000',
                       'pic_meipt_offset' => '0x3004'
                     },
            'regwidth' => '32',
            'numiregs' => '32',
            'bus' => {
                       'lsu_bus_tag' => 4,
                       'dma_bus_tag' => '1',
                       'sb_bus_tag' => '1',
                       'ifu_bus_tag' => '3'
                     },
            'core' => {
                        'dec_instbuf_depth' => '4',
                        'fpga_optimize' => '1',
                        'dma_buf_depth' => '4',
                        'lsu_num_nbload' => '8',
                        'lsu_stbuf_depth' => '8',
                        'lsu_num_nbload_width' => '3'
                      },
            'triggers' => [
                            {
                              'mask' => [
                                          '0x081818c7',
                                          '0xffffffff',
                                          '0x00000000'
                                        ],
                              'reset' => [
                                           '0x23e00000',
                                           '0x00000000',
                                           '0x00000000'
                                         ],
                              'poke_mask' => [
                                               '0x081818c7',
                                               '0xffffffff',
                                               '0x00000000'
                                             ]
                            },
                            {
                              'reset' => [
                                           '0x23e00000',
                                           '0x00000000',
                                           '0x00000000'
                                         ],
                              'mask' => [
                                          '0x081818c7',
                                          '0xffffffff',
                                          '0x00000000'
                                        ],
                              'poke_mask' => [
                                               '0x081818c7',
                                               '0xffffffff',
                                               '0x00000000'
                                             ]
                            },
                            {
                              'reset' => [
                                           '0x23e00000',
                                           '0x00000000',
                                           '0x00000000'
                                         ],
                              'mask' => [
                                          '0x081818c7',
                                          '0xffffffff',
                                          '0x00000000'
                                        ],
                              'poke_mask' => [
                                               '0x081818c7',
                                               '0xffffffff',
                                               '0x00000000'
                                             ]
                            },
                            {
                              'poke_mask' => [
                                               '0x081818c7',
                                               '0xffffffff',
                                               '0x00000000'
                                             ],
                              'reset' => [
                                           '0x23e00000',
                                           '0x00000000',
                                           '0x00000000'
                                         ],
                              'mask' => [
                                          '0x081818c7',
                                          '0xffffffff',
                                          '0x00000000'
                                        ]
                            }
                          ],
            'testbench' => {
                             'build_axi4' => '',
                             'sterr_rollback' => '0',
                             'assert_on' => '',
                             'lderr_rollback' => '1',
                             'SDVT_AHB' => '1',
                             'ext_addrwidth' => '32',
                             'TOP' => 'tb_top',
                             'CPU_TOP' => '`RV_TOP.swerv',
                             'RV_TOP' => '`TOP.rvtop',
                             'clock_period' => '100',
                             'ext_datawidth' => '64',
                             'datawidth' => '64'
                           },
            'bht' => {
                       'bht_hash_string' => '{ghr[3:2] ^ {ghr[3+1], {4-1-2{1\'b0} } },hashin[5:4]^ghr[2-1:0]}',
                       'bht_addr_lo' => '4',
                       'bht_addr_hi' => 7,
                       'bht_ghr_range' => '4:0',
                       'bht_array_depth' => 16,
                       'bht_ghr_pad' => 'fghr[4],3\'b0',
                       'bht_ghr_pad2' => 'fghr[4:3],2\'b0',
                       'bht_size' => 128,
                       'bht_ghr_size' => 5
                     },
            'retstack' => {
                            'ret_stack_size' => '8'
                          },
            'xlen' => 32,
            'reset_vec' => '0x80000000',
            'btb' => {
                       'btb_index3_lo' => 8,
                       'btb_array_depth' => 4,
                       'btb_size' => 32,
                       'btb_addr_hi' => 5,
                       'btb_addr_lo' => '4',
                       'btb_index2_hi' => 7,
                       'btb_index1_lo' => '4',
                       'btb_index1_hi' => 5,
                       'btb_index2_lo' => 6,
                       'btb_btag_fold' => 1,
                       'btb_btag_size' => 9,
                       'btb_index3_hi' => 9
                     },
            'memmap' => {
                          'external_prog' => '0xb0000000',
                          'external_data_1' => '0x00000000',
                          'debug_sb_mem' => '0xb0580000',
                          'external_data' => '0xc0580000',
                          'serialio' => '0xd0580000'
                        },
            'dccm' => {
                        'dccm_fdata_width' => 39,
                        'dccm_ecc_width' => 7,
                        'dccm_bits' => 16,
                        'dccm_data_width' => 32,
                        'dccm_byte_width' => '4',
                        'dccm_eadr' => '0xf004ffff',
                        'dccm_size' => 64,
                        'dccm_enable' => '1',
                        'dccm_num_banks_8' => '',
                        'lsu_sb_bits' => 16,
                        'dccm_rows' => '2048',
                        'dccm_region' => '0xf',
                        'dccm_sadr' => '0xf0040000',
                        'dccm_size_64' => '',
                        'dccm_data_cell' => 'ram_2048x39',
                        'dccm_offset' => '0x40000',
                        'dccm_index_bits' => 11,
                        'dccm_bank_bits' => 3,
                        'dccm_width_bits' => 2,
                        'dccm_reserved' => '0x1000',
                        'dccm_num_banks' => '8'
                      },
            'num_mmode_perf_regs' => '4',
            'max_mmode_perf_event' => '50',
            'protection' => {
                              'inst_access_enable5' => '0x0',
                              'inst_access_mask7' => '0xffffffff',
                              'data_access_mask5' => '0xffffffff',
                              'inst_access_addr0' => '0x00000000',
                              'data_access_enable7' => '0x0',
                              'inst_access_enable2' => '0x0',
                              'data_access_enable5' => '0x0',
                              'data_access_mask0' => '0xffffffff',
                              'data_access_mask6' => '0xffffffff',
                              'data_access_addr4' => '0x00000000',
                              'data_access_enable2' => '0x0',
                              'inst_access_mask0' => '0xffffffff',
                              'data_access_mask1' => '0xffffffff',
                              'inst_access_enable1' => '0x0',
                              'inst_access_enable6' => '0x0',
                              'inst_access_mask5' => '0xffffffff',
                              'data_access_addr2' => '0x00000000',
                              'inst_access_mask3' => '0xffffffff',
                              'inst_access_addr4' => '0x00000000',
                              'inst_access_addr1' => '0x00000000',
                              'data_access_enable0' => '0x0',
                              'data_access_addr1' => '0x00000000',
                              'data_access_enable6' => '0x0',
                              'data_access_mask3' => '0xffffffff',
                              'data_access_addr0' => '0x00000000',
                              'inst_access_mask2' => '0xffffffff',
                              'inst_access_mask1' => '0xffffffff',
                              'inst_access_addr2' => '0x00000000',
                              'data_access_mask2' => '0xffffffff',
                              'data_access_addr7' => '0x00000000',
                              'inst_access_enable0' => '0x0',
                              'data_access_addr5' => '0x00000000',
                              'data_access_mask7' => '0xffffffff',
                              'inst_access_addr3' => '0x00000000',
                              'data_access_enable4' => '0x0',
                              'data_access_addr3' => '0x00000000',
                              'data_access_enable1' => '0x0',
                              'data_access_enable3' => '0x0',
                              'data_access_addr6' => '0x00000000',
                              'inst_access_enable3' => '0x0',
                              'data_access_mask4' => '0xffffffff',
                              'inst_access_addr5' => '0x00000000',
                              'inst_access_mask4' => '0xffffffff',
                              'inst_access_enable7' => '0x0',
                              'inst_access_addr7' => '0x00000000',
                              'inst_access_mask6' => '0xffffffff',
                              'inst_access_enable4' => '0x0',
                              'inst_access_addr6' => '0x00000000'
                            },
            'icache' => {
                          'icache_size' => 16,
                          'icache_ic_index' => 8,
                          'icache_taddr_high' => 5,
                          'icache_tag_high' => 12,
                          'icache_data_cell' => 'ram_256x34',
                          'icache_ic_rows' => '256',
                          'icache_enable' => '1',
                          'icache_tag_cell' => 'ram_64x21',
                          'icache_ic_depth' => 8,
                          'icache_tag_depth' => 64,
                          'icache_tag_low' => '6'
                        },
            'iccm' => {
                        'iccm_region' => '0xe',
                        'iccm_size_512' => '',
                        'iccm_index_bits' => 14,
                        'iccm_bank_bits' => 3,
                        'iccm_num_banks_8' => '',
                        'iccm_offset' => '0xe000000',
                        'iccm_sadr' => '0xee000000',
                        'iccm_bits' => 19,
                        'iccm_reserved' => '0x1000',
                        'iccm_rows' => '16384',
                        'iccm_data_cell' => 'ram_16384x39',
                        'iccm_eadr' => '0xee07ffff',
                        'iccm_num_banks' => '8',
                        'iccm_size' => 512
                      },
            'tec_rv_icg' => 'clockhdr',
            'verilator' => '',
            'even_odd_trigger_chains' => 'true',
            'physical' => '1',
            'nmi_vec' => '0x11110000',
            'csr' => {
                       'pmpaddr5' => {
                                       'exists' => 'false'
                                     },
                       'instret' => {
                                      'exists' => 'false'
                                    },
                       'mvendorid' => {
                                        'reset' => '0x45',
                                        'mask' => '0x0',
                                        'exists' => 'true'
                                      },
                       'mhpmevent4' => {
                                         'exists' => 'true',
                                         'mask' => '0xffffffff',
                                         'reset' => '0x0'
                                       },
                       'pmpaddr0' => {
                                       'exists' => 'false'
                                     },
                       'mhpmcounter5h' => {
                                            'mask' => '0xffffffff',
                                            'reset' => '0x0',
                                            'exists' => 'true'
                                          },
                       'mip' => {
                                  'exists' => 'true',
                                  'mask' => '0x0',
                                  'reset' => '0x0',
                                  'poke_mask' => '0x40000888'
                                },
                       'pmpaddr3' => {
                                       'exists' => 'false'
                                     },
                       'pmpaddr8' => {
                                       'exists' => 'false'
                                     },
                       'mhpmcounter5' => {
                                           'reset' => '0x0',
                                           'mask' => '0xffffffff',
                                           'exists' => 'true'
                                         },
                       'pmpaddr11' => {
                                        'exists' => 'false'
                                      },
                       'pmpaddr4' => {
                                       'exists' => 'false'
                                     },
                       'dicad0' => {
                                     'debug' => 'true',
                                     'comment' => 'Cache diagnostics.',
                                     'mask' => '0xffffffff',
                                     'reset' => '0x0',
                                     'exists' => 'true',
                                     'number' => '0x7c9'
                                   },
                       'dcsr' => {
                                   'poke_mask' => '0x00008dcc',
                                   'reset' => '0x40000003',
                                   'mask' => '0x00008c04',
                                   'exists' => 'true'
                                 },
                       'dicago' => {
                                     'number' => '0x7cb',
                                     'exists' => 'true',
                                     'reset' => '0x0',
                                     'mask' => '0x0',
                                     'comment' => 'Cache diagnostics.',
                                     'debug' => 'true'
                                   },
                       'dicad1' => {
                                     'reset' => '0x0',
                                     'comment' => 'Cache diagnostics.',
                                     'mask' => '0x3',
                                     'debug' => 'true',
                                     'number' => '0x7ca',
                                     'exists' => 'true'
                                   },
                       'meipt' => {
                                    'number' => '0xbc9',
                                    'exists' => 'true',
                                    'reset' => '0x0',
                                    'comment' => 'External interrupt priority threshold.',
                                    'mask' => '0xf'
                                  },
                       'cycle' => {
                                    'exists' => 'false'
                                  },
                       'mhpmcounter3h' => {
                                            'reset' => '0x0',
                                            'mask' => '0xffffffff',
                                            'exists' => 'true'
                                          },
                       'tselect' => {
                                      'reset' => '0x0',
                                      'mask' => '0x3',
                                      'exists' => 'true'
                                    },
                       'misa' => {
                                   'mask' => '0x0',
                                   'reset' => '0x40001104',
                                   'exists' => 'true'
                                 },
                       'pmpaddr9' => {
                                       'exists' => 'false'
                                     },
                       'mhpmcounter6h' => {
                                            'exists' => 'true',
                                            'reset' => '0x0',
                                            'mask' => '0xffffffff'
                                          },
                       'pmpaddr10' => {
                                        'exists' => 'false'
                                      },
                       'mimpid' => {
                                     'exists' => 'true',
                                     'reset' => '0x1',
                                     'mask' => '0x0'
                                   },
                       'mhpmevent3' => {
                                         'mask' => '0xffffffff',
                                         'reset' => '0x0',
                                         'exists' => 'true'
                                       },
                       'dmst' => {
                                   'debug' => 'true',
                                   'reset' => '0x0',
                                   'mask' => '0x0',
                                   'comment' => 'Memory synch trigger: Flush caches in debug mode.',
                                   'exists' => 'true',
                                   'number' => '0x7c4'
                                 },
                       'meicidpl' => {
                                       'mask' => '0xf',
                                       'comment' => 'External interrupt claim id priority level.',
                                       'reset' => '0x0',
                                       'number' => '0xbcb',
                                       'exists' => 'true'
                                     },
                       'pmpaddr15' => {
                                        'exists' => 'false'
                                      },
                       'mdccmect' => {
                                       'mask' => '0xffffffff',
                                       'reset' => '0x0',
                                       'exists' => 'true',
                                       'number' => '0x7f2'
                                     },
                       'mie' => {
                                  'mask' => '0x40000888',
                                  'reset' => '0x0',
                                  'exists' => 'true'
                                },
                       'micect' => {
                                     'mask' => '0xffffffff',
                                     'reset' => '0x0',
                                     'exists' => 'true',
                                     'number' => '0x7f0'
                                   },
                       'pmpaddr6' => {
                                       'exists' => 'false'
                                     },
                       'mcpc' => {
                                   'reset' => '0x0',
                                   'mask' => '0x0',
                                   'exists' => 'true',
                                   'number' => '0x7c2'
                                 },
                       'mhpmevent6' => {
                                         'reset' => '0x0',
                                         'mask' => '0xffffffff',
                                         'exists' => 'true'
                                       },
                       'pmpaddr2' => {
                                       'exists' => 'false'
                                     },
                       'pmpaddr7' => {
                                       'exists' => 'false'
                                     },
                       'mhpmcounter6' => {
                                           'mask' => '0xffffffff',
                                           'reset' => '0x0',
                                           'exists' => 'true'
                                         },
                       'pmpaddr1' => {
                                       'exists' => 'false'
                                     },
                       'miccmect' => {
                                       'reset' => '0x0',
                                       'mask' => '0xffffffff',
                                       'exists' => 'true',
                                       'number' => '0x7f1'
                                     },
                       'pmpaddr12' => {
                                        'exists' => 'false'
                                      },
                       'mpmc' => {
                                   'exists' => 'true',
                                   'number' => '0x7c6',
                                   'reset' => '0x0',
                                   'comment' => 'Core pause: Implemented as read only.',
                                   'mask' => '0x0'
                                 },
                       'dicawics' => {
                                       'comment' => 'Cache diagnostics.',
                                       'mask' => '0x0130fffc',
                                       'reset' => '0x0',
                                       'debug' => 'true',
                                       'number' => '0x7c8',
                                       'exists' => 'true'
                                     },
                       'meicpct' => {
                                      'mask' => '0x0',
                                      'comment' => 'External claim id/priority capture.',
                                      'reset' => '0x0',
                                      'number' => '0xbca',
                                      'exists' => 'true'
                                    },
                       'pmpcfg0' => {
                                      'exists' => 'false'
                                    },
                       'mhpmcounter4h' => {
                                            'reset' => '0x0',
                                            'mask' => '0xffffffff',
                                            'exists' => 'true'
                                          },
                       'pmpaddr13' => {
                                        'exists' => 'false'
                                      },
                       'pmpcfg2' => {
                                      'exists' => 'false'
                                    },
                       'mhpmcounter4' => {
                                           'exists' => 'true',
                                           'reset' => '0x0',
                                           'mask' => '0xffffffff'
                                         },
                       'mfdc' => {
                                   'reset' => '0x00070000',
                                   'mask' => '0x000707ff',
                                   'exists' => 'true',
                                   'number' => '0x7f9'
                                 },
                       'pmpcfg1' => {
                                      'exists' => 'false'
                                    },
                       'meicurpl' => {
                                       'reset' => '0x0',
                                       'mask' => '0xf',
                                       'comment' => 'External interrupt current priority level.',
                                       'exists' => 'true',
                                       'number' => '0xbcc'
                                     },
                       'mstatus' => {
                                      'reset' => '0x1800',
                                      'mask' => '0x88',
                                      'exists' => 'true'
                                    },
                       'marchid' => {
                                      'mask' => '0x0',
                                      'reset' => '0x0000000b',
                                      'exists' => 'true'
                                    },
                       'mcgc' => {
                                   'mask' => '0x000001ff',
                                   'reset' => '0x0',
                                   'poke_mask' => '0x000001ff',
                                   'number' => '0x7f8',
                                   'exists' => 'true'
                                 },
                       'pmpaddr14' => {
                                        'exists' => 'false'
                                      },
                       'time' => {
                                   'exists' => 'false'
                                 },
                       'pmpcfg3' => {
                                      'exists' => 'false'
                                    },
                       'mhpmcounter3' => {
                                           'reset' => '0x0',
                                           'mask' => '0xffffffff',
                                           'exists' => 'true'
                                         },
                       'mhpmevent5' => {
                                         'exists' => 'true',
                                         'reset' => '0x0',
                                         'mask' => '0xffffffff'
                                       }
                     },
            'harts' => 1,
            'target' => 'default'
          );
1;
