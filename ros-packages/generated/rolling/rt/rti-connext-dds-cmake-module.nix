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
  version = "0.24.2-1";
  src = finalAttrs.passthru.sources."rti_connext_dds_cmake_module";
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "rti-connext-dds-6.0.1" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rti_connext_dds_cmake_module" = substituteSource {
        src = fetchgit {
          name = "rti_connext_dds_cmake_module-source";
          url = "https://github.com/ros2-gbp/rmw_connextdds-release.git";
          rev = "da51be6d797c26d608187498ccca6c3bc9f162cd";
          hash = "sha256-xcSDCMgjyhEVbhA0FVBlBLEEgYcwPUeTFF1/sRFEUG4=";
        };
      };
    });
  };
  meta = {
    description = "Helper module to provide access to RTI products like Connext DDS Professional";
  };
})
