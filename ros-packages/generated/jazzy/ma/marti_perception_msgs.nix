{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    marti_perception_msgs-d427ac464463e6d1c05701757a36af85c15f5d51 = substituteSource {
      src = fetchgit {
        name = "marti_perception_msgs-d427ac464463e6d1c05701757a36af85c15f5d51-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "d427ac464463e6d1c05701757a36af85c15f5d51";
        hash = "sha256-FZTo6sslxugGts/jf3daCxSI2sgmW4NAeYssvIrh1P8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marti_perception_msgs";
  version = "1.6.1-1";
  src = sources.marti_perception_msgs-d427ac464463e6d1c05701757a36af85c15f5d51;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime sensor_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "marti_perception_msgs";
  };
}
