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
  version = "0.25.0-1";
  src = finalAttrs.passthru.sources."rti_connext_dds_cmake_module";
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "rti-connext-dds-6.0.1" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rti_connext_dds_cmake_module" = substituteSource {
      src = fetchgit {
        name = "rti_connext_dds_cmake_module-source";
        url = "https://github.com/ros2-gbp/rmw_connextdds-release.git";
        rev = "1cb362c1852d8e11c8ca7dd3eaa37cbe5c3690e5";
        hash = "sha256-ja+OrSzrDd9p3XT38OqGqycgSRnEE/QIfBQzj508Rbo=";
      };
    };
  });
  meta = {
    description = "Helper module to provide access to RTI products like Connext DDS Professional";
  };
})
