{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kinematics_interface";
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."kinematics_interface";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp-lifecycle ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "kinematics_interface" = substituteSource {
      src = fetchgit {
        name = "kinematics_interface-source";
        url = "https://github.com/ros2-gbp/kinematics_interface-release.git";
        rev = "bcd8cb2a31c69e0b2d11889294773a9a5558bafe";
        hash = "sha256-k2nyuw8/cz0pPqYFRhXam/GSzY+fzlD2VutoDFk/AaQ=";
      };
    };
  });
  meta = {
    description = "Kinematics interface for ROS 2 control";
  };
})
