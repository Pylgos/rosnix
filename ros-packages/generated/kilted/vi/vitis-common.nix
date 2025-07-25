{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  ament-vitis,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "vitis_common";
  version = "0.4.2-4";
  src = finalAttrs.passthru.sources."vitis_common";
  nativeBuildInputs = [ ament-cmake ament-vitis ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "ocl-icd-opencl-dev" "opencl-headers" ]; };
  buildInputs = [ ament-cmake ament-vitis ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "ocl-icd-opencl-dev" "opencl-headers" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "vitis_common" = substituteSource {
      src = fetchgit {
        name = "vitis_common-source";
        url = "https://github.com/ros2-gbp/vitis_common-release.git";
        rev = "d4f14d405bfd263b812c28efcd279d7dd3caac71";
        hash = "sha256-K6BliyL56las1cA019YmPWtcy/bVEejNPaYTF7SVYic=";
      };
    };
  });
  meta = {
    description = "Common code for working with Vitis™ Unified Software Platform in ROS.";
  };
})
