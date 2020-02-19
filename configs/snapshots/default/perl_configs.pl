#  NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE
#  This is an automatically generated file by osboxes on Wed 19 Feb 07:06:38 EST 2020
# 
#  cmd:    swerv -snapshot=default 
# 
# To use this in a perf script, use 'require $RV_ROOT/configs/config.pl'
# Reference the hash via $config{name}..


%config = (
            'core' => {
                        'lsu_stbuf_depth' => '8',
                        'dma_buf_depth' => '4',
                        'lsu_num_nbload_width' => '3',
                        'dec_instbuf_depth' => '4',
                        'lsu_num_nbload' => '8'
                      },
            'verilator' => '',
            'harts' => 1,
            'numiregs' => '32',
            'physical' => '1',
            'xlen' => 32,
            'testbench' => {
                             'SDVT_AHB' => '1',
                             'ext_datawidth' => '64',
                             'CPU_TOP' => '`RV_TOP.swerv',
                             'datawidth' => '64',
                             'build_axi4' => '',
                             'TOP' => 'tb_top',
                             'RV_TOP' => '`TOP.rvtop',
                             'lderr_rollback' => '1',
                             'sterr_rollback' => '0',
                             'clock_period' => '100',
                             'assert_on' => '',
                             'ext_addrwidth' => '32'
                           },
            'bht' => {
                       'bht_size' => 128,
                       'bht_addr_lo' => '4',
                       'bht_addr_hi' => 7,
                       'bht_ghr_size' => 5,
                       'bht_ghr_pad' => 'fghr[4],3\'b0',
                       'bht_ghr_range' => '4:0',
                       'bht_ghr_pad2' => 'fghr[4:3],2\'b0',
                       'bht_hash_string' => '{ghr[3:2] ^ {ghr[3+1], {4-1-2{1\'b0} } },hashin[5:4]^ghr[2-1:0]}',
                       'bht_array_depth' => 16
                     },
            'nmi_vec' => '0x11110000',
            'icache' => {
                          'icache_tag_low' => '6',
                          'icache_size' => 16,
                          'icache_ic_rows' => '256',
                          'icache_tag_depth' => 64,
                          'icache_ic_index' => 8,
                          'icache_taddr_high' => 5,
                          'icache_tag_cell' => 'ram_64x21',
                          'icache_data_cell' => 'ram_256x34',
                          'icache_ic_depth' => 8,
                          'icache_enable' => '1',
                          'icache_tag_high' => 12
                        },
            'memmap' => {
                          'debug_sb_mem' => '0xb0580000',
                          'serialio' => '0xd0580000',
                          'external_data_1' => '0x00000000',
                          'external_prog' => '0xb0000000',
                          'external_data' => '0xc0580000'
                        },
            'csr' => {
                       'miccmect' => {
                                       'exists' => 'true',
                                       'mask' => '0xffffffff',
                                       'reset' => '0x0',
                                       'number' => '0x7f1'
                                     },
                       'pmpaddr7' => {
                                       'exists' => 'false'
                                     },
                       'instret' => {
                                      'exists' => 'false'
                                    },
                       'pmpaddr14' => {
                                        'exists' => 'false'
                                      },
                       'pmpaddr12' => {
                                        'exists' => 'false'
                                      },
                       'pmpaddr11' => {
                                        'exists' => 'false'
                                      },
                       'mcgc' => {
                                   'poke_mask' => '0x000001ff',
                                   'exists' => 'true',
                                   'reset' => '0x0',
                                   'number' => '0x7f8',
                                   'mask' => '0x000001ff'
                                 },
                       'mimpid' => {
                                     'mask' => '0x0',
                                     'reset' => '0x1',
                                     'exists' => 'true'
                                   },
                       'pmpaddr15' => {
                                        'exists' => 'false'
                                      },
                       'pmpcfg3' => {
                                      'exists' => 'false'
                                    },
                       'mhpmevent3' => {
                                         'exists' => 'true',
                                         'reset' => '0x0',
                                         'mask' => '0xffffffff'
                                       },
                       'pmpaddr8' => {
                                       'exists' => 'false'
                                     },
                       'marchid' => {
                                      'mask' => '0x0',
                                      'reset' => '0x0000000b',
                                      'exists' => 'true'
                                    },
                       'mhpmcounter4' => {
                                           'exists' => 'true',
                                           'reset' => '0x0',
                                           'mask' => '0xffffffff'
                                         },
                       'pmpaddr5' => {
                                       'exists' => 'false'
                                     },
                       'mhpmcounter6h' => {
                                            'reset' => '0x0',
                                            'mask' => '0xffffffff',
                                            'exists' => 'true'
                                          },
                       'dicawics' => {
                                       'mask' => '0x0130fffc',
                                       'reset' => '0x0',
                                       'number' => '0x7c8',
                                       'comment' => 'Cache diagnostics.',
                                       'exists' => 'true',
                                       'debug' => 'true'
                                     },
                       'pmpaddr6' => {
                                       'exists' => 'false'
                                     },
                       'meicurpl' => {
                                       'comment' => 'External interrupt current priority level.',
                                       'mask' => '0xf',
                                       'reset' => '0x0',
                                       'number' => '0xbcc',
                                       'exists' => 'true'
                                     },
                       'misa' => {
                                   'exists' => 'true',
                                   'reset' => '0x40001104',
                                   'mask' => '0x0'
                                 },
                       'pmpaddr0' => {
                                       'exists' => 'false'
                                     },
                       'mpmc' => {
                                   'number' => '0x7c6',
                                   'reset' => '0x0',
                                   'mask' => '0x0',
                                   'comment' => 'Core pause: Implemented as read only.',
                                   'exists' => 'true'
                                 },
                       'meicpct' => {
                                      'reset' => '0x0',
                                      'number' => '0xbca',
                                      'mask' => '0x0',
                                      'comment' => 'External claim id/priority capture.',
                                      'exists' => 'true'
                                    },
                       'pmpaddr4' => {
                                       'exists' => 'false'
                                     },
                       'mhpmcounter5' => {
                                           'exists' => 'true',
                                           'mask' => '0xffffffff',
                                           'reset' => '0x0'
                                         },
                       'pmpaddr3' => {
                                       'exists' => 'false'
                                     },
                       'dicad0' => {
                                     'comment' => 'Cache diagnostics.',
                                     'reset' => '0x0',
                                     'number' => '0x7c9',
                                     'mask' => '0xffffffff',
                                     'debug' => 'true',
                                     'exists' => 'true'
                                   },
                       'mhpmcounter5h' => {
                                            'mask' => '0xffffffff',
                                            'reset' => '0x0',
                                            'exists' => 'true'
                                          },
                       'mhpmcounter4h' => {
                                            'exists' => 'true',
                                            'mask' => '0xffffffff',
                                            'reset' => '0x0'
                                          },
                       'meipt' => {
                                    'mask' => '0xf',
                                    'number' => '0xbc9',
                                    'reset' => '0x0',
                                    'comment' => 'External interrupt priority threshold.',
                                    'exists' => 'true'
                                  },
                       'pmpaddr1' => {
                                       'exists' => 'false'
                                     },
                       'mcpc' => {
                                   'exists' => 'true',
                                   'number' => '0x7c2',
                                   'reset' => '0x0',
                                   'mask' => '0x0'
                                 },
                       'mstatus' => {
                                      'mask' => '0x88',
                                      'reset' => '0x1800',
                                      'exists' => 'true'
                                    },
                       'mhpmevent6' => {
                                         'mask' => '0xffffffff',
                                         'reset' => '0x0',
                                         'exists' => 'true'
                                       },
                       'pmpaddr13' => {
                                        'exists' => 'false'
                                      },
                       'pmpcfg1' => {
                                      'exists' => 'false'
                                    },
                       'pmpaddr10' => {
                                        'exists' => 'false'
                                      },
                       'dmst' => {
                                   'exists' => 'true',
                                   'debug' => 'true',
                                   'number' => '0x7c4',
                                   'reset' => '0x0',
                                   'mask' => '0x0',
                                   'comment' => 'Memory synch trigger: Flush caches in debug mode.'
                                 },
                       'mvendorid' => {
                                        'mask' => '0x0',
                                        'reset' => '0x45',
                                        'exists' => 'true'
                                      },
                       'mie' => {
                                  'exists' => 'true',
                                  'mask' => '0x40000888',
                                  'reset' => '0x0'
                                },
                       'mfdc' => {
                                   'exists' => 'true',
                                   'mask' => '0x000707ff',
                                   'number' => '0x7f9',
                                   'reset' => '0x00070000'
                                 },
                       'mhpmcounter3' => {
                                           'mask' => '0xffffffff',
                                           'reset' => '0x0',
                                           'exists' => 'true'
                                         },
                       'mhpmcounter6' => {
                                           'mask' => '0xffffffff',
                                           'reset' => '0x0',
                                           'exists' => 'true'
                                         },
                       'tselect' => {
                                      'exists' => 'true',
                                      'mask' => '0x3',
                                      'reset' => '0x0'
                                    },
                       'mhpmcounter3h' => {
                                            'exists' => 'true',
                                            'mask' => '0xffffffff',
                                            'reset' => '0x0'
                                          },
                       'cycle' => {
                                    'exists' => 'false'
                                  },
                       'pmpcfg0' => {
                                      'exists' => 'false'
                                    },
                       'dicad1' => {
                                     'debug' => 'true',
                                     'exists' => 'true',
                                     'comment' => 'Cache diagnostics.',
                                     'mask' => '0x3',
                                     'reset' => '0x0',
                                     'number' => '0x7ca'
                                   },
                       'pmpaddr2' => {
                                       'exists' => 'false'
                                     },
                       'pmpcfg2' => {
                                      'exists' => 'false'
                                    },
                       'meicidpl' => {
                                       'mask' => '0xf',
                                       'reset' => '0x0',
                                       'number' => '0xbcb',
                                       'comment' => 'External interrupt claim id priority level.',
                                       'exists' => 'true'
                                     },
                       'mdccmect' => {
                                       'number' => '0x7f2',
                                       'reset' => '0x0',
                                       'mask' => '0xffffffff',
                                       'exists' => 'true'
                                     },
                       'dicago' => {
                                     'comment' => 'Cache diagnostics.',
                                     'reset' => '0x0',
                                     'number' => '0x7cb',
                                     'mask' => '0x0',
                                     'debug' => 'true',
                                     'exists' => 'true'
                                   },
                       'micect' => {
                                     'number' => '0x7f0',
                                     'reset' => '0x0',
                                     'mask' => '0xffffffff',
                                     'exists' => 'true'
                                   },
                       'dcsr' => {
                                   'mask' => '0x00008c04',
                                   'reset' => '0x40000003',
                                   'exists' => 'true',
                                   'poke_mask' => '0x00008dcc'
                                 },
                       'mhpmevent5' => {
                                         'exists' => 'true',
                                         'mask' => '0xffffffff',
                                         'reset' => '0x0'
                                       },
                       'mip' => {
                                  'reset' => '0x0',
                                  'mask' => '0x0',
                                  'poke_mask' => '0x40000888',
                                  'exists' => 'true'
                                },
                       'pmpaddr9' => {
                                       'exists' => 'false'
                                     },
                       'time' => {
                                   'exists' => 'false'
                                 },
                       'mhpmevent4' => {
                                         'mask' => '0xffffffff',
                                         'reset' => '0x0',
                                         'exists' => 'true'
                                       }
                     },
            'pic' => {
                       'pic_meigwclr_offset' => '0x5000',
                       'pic_meipt_offset' => '0x3004',
                       'pic_base_addr' => '0xf00c0000',
                       'pic_meigwctrl_offset' => '0x4000',
                       'pic_offset' => '0xc0000',
                       'pic_total_int_plus1' => 9,
                       'pic_bits' => 15,
                       'pic_total_int' => 8,
                       'pic_int_words' => 1,
                       'pic_size' => 32,
                       'pic_meie_offset' => '0x2000',
                       'pic_mpiccfg_offset' => '0x3000',
                       'pic_meip_offset' => '0x1000',
                       'pic_meipl_offset' => '0x0000',
                       'pic_region' => '0xf'
                     },
            'num_mmode_perf_regs' => '4',
            'even_odd_trigger_chains' => 'true',
            'protection' => {
                              'data_access_mask2' => '0xffffffff',
                              'inst_access_addr2' => '0x00000000',
                              'data_access_enable2' => '0x0',
                              'data_access_mask1' => '0xffffffff',
                              'inst_access_mask5' => '0xffffffff',
                              'inst_access_addr1' => '0x00000000',
                              'inst_access_mask6' => '0xffffffff',
                              'data_access_enable3' => '0x0',
                              'inst_access_mask4' => '0xffffffff',
                              'inst_access_mask0' => '0xffffffff',
                              'data_access_mask3' => '0xffffffff',
                              'data_access_mask0' => '0xffffffff',
                              'data_access_enable4' => '0x0',
                              'data_access_addr4' => '0x00000000',
                              'data_access_addr1' => '0x00000000',
                              'data_access_addr2' => '0x00000000',
                              'inst_access_enable7' => '0x0',
                              'data_access_enable1' => '0x0',
                              'inst_access_mask1' => '0xffffffff',
                              'inst_access_addr0' => '0x00000000',
                              'inst_access_enable1' => '0x0',
                              'inst_access_enable4' => '0x0',
                              'inst_access_enable5' => '0x0',
                              'inst_access_mask3' => '0xffffffff',
                              'data_access_addr6' => '0x00000000',
                              'data_access_addr7' => '0x00000000',
                              'inst_access_enable0' => '0x0',
                              'inst_access_enable6' => '0x0',
                              'data_access_enable7' => '0x0',
                              'inst_access_addr5' => '0x00000000',
                              'data_access_enable0' => '0x0',
                              'inst_access_enable3' => '0x0',
                              'inst_access_addr6' => '0x00000000',
                              'data_access_enable5' => '0x0',
                              'data_access_mask6' => '0xffffffff',
                              'data_access_enable6' => '0x0',
                              'data_access_mask4' => '0xffffffff',
                              'data_access_mask5' => '0xffffffff',
                              'inst_access_enable2' => '0x0',
                              'inst_access_mask2' => '0xffffffff',
                              'data_access_addr0' => '0x00000000',
                              'inst_access_addr7' => '0x00000000',
                              'inst_access_addr4' => '0x00000000',
                              'inst_access_addr3' => '0x00000000',
                              'data_access_addr5' => '0x00000000',
                              'inst_access_mask7' => '0xffffffff',
                              'data_access_addr3' => '0x00000000',
                              'data_access_mask7' => '0xffffffff'
                            },
            'tec_rv_icg' => 'clockhdr',
            'bus' => {
                       'ifu_bus_tag' => '3',
                       'lsu_bus_tag' => 4,
                       'sb_bus_tag' => '1',
                       'dma_bus_tag' => '1'
                     },
            'iccm' => {
                        'iccm_offset' => '0xe000000',
                        'iccm_data_cell' => 'ram_16384x39',
                        'iccm_num_banks_8' => '',
                        'iccm_bank_bits' => 3,
                        'iccm_size_512' => '',
                        'iccm_rows' => '16384',
                        'iccm_bits' => 19,
                        'iccm_num_banks' => '8',
                        'iccm_reserved' => '0x1000',
                        'iccm_eadr' => '0xee07ffff',
                        'iccm_sadr' => '0xee000000',
                        'iccm_index_bits' => 14,
                        'iccm_region' => '0xe',
                        'iccm_size' => 512
                      },
            'reset_vec' => '0x80000000',
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
            'btb' => {
                       'btb_array_depth' => 4,
                       'btb_index3_hi' => 9,
                       'btb_btag_size' => 9,
                       'btb_index3_lo' => 8,
                       'btb_index1_lo' => '4',
                       'btb_index2_lo' => 6,
                       'btb_btag_fold' => 1,
                       'btb_size' => 32,
                       'btb_index1_hi' => 5,
                       'btb_addr_lo' => '4',
                       'btb_index2_hi' => 7,
                       'btb_addr_hi' => 5
                     },
            'max_mmode_perf_event' => '50',
            'regwidth' => '32',
            'target' => 'default',
            'dccm' => {
                        'dccm_data_cell' => 'ram_2048x39',
                        'dccm_byte_width' => '4',
                        'dccm_offset' => '0x40000',
                        'dccm_size_64' => '',
                        'dccm_data_width' => 32,
                        'dccm_region' => '0xf',
                        'dccm_sadr' => '0xf0040000',
                        'dccm_index_bits' => 11,
                        'dccm_num_banks_8' => '',
                        'dccm_enable' => '1',
                        'lsu_sb_bits' => 16,
                        'dccm_fdata_width' => 39,
                        'dccm_bank_bits' => 3,
                        'dccm_width_bits' => 2,
                        'dccm_size' => 64,
                        'dccm_reserved' => '0x1000',
                        'dccm_eadr' => '0xf004ffff',
                        'dccm_num_banks' => '8',
                        'dccm_rows' => '2048',
                        'dccm_ecc_width' => 7,
                        'dccm_bits' => 16
                      },
            'retstack' => {
                            'ret_stack_size' => '4'
                          }
          );
1;
