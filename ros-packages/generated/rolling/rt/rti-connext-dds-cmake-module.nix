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
  version = "1.2.0-2";
  src = finalAttrs.passthru.sources."rti_connext_dds_cmake_module";
  propagatedNativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "rti-connext-dds-7.3.0" ]; };
  propagatedBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "rti-connext-dds-7.3.0" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rti_connext_dds_cmake_module" = substituteSource {
      src = fetchgit {
        name = "rti_connext_dds_cmake_module-source";
        url = "https://github.com/ros2-gbp/rmw_connextdds-release.git";
        rev = "b508c7dd5ed32db5f11f782be4c80323897778ef";
        hash = "sha256-ZNlQF+CPs/eyJVapgYznmwVmg4s2Y7VsYwtSgXYxSu4=";
      };
    };
  });
  meta = {
    description = "Helper module to provide access to RTI products like Connext DDS Professional";
  };
})
