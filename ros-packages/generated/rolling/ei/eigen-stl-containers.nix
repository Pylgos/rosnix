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
  version = "1.1.0-1";
  src = finalAttrs.passthru.sources."eigen_stl_containers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "eigen_stl_containers" = substituteSource {
      src = fetchgit {
        name = "eigen_stl_containers-source";
        url = "https://github.com/ros2-gbp/eigen_stl_containers-release.git";
        rev = "cc75c7c712ac409c4c2f2a0ca4078c433f335aca";
        hash = "sha256-HvDyCdPMY26yuRxRrJPckGl3mDTNx9twIZS5bqLO1/c=";
      };
    };
  });
  meta = {
    description = "This package provides a set of typedef's that allow using Eigen datatypes in STL containers";
  };
})
