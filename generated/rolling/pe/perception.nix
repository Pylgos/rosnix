{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  image_common,
  image_pipeline,
  image_transport_plugins,
  laser_filters,
  laser_geometry,
  perception_pcl,
  rosSystemPackages,
  ros_base,
  substituteSource,
  vision_opencv,
}:
let
  sources = rec {
    perception-28fb3d7d11f2167ea52c6968256958a2eb45d0d1 = substituteSource {
      src = fetchgit {
        name = "perception-28fb3d7d11f2167ea52c6968256958a2eb45d0d1-source";
        url = "https://github.com/ros2-gbp/variants-release.git";
        rev = "28fb3d7d11f2167ea52c6968256958a2eb45d0d1";
        hash = "sha256-dm1psyuV0pFw4lLrVBcz/ElZ/T+49Lqaf1kDqahOvLs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "perception";
  version = "0.11.0-1";
  src = sources.perception-28fb3d7d11f2167ea52c6968256958a2eb45d0d1;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ image_common image_pipeline image_transport_plugins laser_filters laser_geometry perception_pcl ros_base vision_opencv ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package which aggregates common perception packages.";
  };
}
