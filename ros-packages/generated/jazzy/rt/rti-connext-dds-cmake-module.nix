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
  version = "0.22.0-2";
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
          rev = "7fbef60e22d457caca1ed2d7306bc51a1368bf80";
          hash = "sha256-RykpmIJ4bETrDDRubjorqi5Ls7IWS+G547VkutoTzBg=";
        };
      };
    });
  };
  meta = {
    description = "Helper module to provide access to RTI products like Connext DDS Professional";
  };
})
