{
  ament-cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  image-common,
  image-pipeline,
  image-transport-plugins,
  laser-filters,
  laser-geometry,
  mkSourceSet,
  perception-pcl,
  ros-base,
  rosSystemPackages,
  substituteSource,
  vision-opencv,
}:
let
  sources = mkSourceSet (sources: {
    "perception" = substituteSource {
      src = fetchgit {
        name = "perception-source";
        url = "https://github.com/ros2-gbp/variants-release.git";
        rev = "28fb3d7d11f2167ea52c6968256958a2eb45d0d1";
        hash = "sha256-dm1psyuV0pFw4lLrVBcz/ElZ/T+49Lqaf1kDqahOvLs=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "perception";
  version = "0.11.0-1";
  src = sources."perception";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ image-common image-pipeline image-transport-plugins laser-filters laser-geometry perception-pcl ros-base vision-opencv ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package which aggregates common perception packages.";
  };
}
