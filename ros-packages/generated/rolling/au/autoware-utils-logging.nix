{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  logging-demo,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_utils_logging";
  version = "1.4.2-2";
  src = finalAttrs.passthru.sources."autoware_utils_logging";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ logging-demo rclcpp ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ logging-demo rclcpp ];
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_utils_logging" = substituteSource {
      src = fetchgit {
        name = "autoware_utils_logging-source";
        url = "https://github.com/ros2-gbp/autoware_utils-release.git";
        rev = "6847e024cbc51a9b31af6b2b1db06972a317d7e6";
        hash = "sha256-IQRBFxyWApYxYpaBEipvZopMFAhFn/YJMnO7kfnxxVs=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_logging package";
  };
})
