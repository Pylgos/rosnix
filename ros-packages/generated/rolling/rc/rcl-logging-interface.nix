{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcpputils,
  rcutils,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rcl_logging_interface";
  version = "3.4.1-1";
  src = finalAttrs.passthru.sources."rcl_logging_interface";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rcutils ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rcutils ];
  checkInputs = [ ament-lint-auto ament-lint-common rcpputils ];
  passthru.sources = mkSourceSet (sources: {
    "rcl_logging_interface" = substituteSource {
      src = fetchgit {
        name = "rcl_logging_interface-source";
        url = "https://github.com/ros2-gbp/rcl_logging-release.git";
        rev = "ad12a7344596b0690a84c390c8245a3767059f2d";
        hash = "sha256-AvB94akWlmylEnqyP8G449GVDr3k1gE/wti5o0NVV1E=";
      };
    };
  });
  meta = {
    description = "Interface that rcl_logging backends needs to implement.";
  };
})
