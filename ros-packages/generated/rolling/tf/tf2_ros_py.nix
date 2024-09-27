{
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2_msgs,
  tf2_py,
}:
let
  sources = mkSourceSet (sources: {
    "tf2_ros_py" = substituteSource {
      src = fetchgit {
        name = "tf2_ros_py-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "e4a5e5745a0688bc97c6ecef8c79c5710818d89a";
        hash = "sha256-8X9kRc9ajV09X+DqlvR8fAqoDa4FiqEQuYF/cCcidlE=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "tf2_ros_py";
  version = "0.38.2-1";
  src = sources."tf2_ros_py";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rclpy sensor_msgs std_msgs tf2_msgs tf2_py ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "This package contains the ROS Python bindings for the tf2 library";
  };
}
