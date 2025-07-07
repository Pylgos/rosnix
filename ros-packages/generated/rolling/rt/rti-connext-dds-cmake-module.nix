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
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."rti_connext_dds_cmake_module";
  propagatedNativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "rti-connext-dds-7.3.0" ]; };
  propagatedBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "rti-connext-dds-7.3.0" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rti_connext_dds_cmake_module" = substituteSource {
      src = fetchgit {
        name = "rti_connext_dds_cmake_module-source";
        url = "https://github.com/ros2-gbp/rmw_connextdds-release.git";
        rev = "03453484c64087cdf4123805405c5e3b5fba6f4b";
        hash = "sha256-a8MYutJFwgXnpUfVwrvGE/ZEYAnQrmD5n4tS5bx9OyE=";
      };
    };
  });
  meta = {
    description = "Helper module to provide access to RTI products like Connext DDS Professional";
  };
})
