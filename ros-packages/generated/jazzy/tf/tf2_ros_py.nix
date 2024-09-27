{
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclpy,
  rosSystemPackages,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2_msgs,
  tf2_py,
}:
let
  sources = rec {
    tf2_ros_py-4d145d4799c00815612cd8636f4ca17f8222aeeb = substituteSource {
      src = fetchgit {
        name = "tf2_ros_py-4d145d4799c00815612cd8636f4ca17f8222aeeb-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "4d145d4799c00815612cd8636f4ca17f8222aeeb";
        hash = "sha256-mVPYq8A85vSLPh6r8Qti+YKZ9dJBzIkHatfi4nndSKA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_ros_py";
  version = "0.36.4-1";
  src = sources.tf2_ros_py-4d145d4799c00815612cd8636f4ca17f8222aeeb;
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
