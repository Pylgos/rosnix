{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rti_connext_dds_cmake_module";
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."rti_connext_dds_cmake_module";
  propagatedNativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "rti-connext-dds-7.7.0" ]; };
  propagatedBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "rti-connext-dds-7.7.0" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rti_connext_dds_cmake_module" = substituteSource {
      src = fetchgit {
        name = "rti_connext_dds_cmake_module-source";
        url = "https://github.com/ros2-gbp/rmw_connextdds-release.git";
        rev = "046034a28f0c51f16666ddc981adaa555a329c23";
        hash = "sha256-BcIwFG6jqzmPg6Qc3oo0FcrxphcYQheK2d7c7xEwz8Q=";
      };
    };
  });
  meta = {
    description = "Helper module to provide access to RTI products like Connext DDS Professional";
  };
})
