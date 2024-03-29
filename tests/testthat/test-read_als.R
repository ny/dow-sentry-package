test_that("read_als", {

  r2004299 <- read_als(zip_path = here::here("inst",
                                            "example_zips",
                                            "R2004299.zip"))

  r2005223 <- read_als(zip_path = here::here("inst",
                                            "example_zips",
                                            "R2005223.zip"))

  r2201459 <- read_als(zip_path = here::here("inst",
                                             "example_zips",
                                             "R2201459-sub.zip"))

  # Expected list element names
  for (i in list(r2004299, r2005223, r2201459 )) {
    expect_type(i, type = "list")
  }

  # Expected list element names
  for (i in list(r2004299, r2005223, r2201459)) {
    expect_equal(names(i), c('result', 'batch', 'sample', 'htm'))
  }

# Expected result names ---------------------------------------------------

  for (i in list(r2004299, r2005223, r2201459)) {
    expect_equal(
      names(i[["result"]]),
      c(
        "sys_sample_code",
        "lab_anl_method_name",
        "analysis_date",
        "fraction",
        "column_number",
        "test_type",
        "lab_matrix_code",
        "analysis_location",
        "basis",
        "container_id",
        "dilution_factor",
        "prep_method",
        "prep_date",
        "leachate_method",
        "leachate_date",
        "lab_name_code",
        "qc_level",
        "lab_sample_id",
        "percent_moisture",
        "subsample_amount",
        "subsample_amount_unit",
        "analyst_name",
        "instrument_id",
        "comment",
        "preservative",
        "final_volume",
        "final_volume_unit",
        "cas_rn",
        "chemical_name",
        "result_value",
        "result_error_delta",
        "result_type_code",
        "reportable_result",
        "detect_flag",
        "lab_qualifiers",
        "validator_qualifiers",
        "interpreted_qualifiers",
        "validated_yn",
        "method_detection_limit",
        "reporting_detection_limit",
        "quantitation_limit",
        "result_unit",
        "detection_limit_unit",
        "tic_retention_time",
        "minimum_detectable_conc",
        "counting_error",
        "uncertainty",
        "critical_value",
        "validation_level",
        "result_comment",
        "qc_original_conc",
        "qc_spike_added",
        "qc_spike_measured",
        "qc_spike_recovery",
        "qc_dup_original_conc",
        "qc_dup_spike_added",
        "qc_dup_spike_measured",
        "qc_dup_spike_recovery",
        "qc_rpd",
        "qc_spike_lcl",
        "qc_spike_ucl",
        "qc_rpd_cl",
        "qc_spike_status",
        "qc_dup_spike_status",
        "qc_rpd_status",
        "lab_sdg"
      )
    )
  }

# Expected batch names ----------------------------------------------------

  for (i in list(r2004299, r2005223, r2201459)) {
    expect_equal(
      names(i[["batch"]]),
      c(
        "sys_sample_code",
        "lab_anl_method_name",
        "analysis_date",
        "fraction",
        "column_number",
        "test_type",
        "test_batch_type",
        "test_batch_id"
      )
    )
  }

# Expected sample names ---------------------------------------------------

  for (i in list(r2004299, r2005223, r2201459)) {
    expect_equal(
      names(i[["sample"]]),
      c(
        "data_provider",
        "sys_sample_code",
        "sample_name",
        "sample_matrix_code",
        "sample_type_code",
        "sample_source",
        "parent_sample_code",
        "sample_delivery_group",
        "sample_date",
        "sys_loc_code",
        "start_depth",
        "end_depth",
        "depth_unit",
        "chain_of_custody",
        "sent_to_lab_date",
        "sample_receipt_date",
        "sampler",
        "sampling_company_code",
        "sampling_reason",
        "sampling_technique",
        "task_code",
        "collection_quarter",
        "composite_yn",
        "composite_desc",
        "sample_class",
        "custom_field_1",
        "custom_field_2",
        "custom_field_3",
        "comment"
      )
    )
  }


# Expect Error when a zip file is not supplied. ---------------------------

  expect_error(
    read_als(zip_path = here::here("inst",
                                   "example_zips",
                                   "dummy_xlsx.xlsx")),
    paste0("\nExpected File Extension: zip \n",
           'Supplied File Extension: xlsx')
  )


})


