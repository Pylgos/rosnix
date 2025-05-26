{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp-lifecycle,
  ros2-control-cmake,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kinematics_interface";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."kinematics_interface";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp-lifecycle ros2-control-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp-lifecycle ros2-control-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "kinematics_interface" = substituteSource {
      src = fetchgit {
        name = "kinematics_interface-source";
        url = "https://github.com/ros2-gbp/kinematics_interface-release.git";
        rev = "d8f78fd58e96c258c09dd46cdccbf06c6333929d";
        hash = "sha256-BNlaEx+cuKnup1O9Ne2KFve98mJ9BqLk/9ADT0f+Nhg=";
      };
    };
  });
  meta = {
    description = "Kinematics interface for ROS 2 control";
  };
})
