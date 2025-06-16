{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  tf2,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "swri_geometry_util";
  version = "3.8.4-1";
  src = finalAttrs.passthru.sources."swri_geometry_util";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ tf2 ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "geos" "libopencv-dev" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "geos" "libopencv-dev" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "swri_geometry_util" = substituteSource {
      src = fetchgit {
        name = "swri_geometry_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "eb3d69375bb630229fad7760ab7259da7682df22";
        hash = "sha256-IRaTUcOYKTOS6aA/8qx503m+3EGxbqEwPVNL/9VFLuU=";
      };
    };
  });
  meta = {
    description = "\n    Commonly used geometry routines, implemented in a ROS friendly package.\n  ";
  };
})
