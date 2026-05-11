{
  ament-cmake-auto,
  autoware-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_qos_utils";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_qos_utils";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_qos_utils" = substituteSource {
      src = fetchgit {
        name = "autoware_qos_utils-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "65b37b712763dfc429ba2dfa7c94703783849ba2";
        hash = "sha256-W0VaA2Wx3J2TP+k9p1PWD1E6Vg8FVsWs3TAgpwOrhX4=";
      };
    };
  });
  meta = {
    description = "Autoware QoS Utils provides QoS compatibility utilities for different ROS 2 distributions.";
  };
})
