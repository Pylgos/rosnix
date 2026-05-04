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
  version = "3.4.1-2";
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
        rev = "f6c589e5af2441924554e5960893214909e3b9d1";
        hash = "sha256-AvB94akWlmylEnqyP8G449GVDr3k1gE/wti5o0NVV1E=";
      };
    };
  });
  meta = {
    description = "Interface that rcl_logging backends needs to implement.";
  };
})
