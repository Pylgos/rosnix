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
  version = "1.2.0-1";
  src = finalAttrs.passthru.sources."rti_connext_dds_cmake_module";
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "rti-connext-dds-7.3.0" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rti_connext_dds_cmake_module" = substituteSource {
      src = fetchgit {
        name = "rti_connext_dds_cmake_module-source";
        url = "https://github.com/ros2-gbp/rmw_connextdds-release.git";
        rev = "1055599d2a8374bf4e89d33f8f5f49ab8b52e966";
        hash = "sha256-ZNlQF+CPs/eyJVapgYznmwVmg4s2Y7VsYwtSgXYxSu4=";
      };
    };
  });
  meta = {
    description = "Helper module to provide access to RTI products like Connext DDS Professional";
  };
})
