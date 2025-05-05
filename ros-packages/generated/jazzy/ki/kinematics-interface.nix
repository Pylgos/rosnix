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
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."kinematics_interface";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp-lifecycle ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "kinematics_interface" = substituteSource {
      src = fetchgit {
        name = "kinematics_interface-source";
        url = "https://github.com/ros2-gbp/kinematics_interface-release.git";
        rev = "2ffed3539f9a98bfcb3639f5e29443e57fb674a7";
        hash = "sha256-JC2R5pRc581M+NKs81WbLE1DhXSL77Fpv7oR+s/rxdo=";
      };
    };
  });
  meta = {
    description = "Kinematics interface for ROS 2 control";
  };
})
