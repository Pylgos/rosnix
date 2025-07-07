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
  version = "3.8.5-1";
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
        rev = "aec3b531edb0bdb27008fe5f300463cc646e6139";
        hash = "sha256-Pw9qhKHx1gOzZ9RJx9OO3/iXwT2+a+RIoaNrDo0Io20=";
      };
    };
  });
  meta = {
    description = "\n    Commonly used geometry routines, implemented in a ROS friendly package.\n  ";
  };
})
