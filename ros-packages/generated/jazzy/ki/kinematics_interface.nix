{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp_lifecycle,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    kinematics_interface-abc2ffaf360bde2bca52225ba766fdb598b1af71 = substituteSource {
      src = fetchgit {
        name = "kinematics_interface-abc2ffaf360bde2bca52225ba766fdb598b1af71-source";
        url = "https://github.com/ros2-gbp/kinematics_interface-release.git";
        rev = "abc2ffaf360bde2bca52225ba766fdb598b1af71";
        hash = "sha256-NIcnxxLBdixzZQeXN0f2g03lIQQMoKqYrwTiwVagNSE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kinematics_interface";
  version = "1.1.0-1";
  src = sources.kinematics_interface-abc2ffaf360bde2bca52225ba766fdb598b1af71;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp_lifecycle ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Kinematics interface for ROS 2 control";
  };
}
