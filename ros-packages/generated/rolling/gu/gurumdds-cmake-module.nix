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
  pname = "gurumdds_cmake_module";
  version = "6.0.1-2";
  src = finalAttrs.passthru.sources."gurumdds_cmake_module";
  propagatedNativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "gurumdds-3.2" ]; };
  propagatedBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gurumdds-3.2" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "gurumdds_cmake_module" = substituteSource {
      src = fetchgit {
        name = "gurumdds_cmake_module-source";
        url = "https://github.com/ros2-gbp/rmw_gurumdds-release.git";
        rev = "37b02761c7d334561dc926e75f90a18da48d6182";
        hash = "sha256-3IHm5r+Gf8otc/XD/l2tszevbc8MajsODLyHrXm1b3I=";
      };
    };
  });
  meta = {
    description = "Provide CMake module to find GurumNetworks GurumDDS.";
  };
})
