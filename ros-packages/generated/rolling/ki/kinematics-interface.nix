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
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."kinematics_interface";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp-lifecycle ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp-lifecycle ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "kinematics_interface" = substituteSource {
      src = fetchgit {
        name = "kinematics_interface-source";
        url = "https://github.com/ros2-gbp/kinematics_interface-release.git";
        rev = "126541b656eee700c6579f453d8f28fd00848a6c";
        hash = "sha256-VMomZtBW+WIn6Zvn8yEV0Xvqq9NUBBMOLLjg3uzDGlU=";
      };
    };
  });
  meta = {
    description = "Kinematics interface for ROS 2 control";
  };
})
