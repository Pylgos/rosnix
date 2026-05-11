{
  ament-cmake-auto,
  ament-cmake-ros,
  autoware-cmake,
  autoware-lint-common,
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
  pname = "autoware_node";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_node";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ rclcpp ];
  checkInputs = [ ament-cmake-ros autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_node" = substituteSource {
      src = fetchgit {
        name = "autoware_node-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "f31348a253ee16780c09b0d3760c6dc9321509dd";
        hash = "sha256-xtRg42JLSMTAnrT7eHOpaDsByqtHfhAWFid1+sFpiHw=";
      };
    };
  });
  meta = {
    description = "Autoware Node is an Autoware Core package designed to provide a base class for all nodes in the system.";
  };
})
