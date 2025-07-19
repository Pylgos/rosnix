{
  ament-acceleration,
  ament-cmake-core,
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_vitis";
  version = "0.10.1-5";
  src = finalAttrs.passthru.sources."ament_vitis";
  propagatedNativeBuildInputs = [ ament-acceleration ament-cmake-core ament-cmake-ros ];
  propagatedBuildInputs = [ ament-acceleration ament-cmake-core ament-cmake-ros ];
  passthru.sources = mkSourceSet (sources: {
    "ament_vitis" = substituteSource {
      src = fetchgit {
        name = "ament_vitis-source";
        url = "https://github.com/ros2-gbp/ament_vitis-release.git";
        rev = "f8067810d8638568b6767770384baac30ba2230b";
        hash = "sha256-Na2vZDmx1yo4NFMDS9mmn1De1NRtjjs953gSAHRCxtc=";
      };
    };
  });
  meta = {
    description = "\n    CMake macros and utilities to include Vitis platform into the ROS 2 build system (ament) and its development flows.\n  ";
  };
})
