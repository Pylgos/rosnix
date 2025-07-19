{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "eigen_stl_containers";
  version = "1.1.0-2";
  src = finalAttrs.passthru.sources."eigen_stl_containers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "eigen_stl_containers" = substituteSource {
      src = fetchgit {
        name = "eigen_stl_containers-source";
        url = "https://github.com/ros2-gbp/eigen_stl_containers-release.git";
        rev = "4bb862d0d8b35519a1fd06a4e8ed2a0ad9c07c1a";
        hash = "sha256-HvDyCdPMY26yuRxRrJPckGl3mDTNx9twIZS5bqLO1/c=";
      };
    };
  });
  meta = {
    description = "This package provides a set of typedef's that allow\n  using Eigen datatypes in STL containers";
  };
})
