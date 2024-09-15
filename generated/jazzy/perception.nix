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
    perception = substituteSource {
      src = fetchgit {
        name = "perception-source";
        url = "https://github.com/ros2-gbp/variants-release.git";
        rev = "3e52d9c0398d0dc8fd4c9fb231aa929fcd3b0a27";
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
  src = sources.perception;
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
